CREATE DATABASE parkman;
USE parkman;

CREATE TABLE owners
(
  id INT unsigned NOT NULL AUTO_INCREMENT,  
  name VARCHAR(150) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE KEY(name)
) ENGINE=INNODB;
CREATE TABLE countries
(
  id INT unsigned NOT NULL AUTO_INCREMENT,  
  name VARCHAR(150) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE KEY(name)
) ENGINE=INNODB;

CREATE TABLE currencies
(
  id INT unsigned NOT NULL AUTO_INCREMENT,  
  name VARCHAR(150) NOT NULL CHARACTER SET utf8 COLLATE utf8_general_ci,
  code VARCHAR(3) NOT NULL,
  PRIMARY KEY(id),
  UNIQUE KEY(name),
  UNIQUE KEY(code)
) ENGINE=INNODB;

CREATE TABLE garages
(
  id BIGINT unsigned NOT NULL AUTO_INCREMENT,  
  name VARCHAR(250) NOT NULL,
  owner_id INT unsigned NOT NULL,
  country_id INT unsigned NOT NULL,
  currency_id INT unsigned NOT NULL,
  email VARCHAR(250) NOT NULL,
  price FLOAT(5,2) NOT NULL,
  latitude FLOAT(10,6) NOT NULL,
  longitude FLOAT(10,6) NOT NULL,
  PRIMARY KEY(id),
  INDEX (latitude),
  INDEX (name),
  INDEX (country_id),
  INDEX (owner_id)
) ENGINE=INNODB;

INSERT INTO owners (id, name) VALUES (1, 'AutoPark');
INSERT INTO owners (id, name) VALUES (2, 'Parkkitalo OY');
INSERT INTO countries (id, name) VALUES (1, 'Finland');
INSERT INTO currencies (id, code, name) VALUES (1, 'EUR', _ucs2 0x20AC);
INSERT INTO garages (id, name, owner_id, country_id, currency_id, email, price, latitude, longitude) VALUES (1,'Garage1', 1, 1, 1, 'testemail@testautopark.fi', 2, 60.168607847624095, 24.932371066131623);
INSERT INTO garages (id, name, owner_id, country_id, currency_id, email, price, latitude, longitude) VALUES (2,'Garage2', 1, 1, 1, 'testemail@testautopark.fi', 1.5, 60.162562, 24.939453);
INSERT INTO garages (id, name, owner_id, country_id, currency_id, email, price, latitude, longitude) VALUES (3,'Garage3', 1, 1, 1, 'testemail@testautopark.fi', 3, 60.16444996645511, 24.938178168200714);
INSERT INTO garages (id, name, owner_id, country_id, currency_id, email, price, latitude, longitude) VALUES (4,'Garage4', 1, 1, 1, 'testemail@testautopark.fi', 3, 60.165219358852795, 24.93537425994873);
INSERT INTO garages (id, name, owner_id, country_id, currency_id, email, price, latitude, longitude) VALUES (4,'Garage5', 2, 1, 1, 'testemail@testautopark.fi', 3, 60.17167429490068, 24.921585662024363);
INSERT INTO garages (id, name, owner_id, country_id, currency_id, email, price, latitude, longitude) VALUES (4,'Garage5', 2, 1, 1, 'testemail@testautopark.fi', 2, 60.16867390148751, 24.930162952045407);