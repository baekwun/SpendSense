# SpendSense 💸

A personal finance PWA for tracking income, expenses, payslips, and savings goals — built to work offline-first and sync to Google Sheets.

---

## What it does

- **Ledger** — log income and expenses by category, grouped by day. Tap any entry to see details.
- **Payslip tracker** — enter your payslip (basic pay, deductions, absences, OT, etc.) and get your net pay calculated automatically including all standard deductions.
- **GoTyme bucket split** — any income can be automatically split across your named savings buckets by percentage, so you always know exactly how much goes where.
- **Graphs** — donut charts for expense breakdown and income sources, bar chart for income vs expense per month, and a net flow line across 6 months.
- **Offline-first** — all data is stored locally on your device via IndexedDB. Entries made without internet are tagged and auto-sync to Google Sheets when you're back online.
- **PWA** — installable on Android and iOS. Opens fullscreen with no browser UI, feels like a native app.

---

## Stack

| Layer | Tech |
|---|---|
| Frontend | Vanilla HTML/CSS/JS |
| Local storage | IndexedDB |
| Offline | Service Worker |
| Backend sync | Google Apps Script |
| Database | Google Sheets |
| Hosting | GitHub Pages |

No frameworks. No dependencies. No npm. Just files.

---

## Features

### Income entry
- Categories: Salary, Incentive, Extra Income, Allotment, Freelance, Gift
- Toggle **"Apply GoTyme split?"** to include or exclude from bucket calculation
- Excluded income still logs normally and shows in graphs — just no bucket breakdown

### Payslip entry
Fields mirror a standard Philippine payslip:
- **ADD:** OT, Holidays
- **DED:** SSS, HDMF (Pag-IBIG), PhilHealth, WTAX, Loans
- **LESS:** Tardiness, Undertime, Absences
- **ADJ:** SLRY/HLDY
- ₱25 fixed deduction auto-applied on every payslip
- NET computed live as you type

### GoTyme buckets
- Fully editable — change name, percentage, and color per bucket
- Add or delete buckets freely
- Total must equal exactly 100% to save
- Split preview shown before saving any income entry

### Offline sync
- Entries saved offline show an amber dot indicator
- Auto-syncs to Google Sheets when internet is restored
- Background sync via Service Worker SyncManager when supported

---

## Setup

### 1. Fork or download this repo

Upload these 3 files to your GitHub repo:
- `index.html`
- `sw.js`
- `manifest.json`

### 2. Enable GitHub Pages
Go to **Settings → Pages → Deploy from branch → main / root** and save.

Your app will be live at:
```
https://YOUR_USERNAME.github.io/spendsense
```

### 3. Set up Google Apps Script (optional, for sync)
1. Create a new Google Sheet — name it anything (e.g. `SpendSense.db`)
2. Go to **Extensions → Apps Script**
3. Paste the contents of `Code.gs`
4. Deploy as **Web app** — Execute as: Me, Access: Anyone
5. Copy the web app URL

### 4. Configure the app
1. Open SpendSense in your browser
2. Go to **Settings**
3. Paste your GAS URL into the API field
4. Save — done, you never need to do this again

### 5. Install as PWA (Android / Brave)
1. Open the GitHub Pages URL in Brave or Chrome
2. Tap **⋮ menu → Add to Home Screen**
3. Opens fullscreen from your home screen like a native app

---

## Privacy

- All data is stored locally on your device (IndexedDB)
- Google Sheets sync is optional — the app works fully offline without it
- No third-party services, no analytics, no ads
- Your GAS URL acts as your private key — don't share it

---

## License

Personal use. Feel free to fork and adapt for your own needs.
