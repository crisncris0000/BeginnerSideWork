CREATE TABLE categories(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(50) NOT NULL
);

INSERT INTO categories (category) VALUES
 ("clothing"),
 ("cosmetics"),
 ("celebration"),
 ("other");

CREATE TABLE posts(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	img LONGBLOB NOT NULL,
	post TEXT,
    category_id INT,
    price DOUBLE,
    quantity INT,
    FOREIGN KEY(category_id) REFERENCES categories(id)
);

CREATE TABLE authorities(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    authority VARCHAR(50)
);

INSERT INTO authorities(authority) VALUES
	("ROLE_USER"),
    ("ROLE_ADMIN");

CREATE TABLE users(
	username VARCHAR(255) NOT NULL PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    role_id INT,
    is_enabled BOOLEAN NOT NULL,
    FOREIGN KEY(role_id) REFERENCES authorities(id)
);

CREATE TABLE confirmation_token(
	id INT PRIMARY KEY AUTO_INCREMENT,
	token VARCHAR(255) NOT NULL,
    created_date TIMESTAMP NOT NULL,
	user_id VARCHAR(255),
    FOREIGN KEY(user_id) REFERENCES users(username)
);

CREATE TABLE cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(100) NOT NULL,
    item_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(username),
    FOREIGN KEY (item_id) REFERENCES posts(id)
);

CREATE TABLE Receipt(
    id INT AUTO_INCREMENT PRIMARY KEY,
    total INT NOT NULL
);


INSERT INTO users(username, password, role_id, is_enabled) VALUES
("Admin", "$2a$10$Fu7F7oMMVfMjSTXbcFmuDu7u2x4G5dtpsEZFDZuBIP5sXRUjk4n4W", 2, TRUE);

CREATE TABLE contact(
	id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(255),
	body TEXT
);

