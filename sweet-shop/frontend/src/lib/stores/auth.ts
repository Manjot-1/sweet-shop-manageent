import { writable } from 'svelte/store';
import type { User, Session } from '@supabase/supabase-js';
import { supabase } from '$lib/supabase';

interface AuthState {
  user: User | null;
  session: Session | null;
  loading: boolean;
}

function createAuthStore() {
  const { subscribe, set, update } = writable<AuthState>({
    user: null,
    session: null,
    loading: true
  });

  return {
    subscribe,
    init: async () => {
      // Get initial session
      const { data: { session } } = await supabase.auth.getSession();
      set({
        user: session?.user ?? null,
        session: session ?? null,
        loading: false
      });

      // Listen for auth changes
      supabase.auth.onAuthStateChange((_event, session) => {
        set({
          user: session?.user ?? null,
          session: session ?? null,
          loading: false
        });
      });
    },
    signUp: async (email: string, password: string) => {
      const { data, error } = await supabase.auth.signUp({
        email,
        password
      });
      return { data, error };
    },
    signIn: async (email: string, password: string) => {
      const { data, error } = await supabase.auth.signInWithPassword({
        email,
        password
      });
      return { data, error };
    },
    signOut: async () => {
      const { error } = await supabase.auth.signOut();
      if (!error) {
        set({ user: null, session: null, loading: false });
      }
      return { error };
    }
  };
}

export const authStore = createAuthStore();
