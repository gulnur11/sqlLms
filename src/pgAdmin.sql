CREATE TABLE beauty_manufactures(
                                   id SERIAL PRIMARY KEY,
                                   name VARCHAR,
                                   country VARCHAR,
                                   date_of_foundation VARCHAR,
                                   address VARCHAR,
                                   email VARCHAR UNIQUE,
                                   founder_id INTEGER REFERENCES founder(id),
                                   products_id INTEGER REFERENCES products(id)
);

CREATE TABLE founder(
                        id SERIAL PRIMARY KEY,
                        name VARCHAR,
                        last_name VARCHAR,
                        age INTEGER
);

CREATE TABLE products(
                         id SERIAL PRIMARY KEY,
                         name VARCHAR
);

INSERT INTO products(name)
values('cosmetics, parfumes'),
      ('eye shadow, mascara');

INSERT INTO beauty_manufactures(name, country, date_of_foundation, address, email, founder_id, products_id)
values('L Oreal', 'French', '22-07-1909', 'St. Main 21', 'loreal@.com', 1 , 1),
      ('Maybelline', 'USA', '27-03-1915', 'St. West 74', 'maybelline@.com', 2, 2 );


INSERT INTO founder(name,last_name, age)
values('Eugene', 'Shullet', 79),
      ('Thomas', 'Williams', 91);


CREATE TABLE shooes (
                        id SERIAL PRIMARY KEY,
                        brand VARCHAR NOT NULL,
                        price INTEGER,
                        is_available BOOLEAN
);

INSERT INTO shooes (brand, price, is_available)
VALUES
    ('Gucci', 1200, TRUE),
    ('Prada', 950, FALSE),
    ('Louis Vuitton', 1500, TRUE);



CREATE TABLE redactor(
                         id SERIAL PRIMARY KEY,
                         first_name VARCHAR,
                         last_name VARCHAR,
                         email VARCHAR UNIQUE
);

CREATE TABLE newspaper(
                          id SERIAL PRIMARY KEY,
                          name VARCHAR,
                          country VARCHAR,
                          email VARCHAR UNIQUE,
                          redactor_id INTEGER REFERENCES redactor(id)
);

INSERT INTO newspaper(name, country, email, redactor_id)
values('New York Times', 'USA', 'newyorktimes@.com', 1),
      ('Financial Times', 'UK', 'financialtimes@.com', 2);


INSERT INTO redactor(first_name, last_name, email )
values('Johnson', 'Smith', 'john@.com'),
      ('Jane', 'Smack', 'jenny@.com');


CREATE TABLE manufacturer_of_automobiles(
                                            id SERIAL PRIMARY KEY ,
                                            name VARCHAR NOT NULL ,
                                            date_of_foundation DATE,
                                            country VARCHAR NOT NULL ,
                                            city VARCHAR NOT NULL ,
                                            phone_number VARCHAR UNIQUE,
                                            subsidiaries_id INTEGER REFERENCES subsidiaries(id),
                                            founders_id INTEGER REFERENCES founders(id)
);

CREATE TABLE subsidiaries(
                             id SERIAL PRIMARY KEY ,
                             name VARCHAR NOT NULL,
                             country VARCHAR
);


CREATE TABLE founders(
                         id SERIAL PRIMARY KEY ,
                         name VARCHAR NOT NULL,
                         nationality VARCHAR
);


INSERT INTO founders(name, nationality  )
values('Kiichiro Toyoda', 'Japanese'),
      ('Karl Fredrich Rapp', 'German');



INSERT INTO subsidiaries(name, country )
values('Rolls-Royce', 'Great Britain'),
      ( 'Daihatsu', 'Japan');



INSERT INTO  manufacturer_of_automobiles(name,  date_of_foundation, country, city , phone_number, subsidiaries_id, founders_id  )
values('BMW', '7-3-1916', 'Germany','Munchen city', '+49 7881 238', 1, 2 ),
      ( 'Toyota', '28-6-1937', 'Japan','Toyota city', '+81 7881 238', 2, 1);


CREATE TABLE police_officers( id SERIAL PRIMARY KEY ,
                              full_name VARCHAR NOT NULL ,
                              place_of_birth VARCHAR,
                              date_of_birth DATE,
                              email VARCHAR UNIQUE
);

CREATE TABLE police_departments( id SERIAL PRIMARY KEY ,
                                 country VARCHAR NOT NULL ,
                                 city VARCHAR,
                                 address VARCHAR,
                                 phone_number VARCHAR UNIQUE,
                                 police_officers_id INTEGER REFERENCES police_officers(id)
);

INSERT INTO police_officers(full_name, place_of_birth, date_of_birth, email)
VALUES ('John Doe', 'New York', '1985-05-12', 'jonny@.com'),
       ('Jane Smith', 'Los Angeles', '1990-08-24', 'jane@.com'),
       ('Robert Brown', 'Chicago', '1978-12-02', 'rob@.com');


INSERT INTO police_departments(country, city, address,phone_number, police_officers_id )
VALUES ('USA', 'New York', 'West St. 45', '+1 226-7897', 1),
       ('USA', 'Los Angeles', 'Main St. 71', '+1 991-3281', 2),
       ('USA', 'Chicago', 'Broad St. 32', '+1 571-8991', 3);


CREATE TABLE engine_types(
                             id SERIAL PRIMARY KEY,
                             type_name VARCHAR NOT NULL,
                             description VARCHAR
);


CREATE TABLE car_models(
                           id SERIAL PRIMARY KEY,
                           model_name VARCHAR NOT NULL,
                           manufacturer_id INTEGER,
                           release_year DATE,
                           engine_id INTEGER REFERENCES engine_types(id)
);


CREATE TABLE car_manufacturers(
                                  id SERIAL PRIMARY KEY,
                                  name VARCHAR NOT NULL,
                                  country VARCHAR NOT NULL,
                                  established_date DATE
);



INSERT INTO engine_types (type_name, description)
VALUES
    ('Petrol', ' running on petrol'),
    ('Diesel', ' running on diesel'),
    ('Electric', 'powered by a battery');



INSERT INTO car_manufacturers (name, country, established_date)
VALUES
    ('Toyota', 'Japan', '1937-08-28'),
    ('Tesla', 'USA', '2003-07-01'),
    ('Ford', 'USA', '1903-06-16');


INSERT INTO car_models (model_name, manufacturer_id, release_year, engine_id)
VALUES
    ('Model S', 2, '2012-06-22', 3),
    ('Camry', 1, '1982-03-01', 1),
    ('F-150', 3, '1948-01-01', 2);


CREATE TABLE bags (
                      id SERIAL PRIMARY KEY,
                      brand VARCHAR NOT NULL,
                      price DECIMAL(10, 2),
                      is_available BOOLEAN
);

INSERT INTO bags (brand, price, is_available)
VALUES
    ('Gucci', 1200.50, TRUE),
    ('Prada', 950.00, FALSE),
    ('Louis Vuitton', 1500.75, TRUE);

