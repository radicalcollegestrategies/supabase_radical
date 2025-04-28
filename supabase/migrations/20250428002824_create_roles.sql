-----------------------------------------------------------------
-- Access:
--   postgres       - Database superuser
--   anon           - Unauthenticated users
--   authenticated  - Logged-in users
--   service_role   - For admin/backend operations
-----------------------------------------------------------------
grant usage on schema public to postgres, anon, authenticated, service_role;
-- Grant sequence usage if you have any serial/identity columns
grant usage on all sequences in schema public to postgres, anon, authenticated, service_role;
-------TODO: REVISIT ABOVE

----------------------- TABLE: ROLES ----------------------------
-- Stores : Allowed roles. Pre-seeded completely.
-- Edit   : No one except the backend SQL
-- Select : From Admin role pages
create table public.roles (
  role_name text not null,
  constraint roles_pkey primary key (role_name)
) TABLESPACE pg_default;

grant all privileges on roles to postgres, service_role;
grant select on roles to anon, authenticated;
grant insert, update, delete on roles to authenticated;

----------------------- TABLE: RADICAL_USER ----------------------------
-- Stores : Users. Pre-seeded with 2 admin accounts
-- Edit   : Admin
-- Select : backend SQL
-- Notes  : If a user has multiple roles, they will have multiple rows in this table
create table public.radical_user (
  email text not null,
  role text not null,
  created_at timestamp with time zone not null default now(),
  constraint radical_user_pkey primary key (email, role),
  constraint radical_user_role_fkey foreign KEY (role) references roles (role)
) TABLESPACE pg_default;

grant all privileges on radical_user to postgres, service_role;
grant select on radical_user to anon, authenticated;
grant insert, update, delete on radical_user to authenticated;
