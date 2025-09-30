# Supabase Integration Instructions

This document explains how to set up and use Supabase to persist your cronograma data.

## Prerequisites

1. You need to create a Supabase account at [https://app.supabase.com/](https://app.supabase.com/)
2. Create a new Supabase project

## Setup Instructions

### 1. Create a Supabase Project

1. Go to [https://app.supabase.com/](https://app.supabase.com/) and sign up or log in
2. Click "New Project"
3. Enter a name for your project (e.g., "cronograma-usf-apipucos")
4. Select a region closest to you
5. Set a database password (save this somewhere safe)
6. Click "Create New Project" and wait for it to be provisioned

### 2. Get Your Supabase Credentials

1. After your project is created, go to the "Project Settings" (gear icon)
2. Click on "API" in the sidebar
3. Copy your "Project URL" and "Project API Keys" (use the public/anon key)

### 3. Configure the Application

1. Open the `index.html` file in your project
2. Find the Supabase configuration section (around line 755):
   ```javascript
   const SUPABASE_URL = 'YOUR_SUPABASE_URL'; // e.g., 'https://your-project.supabase.co'
   const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY'; // e.g., 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...'
   ```
3. Replace the placeholder values with your actual Supabase credentials:
   ```javascript
   const SUPABASE_URL = 'https://your-project.supabase.co';
   const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';
   ```

### 4. Create the Database Schema

1. In your Supabase dashboard, go to "Table Editor"
2. Click "New Table" and then "SQL Editor"
3. Copy and paste the contents of `supabase-schema.sql` into the SQL editor
4. Click "Run" to execute the SQL commands

### 5. Test the Integration

1. Open your cronograma application in a browser
2. Click the "Editar Cronograma" button
3. Make some changes to the schedule
4. Click "Salvar Alterações"
5. Refresh the page to verify that your changes persist

## How It Works

The integration works as follows:

1. When the application loads, it first tries to fetch data from Supabase
2. If no data is found in Supabase, it falls back to the local `cronograma-dados.json` file
3. When you save changes, the data is stored in Supabase
4. A backup is also saved to localStorage for redundancy

## Troubleshooting

### Common Issues

1. **"Supabase is not defined" error**: Make sure you've correctly configured your Supabase credentials in `index.html`

2. **Data not saving**: Check that you've created the database schema correctly

3. **Network errors**: Ensure your Supabase project is active and you're using the correct credentials

### Checking Data in Supabase

1. Go to your Supabase dashboard
2. Navigate to "Table Editor"
3. You should see a `schedule_data` table with your cronograma data

## Security Notes

The current implementation uses the public/anon key which allows read and write access. For production use, you should:

1. Set up proper Row Level Security (RLS) policies
2. Consider implementing user authentication
3. Use service keys for server-side operations

## Support

If you encounter any issues, please check the browser console for error messages and refer to the Supabase documentation at [https://supabase.com/docs](https://supabase.com/docs).