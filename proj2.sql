-- Creating Database aircargo and querying to start using it
create database aircargo;
use aircargo;
show tables;

-- Creating Table route
CREATE TABLE routes_details (
  route_id int NOT NULL,
  flight_num int NOT NULL,
  origin_airport varchar(3) NOT NULL,
  destination_airport varchar(100) NOT NULL,
  aircraft_id varchar(100) NOT NULL,
  distance_miles int NOT NULL,
  PRIMARY KEY (route_id),
  CONSTRAINT Flight_number_check CHECK ((substr(flight_num,1,2) = 11)),
  CONSTRAINT routes_chk_1 CHECK ((distance_miles > 0)) );
  
  select * from ticket_details;
  
  
  --  query to display all the passengers (customers) who have traveled on routes 01 to 25
  Select * from passengers_on_flights WHERE route_id between 1 AND 25;
  
  select * from passengers_on_flights;
  
  --  query to identify the number of passengers and total revenue in business class from the ticket_details table.
Select Count(customer_id) AS 'NO. OF PASSENGER' , sum(Price_per_ticket) AS REVENUE from ticket_details Where class_id='Bussiness' ;


-- query to display the full name of the customer by extracting the first name and last name from the customer table
 Select  CUSTOMER_ID, concat(first_name,last_name) AS  "FULL NAME"  , date_of_birth,gender from customer;

-- query to extract the customers who have registered and booked a ticket.
select c.customer_id , concat(c.first_name, ' ' , c.last_name) as Name, count(t.no_of_tickets) as Total_Tickets_booked
from customer c
join ticket_details t using (customer_id)
group by c.customer_id, Name
order by Total_tickets_booked desc;

-- query to identify the customer’s first name and last name based on their customer ID and brand (Emirates)
Select c.first_name,c.last_name,c.customer_id from customer c 
join ticket_details t using (customer_id)
Where t.brand='Emirates' Group by c.customer_id;

-- query to identify the customers who have traveled by Economy Plus class using Group By and Having clause
Select * from passengers_on_flights GROUP BY Customer_id 
Having class_id='Economy PLus';


-- query to identify whether the revenue has crossed 10000 using the IF clause on the ticket_details table
select * from ticket_details;
select if(sum(no_of_tickets*price_per_ticket) > 1000, 'Revenue Crossed 10000', 'Revenue less than 10000') as Revenue_Status
from ticket_details;



--  query to create and grant access to a new user to perform operations on a database.
CREATE USER 'AD'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'AD'@'localhost' WITH GRANT OPTION;



-- query to find the maximum ticket price for each class using window functions on the ticket_details table.
SELECT DISTINCT class_id, MAX(Price_per_ticket) OVER( PARTITION BY class_id) AS Max_class_price
 FROM ticket_details;
 
 
 -- query to extract the passengers whose route ID is 4 by improving the speed and performance of the passengers_on_flights table.
Select * from passengers_on_flights where route_id=4;



-- 