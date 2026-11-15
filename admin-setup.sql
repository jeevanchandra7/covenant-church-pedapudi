-- Run this once in Supabase Dashboard > SQL Editor after the church admin
-- has created an account and confirmed its email.

create table if not exists public.site_admins (
  user_id uuid primary key references auth.users(id) on delete cascade,
  created_at timestamptz not null default now()
);

create table if not exists public.site_content (
  id text primary key check (id = 'main'),
  content jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

create table if not exists public.members (
  id uuid primary key default gen_random_uuid(),
  full_name text not null,
  category text not null check (category in ('Men', 'Women', 'Youth')),
  age smallint check (age is null or age between 1 and 120),
  gender text not null default 'Prefer not to say' check (gender in ('Male', 'Female', 'Prefer not to say')),
  role text not null default '',
  description text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
alter table public.members add column if not exists age smallint;
alter table public.members add column if not exists gender text not null default 'Prefer not to say';

alter table public.site_admins enable row level security;
alter table public.site_content enable row level security;
alter table public.members enable row level security;
grant select on public.site_admins to authenticated;
grant select on public.site_content to anon, authenticated;
grant insert, update on public.site_content to authenticated;
grant select on public.members to authenticated;
grant insert, update, delete on public.members to authenticated;

drop policy if exists "Admins can read their own access" on public.site_admins;
create policy "Admins can read their own access"
  on public.site_admins for select to authenticated
  using (user_id = (select auth.uid()));

drop policy if exists "Anyone can read published site content" on public.site_content;
create policy "Anyone can read published site content"
  on public.site_content for select to anon, authenticated
  using (true);

drop policy if exists "Admins can insert site content" on public.site_content;
create policy "Admins can insert site content"
  on public.site_content for insert to authenticated
  with check (exists (
    select 1 from public.site_admins
    where site_admins.user_id = (select auth.uid())
  ));

drop policy if exists "Admins can update site content" on public.site_content;
create policy "Admins can update site content"
  on public.site_content for update to authenticated
  using (exists (
    select 1 from public.site_admins
    where site_admins.user_id = (select auth.uid())
  ))
  with check (exists (
    select 1 from public.site_admins
    where site_admins.user_id = (select auth.uid())
  ));

drop policy if exists "Signed-in church members can view directory" on public.members;
drop policy if exists "Admins can view members" on public.members;
create policy "Admins can view members"
  on public.members for select to authenticated
  using (exists (
    select 1 from public.site_admins
    where site_admins.user_id = (select auth.uid())
  ));

drop policy if exists "Admins can add directory members" on public.members;
create policy "Admins can add directory members"
  on public.members for insert to authenticated
  with check (exists (
    select 1 from public.site_admins
    where site_admins.user_id = (select auth.uid())
  ));

drop policy if exists "Admins can update directory members" on public.members;
create policy "Admins can update directory members"
  on public.members for update to authenticated
  using (exists (
    select 1 from public.site_admins
    where site_admins.user_id = (select auth.uid())
  ))
  with check (exists (
    select 1 from public.site_admins
    where site_admins.user_id = (select auth.uid())
  ));

drop policy if exists "Admins can remove directory members" on public.members;
create policy "Admins can remove directory members"
  on public.members for delete to authenticated
  using (exists (
    select 1 from public.site_admins
    where site_admins.user_id = (select auth.uid())
  ));

insert into storage.buckets (id, name, public)
values ('church-gallery', 'church-gallery', true)
on conflict (id) do nothing;

drop policy if exists "Public can view church gallery" on storage.objects;
create policy "Public can view church gallery"
  on storage.objects for select to anon, authenticated
  using (bucket_id = 'church-gallery');

drop policy if exists "Church admins upload gallery photos" on storage.objects;
create policy "Church admins upload gallery photos"
  on storage.objects for insert to authenticated
  with check (
    bucket_id = 'church-gallery'
    and exists (select 1 from public.site_admins
      where site_admins.user_id = (select auth.uid()))
  );

drop policy if exists "Church admins update gallery photos" on storage.objects;
create policy "Church admins update gallery photos"
  on storage.objects for update to authenticated
  using (
    bucket_id = 'church-gallery'
    and exists (select 1 from public.site_admins
      where site_admins.user_id = (select auth.uid()))
  )
  with check (
    bucket_id = 'church-gallery'
    and exists (select 1 from public.site_admins
      where site_admins.user_id = (select auth.uid()))
  );

drop policy if exists "Church admins remove gallery photos" on storage.objects;
create policy "Church admins remove gallery photos"
  on storage.objects for delete to authenticated
  using (
    bucket_id = 'church-gallery'
    and exists (select 1 from public.site_admins
      where site_admins.user_id = (select auth.uid()))
  );

-- After the administrator has signed up and confirmed this email, grant editor access:
insert into public.site_admins (user_id)
select id from auth.users
where lower(email) = lower('jeevanchandra.lifecare@gmail.com')
on conflict (user_id) do nothing;
