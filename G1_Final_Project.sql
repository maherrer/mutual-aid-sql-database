if not exists(
    select * from sys.databases where name = 'mutual_aid'
)
create database mutual_aid
GO
use mutual_aid
go


--Down Script---
IF EXISTS (select * from information_schema.table_constraints
    WHERE CONSTRAINT_NAME = ('fk_donors_donor_donation_id') )
ALTER TABLE donors DROP CONSTRAINT fk_donors_donor_donation_id
GO
IF EXISTS (select * from information_schema.table_constraints
    WHERE CONSTRAINT_NAME = ('fk_donors_donor_user_id'))
ALTER TABLE donors DROP CONSTRAINT fk_donors_donor_user_id
GO


Drop table if exists donors
go


IF EXISTS (select * from information_schema.table_constraints
    WHERE CONSTRAINT_NAME = ('fk_reviews_review_user_id' ))
ALTER TABLE reviews DROP CONSTRAINT fk_reviews_review_user_id
GO
IF EXISTS (select * from information_schema.table_constraints
    WHERE CONSTRAINT_NAME = ('fk_reviews_review_mag_id' ))
ALTER TABLE reviews DROP CONSTRAINT fk_reviews_review_mag_id
GO
drop table if exists reviews
GO


IF EXISTS (select * from information_schema.table_constraints
    WHERE CONSTRAINT_NAME = ('fk_volunteers_volunteer_user_id')
    )
ALTER TABLE volunteers DROP CONSTRAINT fk_volunteers_volunteer_user_id
go


drop table if exists volunteers
go


IF EXISTS (select * from information_schema.table_constraints
    WHERE CONSTRAINT_NAME = ('fk_users_user_issue_id'))
ALTER TABLE users DROP CONSTRAINT fk_users_user_issue_id
GO


Drop table if exists users
GO


IF EXISTS (select * from information_schema.table_constraints
    WHERE CONSTRAINT_NAME = ('fk_donations_donation_mag_id'))


ALTER TABLE donations DROP CONSTRAINT fk_donations_donation_mag_id
GO


Drop table if exists donations
GO


IF EXISTS (select * from information_schema.table_constraints
    WHERE CONSTRAINT_NAME = ('fk_mags_mag_issue_id'))


ALTER TABLE mags DROP CONSTRAINT fk_mags_mag_issue_id
GO


drop table if exists mags


go
drop table if exists issues
go








---Up Script--
--Issues table--
Create table issues (  
    issue_id int identity not null,  
    issue_name VARCHAR (50) not null  
    Constraint pk_issues_issues_id primary key (issue_id)
)


GO
---Mags table --


Create table mags(  
    mag_id int identity not null,  
    mag_name varchar (100) not null,  
    mag_email Varchar (50) not null,  
    mag_website varchar (50) null ,  
    mag_state char (2) not null,  
    mag_zipcode char (5)  not null,
    mag_issue_id int not null,
    Constraint pk_mags_mag_id primary key (mag_id),
    Constraint u_mags_mag_email unique (mag_email)
)
GO
---add FK to mags---
Alter table mags ADD
constraint fk_mags_mag_issue_id foreign key (mag_issue_id)
references issues(issue_id)
GO
--Create table donations--
Create table donations (  
donation_id int identity not null,
donation_mag_id int not null,  
donation_amount money not null,
donation_date date null,
Constraint pk_donations_donation_id primary key (donation_id),
)
GO


--Create FK to donations table-


Alter table donations ADD
constraint fk_donations_donation_mag_id foreign key (donation_mag_id)
references mags(mag_id)


GO
---creating the users table ---
Create table users (  
    user_id  INT identity not null,  
    user_firstname VARCHAR(50) not null,
    user_lastname VARCHAR (50) not null,  
    user_email VARCHAR (50) not null,  
    user_phone_number CHAR (10) null,  
    user_state  CHAR (2) not null,  
    user_zipcode CHAR (5) not null,  
    user_issue_id int not null,  
    Constraint pk_users_user_id primary key (user_id),
    Constraint u_users_user_email unique (user_email)
)


GO
    ---Create FK to users table ---


    Alter table users ADD
constraint fk_users_user_issue_id foreign key (user_issue_id)
references issues(issue_id)
go


---create table for volunteers--
Create table volunteers (  
volunteer_id INT identity not null,  
volunteer_user_id INT not null,
Constraint pk_volunteers_volunteer_id primary key (volunteer_id)
)
GO


---Create Foreign key volunteers---


ALTER table  volunteers ADD
constraint fk_volunteers_volunteer_user_id foreign key (volunteer_user_id)
references users(user_id)


GO
----Create reviews table--
Create table reviews (
review_id INT identity not null,  
review_user_id  INT not null,  
review_mag_id   INT not null,
review_comment text null
Constraint pk_reviews_review_id primary key (review_id),
)
GO
---create FK to reviews table ---


ALTER TABLE reviews ADD
Constraint fk_reviews_review_user_id foreign key (review_user_id)
references users(user_id) ,
Constraint fk_reviews_review_mag_id foreign key (review_mag_id)
references mags(mag_id)
GO
---Create donors table --


Create table donors (
donor_id INT IDENTITY not null,
donor_donation_id int not null,
donor_user_id int  not null,
Constraint pk_donors_donor_id primary key(donor_id)
)


GO


---FK to donors table---
ALTER table  donors ADD
Constraint fk_donors_donor_donation_id foreign key (donor_donation_id)
references donations (donation_id),
Constraint fk_donors_donor_user_id foreign key (donor_user_id)
references users(user_id)
 
 GO




----Insert issues--


Insert into issues (issue_name) values
('food_security'),
('environmental'),
('housing_security'),
('poverty'),
('indigenous_rights'),
('water_security'),
('transportation'),
('disaster_relief')
GO






---insert users table--


Insert into users ( user_firstname, user_lastname, user_email, user_phone_number, user_state, user_zipcode, user_issue_id)  


 VALUES


    ( 'James', 'Bond', ' james.bond@yahoo.com', 5106429708, 'CA', 94705, 1),


    ( 'Lillian', 'Red', 'lillian_red@gmail.com', 4159620708, 'CA', 94108, 2),


    ('Mary', 'Lou', 'marylou@gmail.com', 2136590809, 'CA', 91356, 4),


    ('Joseph', 'King', 'jking@yahoo.com', 3107480405, 'CA', 90210, 5),


    ('Allen', 'Whistle', 'allwhistle21@gmail.com', 7432983728,'AK', 94517, 6),


    ('Alice', 'Copper', 'copper4lice@yahoo.com', 8273098764,'AZ', 85001, 5),


    ( 'Bob', 'Odenkirk', 'bodenkirk55@hotmail.com', 6483963109,'CA', 94101, 6),


    ('Lester', 'Night', 'l3st3rnight@gmail.com', 1215427539, 'CA', 94101, 7),


    ('Lorne', 'Malvo', 'malorne1998@gmail.com',  0798658342,'CA' ,94701, 3),


    ('Molly', ' Silverspoon', 'spoon4molly@gmail.com', 7453108970, 'CA', 90012, 1),


    ('Jordan', 'Key', 'jkey424@yahoo.com', 2736451983, 'CO', 80014, 2),


    ('Mika', 'Monrow', 'mmonrow@hotmail.com', 1092856473,'HI', 96795, 4),


    ('Jesse', 'White', 'wh1tej3ssie@yahoo.com', 1092184736,'NY', 11224, 5),


    ('Maya', 'Patel', 'patel.maya0104@gmai.com', 1029098574,'OR',97035, 6)




--insert for mags---


Insert into mags (mag_name, mag_email, mag_website,mag_state, mag_zipcode, mag_issue_id)  
values
(' Mutual Aid Network of Anchorage','anchoragemutualiad@gmail.com', 'wearemana.org', 'AK', 94517,6 ),
('Mutual Aid Phx', 'mutualaidphx@gmail.com', 'www.mutualaidphx.com', 'AZ', 85001,7 ),
('SF Mutual Aid ','sfbayareamutualaid@gmail.com', 'www.sfmutualaid.com', 'CA', 94101,4 ),
('Berkeley Mutual Aid', ' info@berkeleymutualaid.org',  'www.berkeleymutualaid.org ', 'CA' ,94701,2 ),
('Mutual Aid Los Angeles Network', ' info@mutualaidla.org', 'www.mutualaidla.org', 'CA', 90012,8 ),
('Denver Mutual Aid ', 'rebecca@denvermutualaid.com', 'www.denvermutualaid.com', 'CO', 80014,4 ),
('Hawaii Peoples Fund ', 'peoples@lava.net', 'hawaiipeoplesfund.org', 'HI', 96795,3 ),
('South Brooklyn Mutual Aid', 'southbkmutualaid@gmail.com', 'www.southbkmutualaid.com', 'NY', 11224,2 ),
('Portland Mutual Aid Network', 'portlandmutualaidnetwork@gmail.com', 'www.portlandmutualaidnetwork.com', 'OR', 97035,1)










---insert donations---


Insert into donations ( donation_mag_id, donation_amount, donation_date)
values
(1, 10.00, '10-23-23'),
(6, 25.00, '9-4-23'),
(3, 50.00, '6-1-20'),
(7, 100.00, '3-14-20'),
(4, 150.00, '2-14-21')


GO








-----insert in to donors ---


Insert into donors (donor_donation_id, donor_user_id) values
(3, 1),
(4, 4),
(5, 5),
(2, 8),
(1, 14)


go  






---insert in to reviews---
Insert into reviews (review_user_id, review_mag_id, review_comment)


values


(4, 7, 'it is very fulfilling being able to help'),


(6, 7, 'Im fortunate to be able to contribute'),


(3, 2, 'my time and donation was appreciated'),


(4, 8, 'This organization is amazing'),


(2, 1, 'I received help fast and when I needed it the most')


go




---insert in to volunteers---
Insert into volunteers (volunteer_user_id) values


    (1),


    (2),


    (4),


    (3),


    (5),


    (7),


    (6),


    (9),


    (8),


    (13),


    (12),


    (14),


    (11),


    (10)




   --- Data science questions --
-- see volunteers with specific interest in issue --
SELECT u.user_firstname, u.user_lastname, u.user_email, i.issue_name
FROM volunteers v
JOIN users u on u.user_id = v.volunteer_user_id
join issues i on i.issue_id= u.user_issue_id
WHERE i.issue_name= 'poverty'
GO

--see volunteers with specific interest in a mag in Hawaii --
SELECT u.user_firstname, u.user_lastname, u.user_email, m.mag_name
FROM volunteers v
JOIN users u on u.user_id = v.volunteer_user_id
 JOIN mags m on m.mag_issue_id = u.user_issue_id
WHERE m.mag_name = 'Hawaii Peoples Fund'


GO



---See donors who donated to Mutual Aid Phx---


SELECT u.user_firstname, u.user_lastname, u.user_email, m.mag_name, o.donation_amount
FROM donors d
JOIN users u on u.user_id = d.donor_user_id
 JOIN mags m on m.mag_issue_id = u.user_issue_id
 join donations o on o.donation_id= d.donor_donation_id
WHERE m.mag_name= 'Mutual Aid Phx'





--- see donors with donation amount of $50  or greater--
SELECT u.user_firstname, u.user_lastname, u.user_email, o.donation_amount, o.donation_date
FROM donors d
JOIN users u on u.user_id = d.donor_id
JOIN donations o on  d.donor_donation_id = o.donation_id
WHERE o.donation_amount>= 50





--- see donors with donation amount of $50  or less--
SELECT u.user_firstname, u.user_lastname, u.user_email, o.donation_amount, o.donation_date
FROM donors d
JOIN users u on u.user_id = d.donor_id
JOIN donations o on  d.donor_donation_id = o.donation_id
WHERE o.donation_amount<= 50