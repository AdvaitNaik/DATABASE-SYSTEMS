-- phpMyAdmin SQL
-- version 5.0.3

-- CREATE DATABASE youtube;

CREATE TABLE Users (
  User_id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  age INT,
  street VARCHAR(255),
  country VARCHAR(255)
);

CREATE TABLE Channel (
  channel_id INT PRIMARY KEY,
  name VARCHAR(255),
  owner INT,
  subscription_count INT,
  created_date DATE,
  CONSTRAINT fk_owner
    FOREIGN KEY (owner)
    REFERENCES Users(User_id)
);

CREATE TABLE Subscription (
  channel_id INT,
  User_id INT,
  subscription_type BOOLEAN,
  PRIMARY KEY (channel_id, User_id),
  FOREIGN KEY (channel_id) REFERENCES Channel(channel_id),
  FOREIGN KEY (User_id) REFERENCES Users(User_id)
);

CREATE TABLE Video (
  video_id INT PRIMARY KEY,
  channel_id INT,
  title VARCHAR(255),
  URL VARCHAR(255),
  category INT,
  duration TIME,
  description VARCHAR(255),
  uploaded_date DATE,
  uploaded_time TIME,
  CONSTRAINT fk_channel
    FOREIGN KEY (channel_id)
    REFERENCES Channel(channel_id)
);

CREATE TABLE Video_Category_Mapping (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(255)
);

CREATE TABLE Statistics (
  video_id INT PRIMARY KEY,
  views INT,
  likes INT,
  dislikes INT,
  number_shares INT,
  number_comments INT,
  FOREIGN KEY (video_id) REFERENCES Video(video_id)
);

CREATE TABLE Sponsor (
  sponsor_id INT PRIMARY KEY,
  name VARCHAR(255),
  phone VARCHAR(20),
  address VARCHAR(255)
);

CREATE TABLE Sponsor_Video_Mapping (
  sponsor_id INT,
  video_id INT,
  sponsor_amount DECIMAL(10,2),
  PRIMARY KEY (sponsor_id, video_id),
  FOREIGN KEY (sponsor_id) REFERENCES Sponsor(sponsor_id),
  FOREIGN KEY (video_id) REFERENCES Video(video_id)
);

CREATE TABLE Comment (
  comment_id INT PRIMARY KEY,
  video_id INT,
  User_id INT,
  comment_text VARCHAR(255),
  likes INT,
  sentiment_score FLOAT,
  commented_date DATE,
  FOREIGN KEY (video_id) REFERENCES Video(video_id),
  FOREIGN KEY (User_id) REFERENCES Users(User_id)
);

CREATE TABLE Keyword (
  keyword_id INT PRIMARY KEY,
  video_id INT,
  keyword VARCHAR(255),
  FOREIGN KEY (video_id) REFERENCES Video(video_id)
);

CREATE TABLE Tag (
  tag_id INT PRIMARY KEY,
  video_id INT,
  tag VARCHAR(255),
  FOREIGN KEY (video_id) REFERENCES Video(video_id)
);