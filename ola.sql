-- 1. Retrieve all successful bookings:

create view successfull_bookings as
select * from bookings
where booking_status = 'success';
select * from successfull_bookings;


-- 2. Find the average ride distance for each vehicle type:
create view ride_distance_from_each_vehicle_type as
select Vehicle_Type , avg(Ride_Distance) 
as avg_distance from bookings
group by Vehicle_Type;
select * from ride_distance_from_each_vehicle_type;


-- 3. Get the total number of cancelled rides by customers:
create view total_rides_cancelled_by_rider as
select count(*) from bookings
where Booking_Status = 'Canceled by Customer';
select * from total_rides_cancelled_by_rider;


-- 4. List the top 5 customers who booked the highest number of rides:
create view highest_booked_rides_from_customer as
SELECT Customer_ID, COUNT(Booking_ID) as total_rides 
FROM bookings GROUP BY Customer_ID 
ORDER BY total_rides DESC LIMIT 5;
select * from highest_booked_rides_from_customer;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues: 
create view canceled_due_to_driver_peronal_issue as
SELECT COUNT(*) FROM bookings 
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';
select * from canceled_due_to_driver_peronal_issue;


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings: 
create view max_min_rating_driver as 
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating 
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';
select * from max_min_rating_driver;



-- 7. Retrieve all rides where payment was made using UPI: 
create view transaction_through_UPI as
SELECT * FROM bookings WHERE Payment_Method = 'UPI';
select * from transaction_through_UPI;


-- 8. Find the average customer rating per vehicle type: 
create view avg_customer_rating_per_vehicle_type as
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
FROM bookings GROUP BY Vehicle_Type;
select * from avg_customer_rating_per_vehicle_type;


-- 9. Calculate the total booking value of rides completed successfully: 
create view total_successfull_rides_value as
SELECT SUM(Booking_Value) as total_successful_value 
FROM bookings WHERE Booking_Status = 'Success';
select * from total_successfull_rides_value;


-- 10. List all incomplete rides along with the reason: 
create view incomplete_rides_with_reason as
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookings WHERE Incomplete_Rides = 'Yes';
select * from incomplete_rides_with_reason;
