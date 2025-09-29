// Supabase client configuration
import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/+esm';

/*
 * To set up Supabase for this project:
 * 
 * 1. Go to https://app.supabase.com/ and create a new project
 * 2. Once your project is created, go to Project Settings > API
 * 3. Copy your Project URL and Project API Key (anon, public key)
 * 4. Replace the placeholder values below with your actual Supabase credentials
 */

// Replace these with your actual Supabase project URL and anon key
const SUPABASE_URL = 'YOUR_SUPABASE_URL'; // e.g., 'https://your-project.supabase.co'
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY'; // e.g., 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...'

// Create a single supabase client for the whole app
export const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);