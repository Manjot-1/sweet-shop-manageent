# Sweet Shop Management System

A full-stack Sweet Shop Management System built with Svelte 5, Supabase, and shadcn-svelte components.

## Features

- ✅ User authentication (register/login)
- ✅ JWT token-based authentication
- ✅ Modern UI with shadcn-svelte components
- ✅ Responsive design with Tailwind CSS v4
- 🚧 Sweet inventory management (coming soon)
- 🚧 Purchase and restock functionality (coming soon)
- 🚧 Search and filter sweets (coming soon)
- 🚧 Admin role management (coming soon)

## Tech Stack

- **Frontend**: Svelte 5 + TypeScript + Vite
- **Database**: Supabase (PostgreSQL)
- **Authentication**: Supabase Auth (JWT)
- **UI Components**: shadcn-svelte
- **Styling**: Tailwind CSS v4



## Setup Instructions

### 1. Create a Supabase Project

1. Go to [supabase.com](https://supabase.com) and create a new account or sign in
2. Click "New Project"
3. Fill in your project details:
   - Name: sweet-shop (or any name you prefer)
   - Database Password: Choose a strong password
   - Region: Select the closest region to you
4. Click "Create new project" and wait for it to finish setting up

### 2. Set Up the Database

1. In your Supabase dashboard, go to the **SQL Editor** (left sidebar)
2. Create a new query
3. Copy the contents of `supabase-schema.sql` from this project
4. Paste it into the SQL editor
5. Click "Run" to execute the schema
6. Verify the tables were created by going to **Table Editor**

### 3. Get Your Supabase Credentials

1. In your Supabase dashboard, go to **Project Settings** (gear icon in sidebar)
2. Click on **API** in the settings menu
3. You'll see:
   - **Project URL** - Copy this
   - **Project API keys** - Copy the `anon` `public` key

### 4. Configure Environment Variables

1. In the project root, create a `.env` file:
   ```bash
   cp .env.example .env
   ```

2. Edit `.env` and add your Supabase credentials:
   ```env
   VITE_SUPABASE_URL=your-project-url-here
   VITE_SUPABASE_ANON_KEY=your-anon-key-here
   ```

### 5. Install Dependencies

```bash
npm install
```

### 6. Run the Development Server

```bash
npm run dev
```

The application will be available at `http://localhost:5173`

## Usage

### First Time Setup

1. Open the app in your browser
2. Click "Don't have an account? Sign up"
3. Enter your email and password (minimum 6 characters)
4. Check your email for a confirmation link
5. Click the confirmation link
6. Return to the app and sign in with your credentials

### Authentication Flow

- The app will automatically redirect you to the login page if you're not authenticated
- After signing in, you'll see the dashboard
- Click "Sign Out" to log out

## Next Steps

The following features are ready to be implemented:

1. **Sweet Management**
   - Add new sweets (POST /api/sweets)
   - View all sweets (GET /api/sweets)
   - Update sweet details (PUT /api/sweets/:id)
   - Delete sweets - Admin only (DELETE /api/sweets/:id)

2. **Inventory Management**
   - Purchase sweets (decrease quantity)
   - Restock sweets (increase quantity) - Admin only

3. **Search & Filter**
   - Search by name, category, or price range

4. **Admin Features**
   - Role-based access control
   - Admin dashboard

## Database Schema

### Users Table
- `id` (UUID, Primary Key)
- `email` (TEXT)
- `role` (TEXT: 'user' or 'admin')
- `created_at` (TIMESTAMP)

### Sweets Table
- `id` (UUID, Primary Key)
- `name` (TEXT)
- `category` (TEXT)
- `price` (DECIMAL)
- `quantity` (INTEGER)
- `created_at` (TIMESTAMP)
- `updated_at` (TIMESTAMP)

## API Endpoints (To Be Implemented)

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user

### Sweets (Protected)
- `POST /api/sweets` - Add a new sweet
- `GET /api/sweets` - Get all sweets
- `GET /api/sweets/search` - Search sweets
- `PUT /api/sweets/:id` - Update sweet
- `DELETE /api/sweets/:id` - Delete sweet (Admin only)

### Inventory (Protected)
- `POST /api/sweets/:id/purchase` - Purchase sweet
- `POST /api/sweets/:id/restock` - Restock sweet (Admin only)

## Development Notes

- The project uses Svelte 5's new runes syntax
- Tailwind CSS v4 is configured with shadcn-svelte components
- Path aliases are configured (`$lib` → `src/lib`)
- Row Level Security (RLS) is enabled on all tables

## Troubleshooting

### "Missing Supabase environment variables" error
- Make sure you've created the `.env` file
- Verify that your environment variables are correctly set
- Restart the dev server after adding environment variables

### Authentication not working
- Check that you've run the database schema in Supabase
- Verify your Supabase URL and anon key are correct
- Check the browser console for detailed error messages

### Styling issues
- Make sure all dependencies are installed: `npm install`
- Try clearing the cache and rebuilding: `rm -rf node_modules && npm install`

## License

MIT
