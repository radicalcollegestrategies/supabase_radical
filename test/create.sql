-- Modified from supabase user management starter
-- https://supabase.com/dashboard/project/dryszsmwxaxdmatcrdeo/sql/6ac3b8f2-0f2e-4cf2-97da-985fa3b45eb4
-- SQL is listed under https://supabase.com/docs/guides/getting-started/tutorials/with-react?queryGroups=database-method&database-method=sql

-- Preexisting users and tables
-- https://supabase.com/dashboard/project/uagwdzjvjfokluegmvgm/database/schemas?schema=auth
-- auth.users has id (uuid) and email (varchar)
-- public user already exists

-- connect public/public
-- Create radical_users table
create table radical_users (
  id uuid references auth.users primary key not null on delete cascade,
  email text not null,
  username text unique not null,
  counselor text,
  upd_time timestamp with time zone,
  constraint username_length check (char_length(username) >= 3)
);

-- Set up Row Level Security (RLS)
-- See https://supabase.com/docs/guides/auth/row-level-security for more details.
alter table radical_users
  enable row level security;

/*
create policy "Public profiles are viewable by everyone." on radical_users
  for select using (true);

create policy "Users can insert their own profile." on radical_users
  for insert with check ((select auth.uid()) = id);

create policy "Users can update own profile." on radical_users
  for update using ((select auth.uid()) = id);
*/

-- connect auth/auth
-- This trigger automatically creates a profile entry when a new user signs up via Supabase Auth.
-- See https://supabase.com/docs/guides/auth/managing-user-data#using-triggers for more details.

create function handle_new_user()
returns trigger
as $$
begin
  -- Print new.id and new.email to the PostgreSQL log
  RAISE NOTICE 'New user ID: %', new.id;
  RAISE NOTICE 'New user email: %', new.email;

  BEGIN
    insert into radical_users (id, email, username, counselor, upd_time)
    values (new.id, new.email, null, null, now());
    return new;
  EXCEPTION
    WHEN others THEN
      -- Handle the exception by printing an error message to the log
      RAISE NOTICE 'Error inserting into radical_users: %', SQLERRM;
      -- Reraise the exception so that the transaction fails
      RAISE;
  END;
end;
$$ language plpgsql security definer;

create trigger on_auth_user_created
  after insert on auth_users
  for each row execute procedure handle_new_user();

-- Test the trigger
insert into auth_users values (1, 'a@b.c');
select * from radical_users;

--------------------------------------------------------
-- # Enable logging of NOTICE level messages
-- alter role postgres set log_min_messages to notice;
-- SHOW log_min_messages;
-- Then reconnect the session
-- ^^^^^^^^^^^^ Above option didn't work ^^^^^^^^^^^
-- unset using: ALTER ROLE postgres RESET log_min_messages;
--------------------------------------------------------
-- Logging: https://supabase.com/docs/guides/telemetry/logs#logging-postgres-queries
-- Enable pgaudit extension (follow website)
-- alter role postgres set pgaudit.log to 'read, write, function, ddl';
-- For API related:
-- alter role authenticator set pgaudit.log to 'read, write, function, ddl';
-- SHOW pgaudit.log
-- Then perform fast reboot --> from project settings

-- Reset: (when in production)
-- alter role postgres reset pgaudit.log
-- alter role authenticator reset pgaudit.log

