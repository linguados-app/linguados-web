-- Script SQL (roda ao realizar build no docker)

CREATE DATABASE IF NOT EXISTS linguados;
USE linguados;

CREATE TABLE IF NOT EXISTS usuarios (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          email VARCHAR(100),
                          senha VARCHAR(100)
);