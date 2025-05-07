import { createClient } from '@supabase/supabase-js'

const isLocal = process.env.REACT_APP_ENV === 'local'

const supabaseUrl = isLocal 
  ? process.env.REACT_APP_LOCAL_SUPABASE_URL 
  : process.env.REACT_APP_DEV_SUPABASE_URL

const supabaseAnonKey = isLocal 
  ? process.env.REACT_APP_LOCAL_SUPABASE_ANON_KEY 
  : process.env.REACT_APP_DEV_SUPABASE_ANON_KEY

export const supabase = createClient(supabaseUrl, supabaseAnonKey)