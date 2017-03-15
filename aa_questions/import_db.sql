
DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users(fname, lname)
VALUES
  ('Zach', 'Ward'),
  ('Akshith', 'Yellapragada'),
  ('Alex', 'Boring'),
  ('Amy', 'Bui'),
  ('Asees', 'Nawaz'),
  ('Boris', 'Paskhaver'),
  ('Brandon', 'Thaler'),
  ('Breno', 'Paiva'),
  ('Chithra', 'Venkatesan'),
  ('Christine', 'Wang'),
  ('Christopher', 'Koehler'),
  ('Christopher', 'Manna'),
  ('Conrad', 'Makow'),
  ('Corey', 'Steiner'),
  ('Daniel', 'Choi'),
  ('Daniel', 'Rothblatt'),
  ('Daniel', 'Sokol'),
  ('Danny', 'Plain'),
  ('David', 'Janas'),
  ('Edward', 'Graham'),
  ('Jason', 'Loblein'),
  ('Eugene', 'Low'),
  ('Gabriel', 'McDonald'),
  ('Jacky', 'Ng'),
  ('James', 'Amaya'),
  ('James', 'Ball'),
  ('Jason', 'Liu'),
  ('Jay', 'Puntham-Baker'),
  ('Jeffrey', 'Brubaker'),
  ('Jonathan', 'Lin'),
  ('Kevin', 'Dam'),
  ('Madeleine', 'LeClair'),
  ('Maggie', 'Liu'),
  ('Matt', 'Haws'),
  ('Matt', 'Nguyen'),
  ('Michael', 'Coates'),
  ('Michael', 'Newton'),
  ('Moktar', 'Jama'),
  ('Muhammad', 'Alam'),
  ('Nick', 'Char'),
  ('Nicky', 'Liu'),
  ('Patrycja', 'Lupinska'),
  ('Paul', 'Eng'),
  ('Phillip', 'Park'),
  ('Rithy', 'Huot'),
  ('Rohaan', 'Kewelramani'),
  ('Ron', 'Ariav'),
  ('Royce', 'Kim'),
  ('Sanel', 'Selmanovic'),
  ('Stephanie', 'Mulhern'),
  ('Steven', 'Anderson'),
  ('Szymon', 'Wojnar'),
  ('TJ', 'Buchannan'),
  ('Tomer', 'Ovadia'),
  ('Vlad', 'Deev'),
  ('Wilson', 'Fong'),
  ('Yuan', 'Gao'),
  ('Zheng', 'Qian'),
  ('Zhuo', 'Chen'),
  ('Oscar', 'Alvarez'),
  ('Michael', 'Boan'),
  ('Maurice', 'Roach');

-- (SELECT id FROM users WHERE fname = '' AND lname = '')
INSERT INTO
  questions (title, body, author_id)
VALUES
  ('SQL', 'do join tables need a primary key?', (SELECT id FROM users WHERE fname = 'James' AND lname = 'Amaya')),
  ('SQLite', 'how do I show the tables of a database from the sqlite shell?', (SELECT id FROM users WHERE fname = 'James' AND lname = 'Amaya')),
  ('Misc', 'what is the answer to everything?', (SELECT id FROM users WHERE fname = 'James' AND lname = 'Amaya')),
  ('Books', 'does anyone know if getting a copy of Learning SQL by Alan Beaulieu is still required?', (SELECT id FROM users WHERE fname = 'Jonathan' AND lname = 'Lin')),
  ('Rules', 'TAs, are we allowed to sleep at the office?', (SELECT id FROM users WHERE fname = 'Boris')),
  ('Mancala', 'Did Mancala again ... can anyone tell me why the following code fails the second spec for one _side_empty?', (SELECT id FROM users WHERE fname = 'Steven' AND lname = 'Anderson')),
  ('Test Prep', 'Anyone have some fresh specs they’d like to share?', (SELECT id FROM users WHERE fname = 'Jason' AND lname = 'Loblein')),
  ('Practice Assessment', 'Does player.rb require hand already?', (SELECT id FROM users WHERE fname = 'Akshith' AND lname = 'Yellapragada')),
  ('Subways', 'Anyone else being stalled on an F train?', (SELECT id FROM users WHERE lname = 'Nguyen')),
  ('Coffee', 'coffee-loving-TAs: is the hot water dispenser hot enough to make coffee with a pourover?', (SELECT id FROM users WHERE fname = 'Edward' AND lname = 'Graham')),
  ('Recursion', 'does anyone have a trick to help them solve a recursion problem?', (SELECT id FROM users WHERE fname = 'Steven' AND lname = 'Anderson')),
  ('Exam 1', 'Can a student / professor confirm "eight_queens_possibilities" will not be on the exam?', (SELECT id FROM users WHERE lname = 'Manna')),
  ('Homework', 'Anyone else having trouble with the spec on line 72 on the homework?', (SELECT id FROM users WHERE fname = 'Michael' AND lname = 'Coates')),
  ('a00', 'Do we have an official a/A solution to the jumble_sort problem from the a00 assessment?', (SELECT id FROM users WHERE fname = 'Nick' AND lname = 'Char')),
  ('Rspec', 'does anyone know how to have the colors show when running the specs in terminal?', (SELECT id FROM users WHERE fname = 'Eugene' AND lname = 'Low'));


INSERT INTO
  question_likes (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Tomer' AND lname = 'Ovadia'), (SELECT id FROM questions WHERE title = 'Exam 1')),
  ((SELECT id FROM users WHERE fname = 'Michael' AND lname = 'Newton'), (SELECT id FROM questions WHERE title = 'Exam 1')),
  ((SELECT id FROM users WHERE fname = 'Michael' AND lname = 'Coates'), (SELECT id FROM questions WHERE title = 'Recursion')),
  ((SELECT id FROM users WHERE fname = 'Zach' AND lname = 'Ward'), (SELECT id FROM questions WHERE title = 'Homework')),
  ((SELECT id FROM users WHERE fname = 'Zach' AND lname = 'Ward'), (SELECT id FROM questions WHERE title = 'Coffee')),
  ((SELECT id FROM users WHERE fname = 'Ron' AND lname = 'Ariav'), (SELECT id FROM questions WHERE title = 'Coffee')),
  ((SELECT id FROM users WHERE fname = 'Brandon' AND lname = 'Thaler'), (SELECT id FROM questions WHERE title = 'SQL')),
  ((SELECT id FROM users WHERE fname = 'Zhuo' AND lname = 'Chen'), (SELECT id FROM questions WHERE title = 'SQL')),
  ((SELECT id FROM users WHERE fname = 'Vlad' AND lname = 'Deev'), (SELECT id FROM questions WHERE title = 'SQL')),
  ((SELECT id FROM users WHERE fname = 'Zach' AND lname = 'Ward'), (SELECT id FROM questions WHERE title = 'SQL')),
  ((SELECT id FROM users WHERE fname = 'Zach' AND lname = 'Ward'), (SELECT id FROM questions WHERE title = 'Rules')),
  ((SELECT id FROM users WHERE fname = 'Breno' AND lname = 'Paiva'), (SELECT id FROM questions WHERE title = 'Rules')),
  ((SELECT id FROM users WHERE fname = 'Zach' AND lname = 'Ward'), (SELECT id FROM questions WHERE title = 'SQLite')),
  ((SELECT id FROM users WHERE fname = 'Nick' AND lname = 'Char'), (SELECT id FROM questions WHERE title = 'Rules'));


INSERT INTO
  replies (question_id, parent_id, user_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'Subways'), NULL, (SELECT id FROM users WHERE fname = 'Chithra'), 'I''m stuck'),
  ((SELECT id FROM questions WHERE title = 'Subways'), NULL, (SELECT id FROM users WHERE fname = 'Akshith'), 'I was stalled on an E train for a bit. It was pretty minor'),
  ((SELECT id FROM questions WHERE title = 'Coffee'), NULL, (SELECT id FROM users WHERE fname = 'Oscar'), 'I actually think the hot water from the dispenser isn''t quite hot enough for that purpose, but that''s just my taste'),
  ((SELECT id FROM questions WHERE title = 'Coffee'), NULL, (SELECT id FROM users WHERE fname = 'Michael' AND lname = 'Boan'), '@edward Indeed it is'),
  ((SELECT id FROM questions WHERE title = 'Homework'), NULL, (SELECT id FROM users WHERE fname = 'Paul' AND lname = 'Eng'), '@michaelmcoates same error, or weird variable assignment rather'),
  ((SELECT id FROM questions WHERE title = 'a00'), NULL, (SELECT id FROM users WHERE fname = 'Ron'), 'Yes. It''s in the lecture notes from day 2'),
  ((SELECT id FROM questions WHERE title = 'Rspec'), NULL, (SELECT id FROM users WHERE fname = 'Maurice'), 'go to your root directory by doing cd ~\n create a .rspec file');

INSERT INTO
  replies (question_id, parent_id, user_id, body)
VALUES
  ((SELECT id FROM questions WHERE title = 'Coffee'), 4, (SELECT id FROM users WHERE fname = 'Edward' AND lname = 'Graham'), 'awesome! vibrates caffeinatedly'),
  ((SELECT id FROM questions WHERE title = 'a00'), (SELECT id FROM replies WHERE body = 'Yes. It''s in the lecture notes from day 2'), (SELECT id FROM users WHERE fname = 'Nick' AND lname = 'Char'), 'Word. Thanks!'),
  ((SELECT id FROM questions WHERE title = 'Rspec'), (SELECT id FROM replies WHERE body = 'go to your root directory by doing cd ~\n create a .rspec file'), (SELECT id FROM users WHERE fname = 'Eugene' AND lname = 'Low'), 'awesome thanks a lot');


INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Gabriel'), (SELECT id FROM questions WHERE title = 'Practice Assessment')),
  ((SELECT id FROM users WHERE fname = 'Zach'), (SELECT id FROM questions WHERE title = 'Coffee')),
  ((SELECT id FROM users WHERE fname = 'Zach'), (SELECT id FROM questions WHERE title = 'Subways')),
  ((SELECT id FROM users WHERE fname = 'Steven'), (SELECT id FROM questions WHERE title = 'Recursion')),
  ((SELECT id FROM users WHERE fname = 'Rithy'), (SELECT id FROM questions WHERE title = 'Exam 1')),
  ((SELECT id FROM users WHERE fname = 'Rohaan'), (SELECT id FROM questions WHERE title = 'Exam 1')),
  ((SELECT id FROM users WHERE fname = 'Moktar'), (SELECT id FROM questions WHERE title = 'Books')),
  ((SELECT id FROM users WHERE fname = 'Zach'), (SELECT id FROM questions WHERE title = 'SQL'));
