# SpendSense 💸
A personal finance PWA for tracking income, expenses, payslips, and savings goals — built to work offline-first and sync to Supabase.

---

## What it does
- **Ledger** — log income and expenses by category, grouped by day. Tap any entry to see details.
- **Payslip tracker** — enter your payslip (basic pay, deductions, absences, OT, etc.) and get your net pay calculated automatically including all standard deductions.
- **Savings bucket split** — any income can be automatically split across your named savings buckets by percentage, so you always know exactly how much goes where.
- **Graphs** — donut charts for expense breakdown and income sources, bar chart for income vs expense per month, and a net flow line across 6 months.
- **Offline-first** — all data is stored locally on your device via IndexedDB. Entries made without internet are tagged and auto-sync to Supabase when you're back online.
- **PWA** — installable on Android and iOS. Opens fullscreen with no browser UI, feels like a native app.

---

## Stack
| Layer | Tech |
|---|---|
| Frontend | Vanilla HTML/CSS/JS |
| Local storage | IndexedDB |
| Offline | Service Worker |
| Backend sync | Supabase |
| Database | Supabase (PostgreSQL) |
| Hosting | GitHub Pages |

No frameworks. No dependencies. No npm. Just files.

---

## Features

### Income entry
- Categories: Salary, Incentive, Extra Income, Allotment, Freelance, Gift
- Toggle **"Apply savings split?"** to include or exclude from bucket calculation
- Excluded income still logs normally and shows in graphs — just no bucket breakdown

### Payslip entry
Fields mirror a standard Philippine payslip:
- **ADD:** OT, Holidays
- **DED:** SSS, HDMF (Pag-IBIG), PhilHealth, MISC, Loans
- **LESS:** Tardiness, Undertime, Absences
- **ADJ:** SLRY/HLDY
- NET computed live as you type

### Savings buckets
- Fully editable — change name, percentage, and color per bucket
- Add or delete buckets freely
- Total must equal exactly 100% to save
- Split preview shown before saving any income entry

### Offline sync
- Entries saved offline show an amber dot indicator
- Auto-syncs to Supabase when internet is restored
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

### 3. Set up Supabase
1. Go to [supabase.com](https://supabase.com) and create a free account
2. Create a new project — name it anything (e.g. `spendsense`)
3. Once the project is ready, go to **SQL Editor → New Query**
4. Paste the contents of `supabase_setup.sql` and click **Run**
   - This creates the `transactions`, `buckets`, and `settings` tables
   - Seeds your default buckets and settings
   - Enables Row Level Security with public anon access
5. Go to **Project Settings → API** and copy:
   - **Project URL** (looks like `https://xxxxxxxxxxxx.supabase.co`)
   - **Anon public key** (the long `eyJ...` string under *Project API keys*)

### 4. Configure the app
1. Open SpendSense in your browser
2. Go to **Settings**
3. Paste your **Supabase Project URL** and **Supabase Anon Key** into the respective fields
4. Save — done, you never need to do this again

> **Note:** The anon key is safe to use client-side. It's scoped to the Row Level Security policies defined in the SQL file — it cannot access anything outside your project tables.

### 5. Install as PWA (Android / Brave)
1. Open the GitHub Pages URL in Brave or Chrome
2. Tap **⋮ menu → Add to Home Screen**
3. Opens fullscreen from your home screen like a native app

---

## Default buckets
The SQL setup seeds a few starter buckets out of the box — they're just examples to get you going. Rename, recolor, delete, or add your own inside the app after setup. The only rule is the total must equal 100%.

| Bucket | Example use |
|---|---|
| Savings | Emergency fund, long-term goals |
| Bills | Rent, utilities, subscriptions |
| Daily Ops | Food, transport, everyday spending |
| Investments | Stocks, crypto, funds |
| Fun | Hobbies, dining out, travel |

---

## Privacy
- All data is stored locally on your device (IndexedDB)
- Supabase sync is optional — the app works fully offline without it
- No third-party services, no analytics, no ads
- Your Supabase anon key is scoped only to your project — don't share your Project URL + key combination publicly if you want to keep your data private

---

## License
Personal use. Feel free to fork and adapt for your own needs.
