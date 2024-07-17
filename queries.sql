-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Insert a new user
INSERT INTO Users (name, age, gender, weight, height, email) VALUES ('John Doe', 30, 'Male', 75.0, 175.0, 'john@example.com');

-- Log a workout
INSERT INTO Workouts (user_id, date, total_duration, notes) VALUES (1, '2024-07-16', 60, 'Morning workout');

-- Add exercises to a workout
INSERT INTO Exercises (workout_id, name, duration, sets, reps, weight) VALUES (1, 'Bench Press', 30, 4, 10, 70.0);
INSERT INTO Exercises (workout_id, name, duration, sets, reps, weight) VALUES (1, 'Squats', 30, 4, 12, 80.0);

-- Log nutrition
INSERT INTO Nutrition (user_id, date, meal_type, food_item, calories, protein, carbs, fats) VALUES (1, '2024-07-16', 'Breakfast', 'Oatmeal', 150, 5.0, 27.0, 3.0);

-- Set a fitness goal
INSERT INTO Goals (user_id, goal_type, description, target_date, status) VALUES (1, 'Weight Loss', 'Lose 5 kg in 3 months', '2024-10-16', 'In Progress');

-- Track progress towards a goal
INSERT INTO Progress (user_id, goal_id, date, progress_notes) VALUES (1, 1, '2024-07-23', 'Lost 1 kg in the first week');

-- Assign a trainer to a user
INSERT INTO Trainers (name, email, phone, certification) VALUES ('Jane Smith', 'jane@example.com', '555-1234', 'Certified Personal Trainer');
INSERT INTO User_Trainers (user_id, trainer_id) VALUES (1, 1);

-- Select user's workout details
SELECT * FROM Workouts WHERE user_id = 1;

-- Select user's nutrition details
SELECT * FROM Nutrition WHERE user_id = 1;

-- Select user's fitness goals
SELECT * FROM Goals WHERE user_id = 1;

-- Select user's progress towards goals
SELECT * FROM Progress WHERE user_id = 1;

-- Select all users managed by a specific trainer
SELECT U.* FROM Users U, User_Trainers UT WHERE U.user_id = UT.user_id AND UT.trainer_id = 1;