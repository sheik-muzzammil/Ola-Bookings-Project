create database ola;
use ola;
select * from bookings;
select count(Date) from bookings ;
show columns from bookings;
ALTER TABLE bookings CHANGE COLUMN `Booking Status` booking_status VARCHAR(255);

#1. Retrieve all successful bookings:
create view Successful_bookings as 
select * from bookings where Booking_Status = "Success";
select * from Successful_bookings;

#2. Find the average ride distance for each vehicle type:
create view average_ride_distance_for_each_vehicle as
select Vehicle_Type, avg(ride_distance) from bookings group by Vehicle_Type ;

#3. Get the total number of cancelled rides by customers:
create view  cancelled_rides_by_customers  as 
select count(*) from bookings where booking_status = 'cancelled';

#4. List the top 5 customers who booked the highest number of rides:
create view top5_customers as
select customer_ID , count(Booking_ID) as total_rides from bookings group by Customer_ID order by total_rides desc  limit 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_drivers as 
select count(*) from bookings where Reason_for_Cancelling_by_Driver
= 'Personal & Car related issues' ;


#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view min_max_ratings as
select max(driver_ratings) , min(driver_ratings) from bookings where vehicle_type = "Prime sedan";

#7. Find the average customer rating per vehicle type:
create view avg_customer_rating as 
select vehicle_type ,avg(Customer_Rating) from bookings group by vehicle_type; 


#8. Calculate the total booking value of rides completed successfully:
create view total_successful_booking_values as
select sum(booking_value) from bookings where booking_status = 'Success';

#9. List all incomplete rides along with the reason:
select booking_id , Incomplete_Rides_Reason
 from bookings where incomplete_rides = 1;
