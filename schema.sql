-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- Create Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    weight FLOAT,
    height FLOAT,
    email VARCHAR(100) UNIQUE
);

-- Create Workouts table
CREATE TABLE Workouts (
    workout_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    date DATE,
    total_duration INT,
    notes TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create Exercises table
CREATE TABLE Exercises (
    exercise_id INT PRIMARY KEY AUTO_INCREMENT,
    workout_id INT,
    name VARCHAR(100),
    duration INT,
    sets INT,
    reps INT,
    weight FLOAT,
    FOREIGN KEY (workout_id) REFERENCES Workouts(workout_id)
);

-- Create Nutrition table
CREATE TABLE Nutrition (
    nutrition_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    date DATE,
    meal_type VARCHAR(50),
    food_item VARCHAR(100),
    calories INT,
    protein FLOAT,
    carbs FLOAT,
    fats FLOAT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create Goals table
CREATE TABLE Goals (
    goal_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    goal_type VARCHAR(100),
    description TEXT,
    target_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create Progress table
CREATE TABLE Progress (
    progress_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    goal_id INT,
    date DATE,
    progress_notes TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (goal_id) REFERENCES Goals(goal_id)
);

-- Create Trainers table
CREATE TABLE Trainers (
    trainer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    certification VARCHAR(100)
);

-- Create User_Trainers table
CREATE TABLE User_Trainers (
    user_id INT,
    trainer_id INT,
    PRIMARY KEY (user_id, trainer_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (trainer_id) REFERENCES Trainers(trainer_id)
);

-- Indexes for optimization
CREATE INDEX idx_user_id ON Workouts(user_id);
CREATE INDEX idx_user_id ON Nutrition(user_id);
CREATE INDEX idx_user_id ON Goals(user_id);
CREATE INDEX idx_user_id ON Progress(user_id);