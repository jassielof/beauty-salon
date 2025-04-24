CREATE TABLE beauty_salon (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  address TEXT NOT NULL,
  phone TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  description TEXT NOT NULL,
  logo_uri TEXT NOT NULL,
  created_at TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP(3) NOT NULL,
  owner_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE
);
CREATE TABLE opening_hours (
  id SERIAL PRIMARY KEY,
  day week_day NOT NULL,
  open_time TEXT NOT NULL,
  close_time TEXT NOT NULL,
  created_at TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP(3) NOT NULL,
  branch_id INTEGER NOT NULL REFERENCES branch(id)
);
CREATE TABLE category (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP(3) NOT NULL
);
CREATE TABLE service (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(65, 30) NOT NULL,
  duration INTEGER NOT NULL,
  created_at TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP(3) NOT NULL,
  branch_id INTEGER NOT NULL REFERENCES branch(id),
  category_id INTEGER NOT NULL REFERENCES category(id)
);
CREATE TABLE notification (
  id SERIAL PRIMARY KEY,
  message TEXT NOT NULL,
  created_at TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP(3) NOT NULL,
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE
);
CREATE TABLE review (
  id SERIAL PRIMARY KEY,
  rating DOUBLE PRECISION NOT NULL,
  comment TEXT NOT NULL,
  created_at TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP(3) NOT NULL,
  client_id INTEGER NOT NULL REFERENCES client(id),
  service_id INTEGER NOT NULL REFERENCES service(id)
);
CREATE TABLE promotion (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  discount DOUBLE PRECISION NOT NULL,
  start_date TIMESTAMP(3) NOT NULL,
  end_date TIMESTAMP(3) NOT NULL,
  created_at TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP(3) NOT NULL,
  service_id INTEGER NOT NULL REFERENCES service(id)
);
CREATE TABLE appointment_service (
  id SERIAL PRIMARY KEY,
  price DECIMAL(65, 30) NOT NULL,
  quantity INTEGER NOT NULL,
  created_at TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP(3) NOT NULL,
  appointment_id INTEGER NOT NULL REFERENCES appointment(id),
  service_id INTEGER NOT NULL REFERENCES service(id)
);
CREATE TABLE payment_info (
  id SERIAL PRIMARY KEY,
  method payment_method NOT NULL,
  amount DECIMAL(65, 30) NOT NULL,
  card_number TEXT NOT NULL,
  card_holder TEXT NOT NULL,
  expiration_date TEXT NOT NULL,
  security_code TEXT NOT NULL,
  bank TEXT NOT NULL,
  account_number TEXT NOT NULL,
  account_holder TEXT NOT NULL,
  created_at TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP(3) NOT NULL,
  appointment_id INTEGER NOT NULL REFERENCES appointment(id)
);
CREATE TABLE bill (
  id SERIAL PRIMARY KEY,
  payment_id INTEGER NOT NULL,
  date TIMESTAMP(3) NOT NULL,
  nit TEXT NOT NULL,
  name TEXT NOT NULL,
  surname TEXT NOT NULL,
  created_at TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP(3) NOT NULL
);
CREATE TABLE specialty (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  created_at TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP(3) NOT NULL
);
CREATE TABLE employee_schedule (
  id SERIAL PRIMARY KEY,
  day TEXT NOT NULL,
  start_time TEXT NOT NULL,
  end_time TEXT NOT NULL,
  created_at TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP(3) NOT NULL
);
