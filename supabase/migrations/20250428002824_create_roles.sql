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
  roles text[] null,
  fname text null,
  lname text null,
  phone integer null,
  email2 text null,
  created timestamp without time zone not null default now(),
  constraint radical_user_pkey primary key (email)
) TABLESPACE pg_default;

grant all privileges on radical_user to postgres, service_role;
grant select on radical_user to anon, authenticated;
grant insert, update, delete on radical_user to authenticated;

create table public.student (
  email text not null,
  parent1 text not null,
  parent2 text null,
  counselor text not null,
  gradyear integer not null,
  notes text null,
  created timestamp with time zone not null default now(),
  constraint student_pkey primary key (email),
  constraint student_email_fkey foreign KEY (email) references radical_user (email),
  constraint student_parent1_fkey foreign KEY (parent1) references radical_user (email),
  constraint student_parent2_fkey foreign KEY (parent2) references radical_user (email),
  constraint student_counselor_fkey foreign KEY (counselor) references radical_user (email)
) TABLESPACE pg_default;
-- TODO grant statements for student table