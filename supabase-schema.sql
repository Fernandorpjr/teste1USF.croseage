-- Create the schedule table
create table if not exists schedule_data (
  id uuid default gen_random_uuid() primary key,
  day_name text not null, -- 'segunda', 'terca', 'quarta', 'quinta', 'sexta', 'resumo'
  title text not null,
  date text not null,
  schedule jsonb not null, -- Store the entire schedule array as JSON
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now()
);

-- Create indexes for better performance
create index if not exists idx_schedule_day_name on schedule_data (day_name);
create index if not exists idx_schedule_created_at on schedule_data (created_at);
create index if not exists idx_schedule_updated_at on schedule_data (updated_at);

-- Enable Row Level Security (RLS)
alter table schedule_data enable row level security;

-- Create policy to allow read access for all users
create policy "Enable read access for all users" on schedule_data
  for select using (true);

-- Create policy to allow insert access for all users
create policy "Enable insert access for all users" on schedule_data
  for insert with check (true);

-- Create policy to allow update access for all users
create policy "Enable update access for all users" on schedule_data
  for update using (true);

-- Create a trigger to automatically update the updated_at column
create or replace function update_updated_at_column()
returns trigger as $$
begin
  new.updated_at = now();
  return new;
end;
$$ language 'plpgsql';

create trigger update_schedule_data_updated_at 
  before update on schedule_data 
  for each row 
  execute procedure update_updated_at_column();