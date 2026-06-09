-- Example RLS policies for Serena Vet
-- Use cautiously and adapt to your authentication model

-- Enable row level security on appointments
alter table public.appointments enable row level security;

drop policy if exists "public_insert_appointments" on public.appointments;
drop policy if exists "public_read_schedule" on public.appointments;
drop policy if exists "auth_manage_appointments" on public.appointments;
drop policy if exists "auth_select_update_appointments" on public.appointments;

-- Policy: allow anyone to insert a new appointment without row-level restrictions for now
create policy "public_insert_appointments" on public.appointments
for insert
with check (true);

-- Public schedule access is limited by column grants in supabase.sql.
create policy "public_read_schedule" on public.appointments
for select
using (true);

-- Allow any authenticated or anonymous user to update appointment status.
-- The admin panel uses the anon key with local password protection (no Supabase Auth).
create policy "allow_status_update" on public.appointments
for update
using (true)
with check (true);

-- Authenticated users can delete appointments.
create policy "auth_manage_appointments_delete" on public.appointments
for delete
using (auth.role() = 'authenticated');

-- Note: For admin-only operations, use custom claims (e.g., 'is_admin') in JWT and check:
-- using ( (auth.role() = 'authenticated') AND (current_setting('request.jwt.claims', true) ->> 'is_admin')::boolean = true )

-- Also consider restricting which columns anonymous users can set (e.g., cannot set status other than 'requested').
