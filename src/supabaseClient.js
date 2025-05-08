import { createClient } from '@supabase/supabase-js'

let supabaseUrl, supabaseAnonKey

switch (process.env.REACT_APP_ENV) {
  case 'dev':
    supabaseUrl = process.env.REACT_APP_DEV_SUPABASE_URL
    supabaseAnonKey = process.env.REACT_APP_DEV_SUPABASE_ANON_KEY
  case 'local':
  default:
      supabaseUrl = process.env.REACT_APP_LOCAL_SUPABASE_URL
    supabaseAnonKey = process.env.REACT_APP_LOCAL_SUPABASE_ANON_KEY
    break
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey)