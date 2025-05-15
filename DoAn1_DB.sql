CREATE DATABASE IF NOT EXISTS realestate_db;
USE realestate_db;

CREATE TABLE users (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    UPassword VARCHAR(255) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    URole ENUM('admin', 'agent') DEFAULT 'agent',
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE properties (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    PDescription TEXT,
    Price DECIMAL(15,2) NOT NULL,
    PLocation VARCHAR(255) NOT NULL,
    Area INT,
    Bedrooms INT,
    Bathrooms INT,
    Furnishing ENUM('Furnished', 'Semi-Furnished', 'Unfurnished'),
    Property_type ENUM('Apartment', 'Villa', 'Plot', 'Office', 'Shop', 'Other') NOT NULL,
    Is_featured BOOLEAN DEFAULT FALSE,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Agent_id INT,
    FOREIGN KEY (agent_id) REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE property_images (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Property_id INT NOT NULL,
    Image_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (property_id) REFERENCES properties(id) ON DELETE CASCADE
);

CREATE TABLE feedback (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Rating INT CHECK (rating BETWEEN 1 AND 5),
    Comment TEXT,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE schedule_visit (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Property_id INT NOT NULL,
    SVName VARCHAR(100) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Visit_date DATE NOT NULL,
    SVMessage TEXT,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties(id) ON DELETE CASCADE
);

CREATE TABLE contact_messages (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    CMName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    CMSubject VARCHAR(255),
    CMMessage TEXT,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);