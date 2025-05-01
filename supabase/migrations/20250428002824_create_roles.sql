-----------------------------------------------------------------
-- Access:
--   postgres       - Database superuser
--   service_role   - For admin/backend operations, including edge functions
--   anon           - Unauthenticated users
--   authenticated  - Logged-in users
-----------------------------------------------------------------

create type roles_t as enum (
  'admin',
  'counselor_hs', 'counselor_ca', 'essay_editor', 
  'parent', 'student_hs', 'student_ca'
);

----------------------- TABLE: RADICAL_USER ----------------------------
-- Note: Pre-seeded with 2 admin accounts
create table public.radical_user (
  email       text    not null primary key,
  roles       roles_t[] null,
  first_name  text    null,
  last_name   text    null,
  phone       int8    null,
  email2      text    null,
  created timestamp with time zone not null default now()
) TABLESPACE pg_default;

------------------------- TABLE SECURITY ------------------------------

-- Enable RLS
alter table public.radical_user enable row level security;

-- Grant access to the table
grant select on public.radical_user to anon, authenticated;
grant insert, update, delete on public.radical_user to authenticated;

-- Admins can view/edit all data
create policy "radical_user: Admins can view/edit all data"
  on public.radical_user
  for all
  using (
    exists (
      select 1 from public.radical_user
      where email = auth.email()
      and 'admin' = any(roles)
    )
  );

-- Allow users to view and update their own data
create policy "radical_user: Users can view own data"
  on public.radical_user
  for select
  using (auth.email() = email);

create policy "radical_user: Users can update own data"
  on public.radical_user
  for update
  using (auth.email() = email)
  with check (auth.email() = email); -- checks that the new row complies with the policy

----------------------- TABLE: STUDENT ----------------------------
create table public.student (
  email     text not null primary key references radical_user (email),
  parent1   text not null references radical_user (email),
  parent2   text null     references radical_user (email),
  counselor text not null references radical_user (email),
  gradyear  int4 not null,
  notes     text null,
  created   timestamp with time zone not null default now()
) TABLESPACE pg_default;

------------------------- TABLE SECURITY ------------------------------
-- Enable RLS on base table with admin-only access
alter table public.student enable row level security;

-- Grant access to the base table - admin only
grant select, insert, update, delete on public.student to authenticated;

-- Admins can view/edit all data
create policy "student: Only admins can view/edit"
  on public.student
  for all
  using (
    exists (
      select 1 from public.radical_user
      where email = auth.email()
      and 'admin' = any(roles)
    )
  );
