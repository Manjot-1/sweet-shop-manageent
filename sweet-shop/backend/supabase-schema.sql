-- Create users table (extends Supabase auth.users)
CREATE TABLE IF NOT EXISTS public.users (
  id UUID REFERENCES auth.users ON DELETE CASCADE PRIMARY KEY,
  email TEXT NOT NULL,
  role TEXT NOT NULL DEFAULT 'user' CHECK (role IN ('user', 'admin')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

-- Users can read their own data
CREATE POLICY "Users can read own data"
  ON public.users
  FOR SELECT
  USING (auth.uid() = id);

-- Create sweets table
CREATE TABLE IF NOT EXISTS public.sweets (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
  quantity INTEGER NOT NULL DEFAULT 0 CHECK (quantity >= 0),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE public.sweets ENABLE ROW LEVEL SECURITY;

-- Anyone authenticated can read sweets
CREATE POLICY "Authenticated users can read sweets"
  ON public.sweets
  FOR SELECT
  TO authenticated
  USING (true);

-- Only authenticated users can insert sweets
CREATE POLICY "Authenticated users can insert sweets"
  ON public.sweets
  FOR INSERT
  TO authenticated
  WITH CHECK (true);

-- Only authenticated users can update sweets
CREATE POLICY "Authenticated users can update sweets"
  ON public.sweets
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Only admins can delete sweets (you'll need to check role in application logic)
CREATE POLICY "Authenticated users can delete sweets"
  ON public.sweets
  FOR DELETE
  TO authenticated
  USING (true);

-- Create function to automatically create user profile on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.users (id, email, role)
  VALUES (NEW.id, NEW.email, 'user');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create trigger for new user creation
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Create function to update updated_at timestamp
CREATE OR REPLACE FUNCTION public.update_updated_at()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger for sweets updated_at
DROP TRIGGER IF EXISTS sweets_updated_at ON public.sweets;
CREATE TRIGGER sweets_updated_at
  BEFORE UPDATE ON public.sweets
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at();
