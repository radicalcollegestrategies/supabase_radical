import { createClient } from '@supabase/supabase-js'

let supabaseUrl, supabaseAnonKey

// Clean the environment variable to remove whitespaces
const env = process.env.REACT_APP_ENV?.trim().toLowerCase()

switch (env) {
  case 'dev':
    supabaseUrl = process.env.REACT_APP_DEV_SUPABASE_URL
    supabaseAnonKey = process.env.REACT_APP_DEV_SUPABASE_ANON_KEY
    break
  case 'local':
  default:
    supabaseUrl = process.env.REACT_APP_LOCAL_SUPABASE_URL
    supabaseAnonKey = process.env.REACT_APP_LOCAL_SUPABASE_ANON_KEY
    break
  }

// console.log('ENV:', env)
// console.log('URL:', supabaseUrl)

export const supabase = createClient(supabaseUrl, supabaseAnonKey)
