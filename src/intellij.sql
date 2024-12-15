CREATE TABLE hospitals
(id SERIAL,
 name VARCHAR,
 address VARCHAR,
 doctor_id INTEGER REFERENCES doctors(id)
);


CREATE TABLE doctors(
                        id SERIAL PRIMARY KEY ,
                        name VARCHAR,
                        experienceYear INT
);

INSERT INTO hospitals( name, address, doctor_id)
values ('Main hospital', 'West Street', 1),
       ('Central hospital', 'North Street',2);



INSERT INTO doctors(NAME, EXPERIENCEYEAR)
values ('dr. Simona', 25),
       ('dr. Watson', 28);


CREATE TABLE contacts(
                         id SERIAL PRIMARY KEY ,
                         name VARCHAR NOT NULL,
                         phone_number VARCHAR UNIQUE
);


CREATE TABLE phones(
                       id SERIAL PRIMARY KEY ,
                       brand VARCHAR NOT NULL ,
                       contacts_id INTEGER REFERENCES contacts(id)
);


INSERT INTO contacts(name, phone_number)
values ('Lilly', '0555002266'),
       ('John', '0700880044');


INSERT INTO phones(brand, contacts_id)
values ('Samsung', 1),
       ('Apple', 2);


CREATE TABLE citizens(
                         id SERIAL PRIMARY KEY ,
                         first_name VARCHAR NOT NULL ,
                         last_name VARCHAR NOT NULL ,
                         email VARCHAR UNIQUE
);

CREATE TABLE republics(
                          id SERIAL PRIMARY KEY ,
                          name VARCHAR NOT NULL ,
                          language VARCHAR NOT NULL ,
                          nationality VARCHAR NOT NULL,
                          citizen_id INTEGER REFERENCES citizens(id)
);



INSERT INTO citizens(first_name, last_name, email)
values ('Rachael', 'Addams', 'rachael@.ru'),
       ('Harry', 'Gatsby', 'harry@.ru');

INSERT INTO republics(name, language, nationality, citizen_id)
values ('Slovak', 'Slovenian','Slovene', 1 ),
       ('Kyrgyzstan', 'Kyrgyz', 'Kyrgyz', 2);


CREATE TABLE farmers(
                        id SERIAL PRIMARY KEY,
                        first_name VARCHAR NOT NULL ,
                        last_name VARCHAR NOT NULL ,
                        email VARCHAR UNIQUE
);

CREATE TABLE farms(
                      id SERIAL PRIMARY KEY ,
                      name VARCHAR NOT NULL,
                      address VARCHAR ,
                      farmers_id INTEGER REFERENCES farmers(id)
);

INSERT INTO farmers(first_name, last_name,email)
values ('Thomas', 'Shelby', 'tommy@.com'),
       ('Arthur', 'Harrison', 'arthur@.com');


INSERT INTO farms(name, address, farmers_id)
values ('Stud farm', 'Yorkshire Street', 1),
       ('Dairy farm', 'Flit Street', 2);


CREATE TABLE writers(
                        id SERIAL PRIMARY KEY ,
                        first_name VARCHAR NOT NULL ,
                        last_name VARCHAR NOT NULL ,
                        nationality VARCHAR,
                        email VARCHAR UNIQUE,
                        books_id INTEGER REFERENCES books(id)
);

CREATE TABLE books(
                      id SERIAL PRIMARY KEY ,
                      name VARCHAR NOT NULL ,
                      genre VARCHAR NOT NULL
);

INSERT INTO writers(first_name, last_name, nationality, email, books_id)
values ('Lev', 'Tolstoy', 'Russian', 'lev@.ru', 1),
       ('Jane', 'Austin', 'British', 'jane@.ru', 2);

INSERT INTO books(name, genre)
values ('War and peace', 'fiction'),
       ('Pride & Prejudice', 'fiction');


CREATE TABLE producers(
                          id SERIAL PRIMARY KEY ,
                          first_name VARCHAR,
                          last_name VARCHAR
);


CREATE TABLE cartoons(
                         id SERIAL PRIMARY KEY ,
                         name VARCHAR NOT NULL ,
                         release_date INTEGER,
                         country VARCHAR,
                         genre VARCHAR,
                         producer_id INTEGER REFERENCES producers(id),
                         actors_id INTEGER REFERENCES actors(id)
);

CREATE TABLE actors(
                       id SERIAL PRIMARY KEY ,
                       full_name VARCHAR NOT NULL ,
                       email VARCHAR UNIQUE
);

INSERT INTO producers(first_name, last_name)
values ('David', 'Derrick');


INSERT INTO actors(full_name, email)
values ('Dwayne Johnson','dwayne@.com');


INSERT INTO cartoons(name, release_date, country, genre, producer_id, actors_id)
values('Mohana', 2024, 'USA, Canada', 'Adventure, Comedy', 1,1);


CREATE TABLE factory_worker(
                               id SERIAL PRIMARY KEY ,
                               full_name VARCHAR,
                               age INTEGER

);

CREATE TABLE factories(
                          id SERIAL PRIMARY KEY ,
                          name VARCHAR NOT NULL ,
                          address VARCHAR,
                          email VARCHAR,
                          factory_worker_id INTEGER REFERENCES  factory_worker(id)
);

INSERT INTO factory_worker(full_name, age)
values ('Richard Thompson', 42),
       ('Alice', 37);

INSERT INTO factories(name, address, email, factory_worker_id)
values ('Nestle', 'Moore St', 'nestle@.com',1),
       ('Garnier', 'Main St', 'garnier@.com', 2);