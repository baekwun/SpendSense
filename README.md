# SpendSense 💸
A personal finance PWA for tracking income, expenses, payslips, savings goals, and account balances — built offline-first, syncs to Supabase.

---

## What it does

- **Ledger** — log income and expenses by category, grouped by day. Entries within each day are sorted by time logged (latest at the top). Tap any entry to see details.
- **Payslip tracker** — enter your payslip (basic pay, deductions, absences, OT, etc.) and get your net pay calculated automatically. Supports savings split and account assignment.
- **Savings buckets** — any income or payslip can be split across named savings buckets by percentage. You can also add to or **withdraw from** a bucket directly via the Bucket entry type.
- **Transfers** — move money between accounts with a single entry. Recorded as Transfer Out on the source and Transfer In on the destination — neutral to your income/expense totals.
- **Accounts** — track balances across cash, bank, e-wallet, cards, and more. Balances auto-update when transactions are linked to an account.
- **Graphs** — donut charts for expense breakdown and income sources, bar chart for income vs expense per month, and a net flow line across 6 months.
- **Offline-first** — all data stored locally via IndexedDB. Entries made without internet are tagged and auto-synced to Supabase when you're back online.
- **PWA** — installable on Android and iOS. Opens fullscreen with no browser UI.

---

## Stack

| Layer | Tech |
|---|---|
| Frontend | Vanilla HTML/CSS/JS |
| Local storage | IndexedDB |
| Offline | Service Worker |
| Backend sync | Supabase (PostgreSQL REST API) |
| Hosting | GitHub Pages |

No frameworks. No dependencies. No npm. Just files.

---

## Features

### Entry types
- **− Expense** — deduct from balance, optionally deduct from savings buckets (apply split)
- **+ Income** — add to balance, optionally split across savings buckets
- **📄 Payslip** — structured payslip entry with ADD/DED/LESS/ADJ sections; net auto-computed; supports savings split and account assignment
- **🪣 Bucket** — add to or withdraw from a specific savings bucket; withdraw toggle subtracts from the bucket balance
- **⇄ Transfer** — move an amount between two accounts; neutral to income/expense summary

### Payslip fields
- **ADD:** OT, Holidays, SLRY/HLDY
- **DED:** SSS, HDMF (Pag-IBIG), PhilHealth, Miscellaneous, Loans
- **LESS:** Tardiness, Undertime, Absences
- NET computed live as you type

### Savings buckets
- Fully editable — name, percentage, color per bucket
- Add or delete buckets freely; total must equal 100%
- Split preview shown before saving any income/payslip entry
- Withdraw toggle on Bucket entries subtracts from the bucket balance

### Transfers
- Select **From Account** and **To Account**
- Creates two linked entries: Transfer Out (debit) and Transfer In (credit)
- Excluded from income/expense/balance totals — purely an account movement

### Ledger sorting
- Entries grouped by date, days sorted newest first
- Within each day, entries sorted by time of entry (latest first) using ISO timestamp

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
https://YOUR_USERNAME.github.io/SpendSense
```

### 3. Set up Supabase (required for sync)

1. Go to [supabase.com](https://supabase.com) → New Project (free tier)
2. In **SQL Editor**, run the contents of `supabase_setup.sql`
3. Go to **Settings → API Keys** → copy the **Publishable key** and the **Project URL**

### 4. Configure the app

1. Open SpendSense in your browser
2. Go to **Settings**
3. Paste your **Supabase Project URL** and **Publishable Key**
4. Tap **Save Settings** — done

### 5. Install as PWA (Android / Brave / Chrome)
1. Open the GitHub Pages URL
2. Tap **⋮ menu → Add to Home Screen**
3. Opens fullscreen from your home screen like a native app

---

## Privacy
- All data stored locally on your device (IndexedDB) first
- Supabase sync is optional but recommended for multi-device use and backup
- No third-party analytics, no ads
- Your Supabase anon key is safe to use in the browser (Row Level Security is enabled)

---

## License
Personal use. Feel free to fork and adapt for your own needs.
