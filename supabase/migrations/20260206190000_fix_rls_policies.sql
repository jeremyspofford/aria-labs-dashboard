-- Fix RLS policies to allow anonymous writes
-- This is safe for an internal dashboard where all users can manage tasks

-- Drop existing insert/update/delete policies
DROP POLICY IF EXISTS "Allow authenticated insert" ON public.kanban_tasks;
DROP POLICY IF EXISTS "Allow authenticated update" ON public.kanban_tasks;
DROP POLICY IF EXISTS "Allow authenticated delete" ON public.kanban_tasks;

-- Allow anonymous insert
CREATE POLICY "Allow anonymous insert"
  ON public.kanban_tasks
  FOR INSERT
  TO anon
  WITH CHECK (true);

-- Allow anonymous update
CREATE POLICY "Allow anonymous update"
  ON public.kanban_tasks
  FOR UPDATE
  TO anon
  USING (true)
  WITH CHECK (true);

-- Allow anonymous delete
CREATE POLICY "Allow anonymous delete"
  ON public.kanban_tasks
  FOR DELETE
  TO anon
  USING (true);
