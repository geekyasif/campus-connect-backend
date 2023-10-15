-- Active: 1686691449262@@127.0.0.1@3306@campusconnet

drop database campusconnet;

create database campusconnet;

use campusconnet;

show DATABASEs;

CREATE TABLE
    Expertise(
        id INT NOT NULL AUTO_INCREMENT,
        name CHAR(50),
        slug CHAR(50),
        PRIMARY KEY (id)
    );

alter table Expertise ADD constraint UNIQUE(slug);

INSERT INTO
    Expertise (name, slug)
VALUES (
        'Web Development',
        'web-development'
    ), (
        'Mobile App Development',
        'mobile-app-development'
    ), (
        'Database Management',
        'database-management'
    ), (
        'UI/UX Design',
        'ui-ux-design'
    ), (
        'Data Science',
        'data-science'
    ), ('DevOps', 'devops');

CREATE TABLE
    Skills (
        id INT NOT NULL AUTO_INCREMENT,
        name CHAR(50),
        slug CHAR(50) UNIQUE,
        PRIMARY KEY (id)
    );

INSERT INTO Skills (name, slug)
VALUES ('HTML', 'html'), ('CSS', 'css'), ('Python', 'python'), (
        'Machine Learning',
        'machine-learning'
    ), ('Docker', 'docker'), ('AWS', 'aws'), ('JavaScript', 'javascript'), ('React', 'react'), ('Node.js', 'nodejs'), ('SQL', 'sql'), ('Java', 'java'), ('Android', 'android');

create table
    Users(
        id INT NOT NULL AUTO_INCREMENT,
        first_name CHAR(50),
        last_name CHAR(50),
        username CHAR(50) UNIQUE NOT NULL,
        email CHAR(50) UNIQUE NOT NULL,
        password CHAR(100) NOT NULL,
        phone CHAR(50),
        address CHAR(50),
        expertise_id INT,
        about TEXT,
        PRIMARY KEY (id),
        FOREIGN KEY (expertise_id) REFERENCES Expertise(id)
    );

alter Table Users add COLUMN profile_url text;
alter Table Users add column email_verified BOOLEAN DEFAULT false;

INSERT INTO
    Users (
        first_name,
        last_name,
        username,
        email,
        password,
        phone,
        address,
        expertise_id,
        about
    )
VALUES (
        'John',
        'Doe',
        'johndoe',
        'johndoe@example.com',
        'password123',
        '1234567890',
        '123 Main St',
        1,
        'Web Developer with experience in JavaScript, React, and Node.js.'
    ), (
        'Jane',
        'Smith',
        'janesmith',
        'janesmith@example.com',
        'password456',
        '0987654321',
        '456 Oak St',
        2,
        'Mobile App Developer specializing in Android development.'
    ), (
        'Bob',
        'Johnson',
        'bobjohnson',
        'bobjohnson@example.com',
        'password789',
        '5555555555',
        '789 Pine St',
        3,
        'Database administrator with expertise in SQL and database optimization.'
    ), (
        'Sarah',
        'Johnson',
        'sarahjohnson',
        'sarahjohnson@example.com',
        'password321',
        '5555555555',
        '789 Elm St',
        1,
        'Experienced UI/UX designer with expertise in HTML and CSS.'
    ), (
        'Michael',
        'Brown',
        'michaelbrown',
        'michaelbrown@example.com',
        'password654',
        '1234567890',
        '101 Oak Ave',
        2,
        'Data Scientist specializing in Python and Machine Learning.'
    ), (
        'Emily',
        'Smith',
        'emilysmith',
        'emilysmith@example.com',
        'password987',
        '0987654321',
        '202 Maple Dr',
        3,
        'DevOps engineer with experience in Docker and AWS services.'
    );

CREATE TABLE
    UsersSkills(
        id INT NOT NULL AUTO_INCREMENT,
        user_id INT,
        skill_id INT,
        PRIMARY KEY (ID),
        FOREIGN KEY (user_id) REFERENCES Users(id),
        FOREIGN KEY (skill_id) REFERENCES Skills(id)
    );

INSERT INTO
    UsersSkills (user_id, skill_id)
VALUES (1, 2), (1, 3), (2, 6), (3, 4), (4, 1), (4, 2), (5, 3), (5, 4), (6, 5), (6, 6);

create table Universities(
    id int NOT null AUTO_INCREMENT,
    name char(100),
    location char(100),
    slug char(120),
    PRIMARY KEY(id)
);


INSERT INTO Universities (name, location, slug) VALUES
  ('Sharda University', 'Greater Noida', 'sharda-greater-noida'),
  ('Bennett University', 'Greater Noida', 'bennett-greater-noida'),
  ('Galgotias University', 'Greater Noida', 'galgotias-greater-noida'),
  ('Amity University Noida', 'Noida', 'amity-noida'),
  ('Jaypee Institute of Information Technology', 'Noida', 'jiit-noida'),
  ('SRM University Delhi-NCR, Sonepat', 'Sonepat', 'srm-sonepat'),
  ('Shiv Nadar University', 'Greater Noida', 'shiv-nadar-greater-noida'),
  ('Manav Rachna University', 'Faridabad', 'manav-rachna-faridabad'),
  ('Noida International University', 'Greater Noida', 'niu-greater-noida'),
  ('Indian Institute of Technology Delhi', 'Delhi', 'iit-delhi'),
  ('Delhi Technological University', 'Delhi', 'dtu'),
  ('Gautam Buddha University', 'Greater Noida', 'gbu-greater-noida'),
  ('Ambedkar University Delhi', 'Delhi', 'aud-delhi'),
  ('Uttar Pradesh Technical University', 'Lucknow', 'uptu-lucknow'),
  ('Delhi University', 'Delhi', 'delhi-university'),
  ('Jawaharlal Nehru University', 'Delhi', 'jnu'),
  ('Amity University', 'Noida', 'amity-noida'),
  ('Jamia Millia Islamia', 'Delhi', 'jamia-delhi'),
  ('Aligarh Muslim University', 'Aligarh', 'amu-aligarh');


create table Courses(
    id int not null AUTO_INCREMENT,
    name char(50),
    slug char(60),
    PRIMARY KEY(id)
);


INSERT INTO Courses (name, slug) VALUES
  ('Computer Science', 'computer-science'),
  ('Electrical Engineering', 'electrical-engineering'),
  ('Mechanical Engineering', 'mechanical-engineering'),
  ('Civil Engineering', 'civil-engineering'),
  ('Chemical Engineering', 'chemical-engineering'),
  ('Mathematics', 'mathematics'),
  ('Physics', 'physics'),
  ('Chemistry', 'chemistry'),
  ('Biology', 'biology'),
  ('Business Administration', 'business-administration'),
  ('Economics', 'economics'),
  ('Political Science', 'political-science'),
  ('Psychology', 'psychology'),
  ('Sociology', 'sociology'),
  ('History', 'history'),
  ('English Literature', 'english-literature'),
  ('Art and Design', 'art-and-design'),
  ('Music', 'music'),
  ('Drama and Theater', 'drama-and-theater'),
  ('Environmental Science', 'environmental-science'),
  ('Master of Computer Applications (MCA)', 'mca'),
  ('Bachelor of Computer Applications (BCA)', 'bca'),
  ('Information Technology', 'information-technology'),
  ('Electronics and Communication Engineering', 'ece'),
  ('Software Engineering', 'software-engineering'),
  ('Data Science', 'data-science'),
  ('Artificial Intelligence', 'artificial-intelligence'),
  ('Machine Learning', 'machine-learning'),
  ('Web Development', 'web-development'),
  ('Network Engineering', 'network-engineering'),
  ('Cybersecurity', 'cybersecurity'),
  ('Digital Marketing', 'digital-marketing'),
  ('Robotics', 'robotics'),
  ('Aerospace Engineering', 'aerospace-engineering'),
  ('Automobile Engineering', 'automobile-engineering');


create table
    Academics(
        id int not null AUTO_INCREMENT,
        user_id int,
        university_id int,
        university_email char(50),
        course_id int,
        enrollment_number char(50),
        current_semester int,
        current_year int,
        passing_year int,
        PRIMARY KEY (id),
        Foreign Key (user_id) REFERENCES Users(id),
        Foreign Key (university_id) REFERENCES Universities(id),
        Foreign Key (course_id) REFERENCES Courses(id)
    );

rename table academics to Academics;


INSERT INTO academics (user_id, university_id, university_email, course_id, enrollment_number, current_semester, current_year, passing_year) VALUES
  (1, 1, 'asif@example.com', 1, 'CS2021001', 3, 2023, 2025),
  (2, 2, 'prabhat@example.com', 2, 'EE2021002', 4, 2022, 2026),
  (3, 3, 'shabaj@example.com', 3, 'ME2021003', 2, 2024, 2027),
  (4, 4, 'john@example.com', 4, 'CE2021004', 5, 2021, 2025),
  (5, 5, 'jane@example.com', 5, 'IT2021005', 6, 2022, 2026),
  (6, 6, 'peter@example.com', 6, 'CS2021006', 1, 2023, 2027),
  (7, 7, 'mary@example.com', 7, 'ECE2021007', 3, 2024, 2025),
  (8, 8, 'david@example.com', 8, 'MATH2021008', 4, 2025, 2026),
  (9, 9, 'linda@example.com', 9, 'PHYS2021009', 2, 2022, 2027),
  (10, 10, 'sam@example.com', 10, 'CHEM2021010', 5, 2023, 2025);


create table
    certificates(
        id int not null AUTO_INCREMENT,
        user_id int not null,
        title char(50),
        url char(250),
        image_url char(250),
        verification_link char(250),
        issue_date char(50),
        expiry_date char(50),
        PRIMARY key (id),
        Foreign Key (user_id) REFERENCES Users(id)
    );

rename table certificates to Certificates;

create table
    social_media(
        id int not null AUTO_INCREMENT,
        name char(50),
        slug CHAR(60) UNIQUE,
        PRIMARY KEY (id)
    );

rename table social_media to Social_Media

create table
    social_links(
         id int not null AUTO_INCREMENT,
        user_id int,
        social_media_id int,
        PRIMARY key (id),
        Foreign Key (user_id) REFERENCES users(id),
        Foreign Key (social_media_id) REFERENCES Social_Media(id)
    );

rename table social_links to Social_Links;

create table
    Projects(
        id int not null AUTO_INCREMENT,
        user_id int NOT NULL,
        title char(250),
        source_code_url char(250),
        live_url char(250),
        image_url char(250),
        description text,
        PRIMARY key (id),
        Foreign Key (user_id) REFERENCES Users(id)
    );

create table ProjectsSkills(
    id int not null AUTO_INCREMENT,
    project_id int not NULL,
    skill_id int not NULL,
    PRIMARY KEY (id),
    Foreign Key (project_id) REFERENCES Projects(id),
    Foreign Key (skill_id) REFERENCES Skills(id)
);

-----  Above Tables are created ------

select *
from users as u
    join academics as a on u.id = a.user_id
    join certificates as c on c.user_id = u.id
    join projects as p on p.user_id = u.id
    join social_links as s on s.user_id = u.id;

create table
    Categories(
        id int not NULL AUTO_INCREMENT,
        name char(50),
        slug char(50),
        PRIMARY KEY (id)
    );

insert into
    Categories (name, slug)
values ("Javascript", "javascript"), (
        "Frontend Development",
        "frontend-development"
    ), (
        "Backend Development",
        "backend-development"
    ), ("Python", "python"), ("Django", "django"), ("React", "react")

create table
    Queries(
        id int not null AUTO_INCREMENT,
        title CHAR(250),
        category_id int,
        skill_id int,
        timestamp char(50),
        description text,
        PRIMARY KEY (id),
        Foreign Key (category_id) REFERENCES Categories(id),
        Foreign Key (skill_id) REFERENCES Skills(id)
    );

alter table queries
add column user_id int,
add
    constraint fk_user_id FOREIGN key (user_id) REFERENCES users(id);

INSERT INTO
    queries (
        user_id,
        title,
        category_id,
        tags,
        timestamp,
        description
    )
VALUES (
        1,
        'Sample Title 1',
        1,
        'tag1,tag2',
        '2023-10-03 12:34:56',
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et mauris vel ligula pharetra ultrices.'
    ), (
        1,
        'Sample Title 3',
        3,
        'tag1,tag3',
        '2023-10-05 15:20:30',
        'Vivamus eu dolor et ante rhoncus scelerisque.'
    );

create table
    comments(
        id int not NULL AUTO_INCREMENT,
        comment text,
        user_id int,
        query_id int,
        PRIMARY key (id),
        Foreign Key (user_id) REFERENCES users(id),
        Foreign Key (query_id) REFERENCES queries(id)
    );

INSERT INTO
    comments (comment, user_id, query_id)
VALUES ('This is a great query!', 2, 1);

select * from comments;

select
    q.title as title,
    q.description as Descriptin,
    c.comment as comment,
    u.username as comment_by
from queries as q
    join comments as c on q.id = c.query_id
    join users as u on c.user_id = u.id;

create table
    replies(
        id int not null AUTO_INCREMENT,
        reply text,
        comment_id int,
        user_id int,
        query_id int,
        PRIMARY KEY (id),
        Foreign Key (comment_id) REFERENCES comments(id),
        Foreign Key (user_id) REFERENCES users(id),
        Foreign Key (query_id) REFERENCES queries(id)
    );

insert into
    replies (
        reply,
        comment_id,
        user_id,
        query_id
    )
VALUES ("thank you", 1, 1, 1);

SELECT
    r.reply as Comment_Reply,
    u_commenter.username as Reply_on,
    u_replier.username as Reply_by,
    q.title as title
FROM replies as r
    JOIN comments as c ON c.id = r.comment_id
    JOIN queries as q ON q.id = r.query_id
    JOIN users as u_replier ON u_replier.id = r.user_id
    JOIN users as u_commenter on u_commenter.id = c.user_id;

show tables;

select * from Users;

