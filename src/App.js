import React, { useEffect, useState } from 'react'
import { supabase } from './supabaseClient'
import './App.css'

function App() {
  const [user, setUser] = useState(null)

  useEffect(() => {
    supabase.auth.getSession().then(({ data: { session } }) => {
      setUser(session?.user ?? null)
    })

    const { data: { subscription } } = supabase.auth.onAuthStateChange((_event, session) => {
      setUser(session?.user ?? null)
    })

    return () => subscription.unsubscribe()
  }, [])

  const signInWithGoogle = async () => {
    const { error } = await supabase.auth.signInWithOAuth({
      provider: 'google'
    })
    if (error) console.log('Error:', error.message)
  }

  return (
    <div className="App">
      <header className="App-header">
        {!user ? (
          <button onClick={signInWithGoogle} className="login-button">
            Login with Google
          </button>
        ) : (
          <div>
            <p>Welcome, {user.email}</p>
            <button onClick={() => supabase.auth.signOut()}>
              Sign Out
            </button>
          </div>
        )}
      </header>
    </div>
  )
}

export default App;
