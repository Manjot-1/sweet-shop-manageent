# Quick Start Guide 🚀

Get your Sweet Shop up and running in 5 minutes!

## Prerequisites
- Node.js installed
- A Supabase account (free at [supabase.com](https://supabase.com))

## Step 1: Create Supabase Project (2 minutes)

1. Go to https://supabase.com/dashboard
2. Click **"New Project"**
3. Fill in:
   - **Name**: `sweet-shop`
   - **Database Password**: (create a strong password)
   - **Region**: (choose closest to you)
4. Click **"Create new project"** and wait ~2 minutes

## Step 2: Set Up Database (1 minute)

1. In Supabase dashboard, click **"SQL Editor"** (left sidebar)
2. Click **"New query"**
3. Open `supabase-schema.sql` in this project
4. Copy ALL the SQL code
5. Paste it in the Supabase SQL editor
6. Click **"Run"** (or press Cmd/Ctrl + Enter)
7. You should see "Success. No rows returned"

## Step 3: Get Your Credentials (30 seconds)

1. Click the **Settings** icon (gear) in the left sidebar
2. Click **"API"**
3. Copy these two values:
   - **Project URL** (looks like: `https://xxx.supabase.co`)
   - **anon public** key (under "Project API keys")

## Step 4: Configure Environment (30 seconds)

1. In your project folder, create `.env` file:
   ```bash
   cp .env.example .env
   ```

2. Open `.env` and paste your credentials:
   ```env
   VITE_SUPABASE_URL=https://your-project.supabase.co
   VITE_SUPABASE_ANON_KEY=your-anon-key-here
   ```

## Step 5: Run the App! (30 seconds)

```bash
npm run dev
```

Open http://localhost:5173 in your browser!

## What You'll See

1. A beautiful login/signup form
2. Click **"Don't have an account? Sign up"**
3. Enter your email and password
4. Check your email for confirmation
5. Click the confirmation link
6. Sign in and see the dashboard!

## Troubleshooting

### Error: "Missing Supabase environment variables"
- Make sure you created `.env` file
- Check that values are correct (no quotes needed)
- Restart the dev server

### Email not arriving?
- Check spam folder
- Wait 2-3 minutes
- Check Supabase Auth logs in dashboard

### Other issues?
- Check `SETUP_COMPLETE.md` for detailed troubleshooting
- Check browser console (F12) for errors
- Check `README.md` for full documentation

## What's Next?

Now that authentication works, you can start building:
1. Sweet inventory management
2. Add/edit/delete sweets
3. Purchase & restock functionality
4. Search & filters

Check `SETUP_COMPLETE.md` for the full roadmap!

---

**Need help?** Check the main `README.md` or `SETUP_COMPLETE.md` for detailed information.
