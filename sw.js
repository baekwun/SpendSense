const CACHE = 'spendsense-v4';
const ASSETS = ['/', '/index.html', '/manifest.json'];

self.addEventListener('install', e => {
  e.waitUntil(caches.open(CACHE).then(c => c.addAll(ASSETS)));
  self.skipWaiting();
});

self.addEventListener('activate', e => {
  e.waitUntil(caches.keys().then(keys =>
    Promise.all(keys.filter(k => k !== CACHE).map(k => caches.delete(k)))
  ));
  self.clients.claim();
});

self.addEventListener('fetch', e => {
  if (e.request.url.includes('supabase.co') || e.request.url.includes('fonts.')) return;
  e.respondWith(
    fetch(e.request).then(res => {
      const clone = res.clone();
      caches.open(CACHE).then(c => c.put(e.request, clone));
      return res;
    }).catch(() => caches.match(e.request))
  );
});

// Background sync: notify any open tabs to push pending data
// If no tabs are open, they'll sync automatically on next open via init()
self.addEventListener('sync', e => {
  if (e.tag === 'ss-sync') {
    e.waitUntil(
      self.clients.matchAll({ includeUncontrolled: true, type: 'window' }).then(clients => {
        if (clients.length > 0) {
          clients.forEach(c => c.postMessage({ type: 'SYNC_NOW' }));
        }
        // If no clients open, sync will happen automatically when app is next opened
        // because init() always calls syncPending() on load when online
      })
    );
  }
});
