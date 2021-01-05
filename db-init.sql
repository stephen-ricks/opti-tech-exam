CREATE DATABASE exam;

USE exam;

CREATE TABLE blog (
    id INT(6) AUTO_INCREMENT PRIMARY KEY,
    title TEXT NULL,
    content TEXT NULL,
    filename TEXT NULL,
    type VARCHAR(50)
    created_at TIMESTAMP NOT NULL
);

/*
primary should be unsigned. (for better tracking. it is logical to have positive numbers for item serialization)

type should be predefined. (can be a set or enum)
or add tags table instead, for better mapping of type.

table has no collation defined (charset), for better sorting and comparison

title should not be nullable
*/

