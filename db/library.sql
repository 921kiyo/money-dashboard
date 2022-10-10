DROP TABLE users CASCADE;
DROP TABLE merchants CASCADE;
DROP TABLE categories CASCADE;
DROP TABLE transactions CASCADE;


CREATE TABLE users(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255)
);

CREATE TABLE categories(
  id SERIAL4 PRIMARY KEY,
  category_name VARCHAR(255)
);

CREATE TABLE merchants (
  id SERIAL4 PRIMARY KEY,
  merchant_name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  amount INT4,
  memo VARCHAR(255),
  dates DATE, 
  user_id INT4 REFERENCES users(id) ON DELETE CASCADE,
  category_id INT4 REFERENCES categories(id) ON DELETE CASCADE,
  merchant_id INT4 REFERENCES merchants(id) ON DELETE CASCADE
);


