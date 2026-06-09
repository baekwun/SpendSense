-- ============================================================
-- SpendSense — Supabase Database Setup
-- Run this in: Supabase Dashboard → SQL Editor → New Query
-- ============================================================

-- 1. TRANSACTIONS table
create table if not exists transactions (
  id            text primary key,
  date          text,
  type          text default 'expense',
  category      text default 'other',
  description   text,
  amount        numeric(12,2) default 0,
  apply_split   boolean default false,
  payslip_data  text,
  savings_bucket_snapshot text,
  notes         text,
  created_at    text,
  updated_at    timestamptz default now()
);

-- 2. BUCKETS table
create table if not exists buckets (
  id      text primary key,
  name    text,
  percent numeric(5,2) default 0,
  color   text default '#818cf8',
  active  boolean default true
);

-- 3. SETTINGS table
create table if not exists settings (
  key   text primary key,
  value text
);

-- 4. Seed default settings
insert into settings (key, value) values
  ('war_chest_goal',  '100000'),
  ('war_chest_saved', '0'),
  ('currency',        '₱'),
  ('name',            'kmendoza')
on conflict (key) do nothing;

-- 5. Seed default buckets
insert into buckets (id, name, percent, color, active) values
  ('bk1', 'SAVINGS',     20, '#818cf8', true),
  ('bk2', 'BILLS',       15, '#f87171', true),
  ('bk3', 'INVESTMENTS', 10, '#fbbf24', true),
  ('bk4', 'FUN',          5, '#4ade80', true),
  ('bk5', 'DAILY OPS',   50, '#60a5fa', true)
on conflict (id) do nothing;

-- 6. Enable Row Level Security but allow public anon access
--    (safe because anon key is read/write scoped, not admin)
alter table transactions enable row level security;
alter table buckets      enable row level security;
alter table settings     enable row level security;

create policy "allow all" on transactions for all using (true) with check (true);
create policy "allow all" on buckets      for all using (true) with check (true);
create policy "allow all" on settings     for all using (true) with check (true);
