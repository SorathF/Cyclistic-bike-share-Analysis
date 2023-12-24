# Cyclistic-bike-share-Analysis
## Introduction
This project is a part of Google Data Analytics Certification. The purpose is to comprehend how annual members and casual riders use Cyclistic bikes differently. 

Tools used: Postgre SQL and Tableau.
### Scenario 
You are a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. 
### Overview of the Company
In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime. Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members. Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs. Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.
## Ask
### Business task
Analyze the historical data of Cyclistic to understand the usage pattern of customers. The insights gained from the analysis will be used in designing strategies to convert casual riders into annual members. 
Following are the three main questions that will guide the analysis:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?
### Key Stakeholders
Director of Marketing- Lily Moreno

Cyclistic Marketing Analytics Team

Cyclistic Executive Team
## Prepare
The annual data for the year 2021 is collected from [here](https://divvy-tripdata.s3.amazonaws.com/index.html). It has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement). The dataset contains 12 months of data in CSV files. Each file includes thirteen columns: ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual. I used SQL queries located [here](https://github.com/SorathF/Cyclistic-bike-share-Analysis/blob/2e8d137b55dbfe96103d7d6d0cbebd02c1be5e33/Data%20Preparation.sql). The following steps are performed to prepare the data.

•	Created a table with thirteen columns.

•	Imported files to SQL. 

•	Verified the imported data to ensure it is properly formatted.
## Process
This phase entails cleaning and transforming the data. 

[SQL query](https://github.com/SorathF/Cyclistic-bike-share-Analysis/blob/d6f00f91f4f64a8011a90f9aafc4dc23a8f46a80/Data%20Cleaning.sql)
### Data Cleaning
•	Checked for duplicate rows (none found)

•	Checked for NULL values 

| Column  | NULL Values |
| ------------- | ------------- |
| start_station_name | 700835  |
| start_station_id  | 700832  |
| end_station_name  | 749196  |
| end_station_id  | 749196  |
| start_lat  | 10026  |
| start_lng  | 10026  |
| end_lat  | 14797  |
| end_lng  | 14797  |

•	Checked for inconsistencies in rideable_type and member_casual columns (none found).

•	Created a new table for cleaned data with the following changes:

Removed columns: start_station_id, end_station_id, start_lat, start_lng, end_lat, end_lng. 

Added columns: trip_duration, day of week.

Renamed columns: rideable_type to Bike_Types, member_casual to Membership_Type.

### Data Validation
•	Checked for any outliers exist in Trip_Duration column ( none found). 
## Analysis
As the data is cleaned, it's time to analyze it. The main goal of the analysis is to understand how casual and members use bikes differently. I’ve analyzed different metrics to understand the usage patterns of customers. All SQL codes for analysis are located [here](https://github.com/SorathF/Cyclistic-bike-share-Analysis/blob/d6f00f91f4f64a8011a90f9aafc4dc23a8f46a80/Data%20Analysis.sql). The insights derived from the analysis are as follows:
1.	The total number of rides was 4,534,203. Casual rides account for 44.77%, while annual rides account for 55.23%. 
2.	The popular bike type among annual and casual members was the classic bike. The least preferred bike type was docked_bike. 
3.	Ride usage of both casual and annual members increased between 5 PM and 6 PM. 
4.	Members have more rides on weekdays, while casual members take more rides on Fridays and Saturdays.
5.	Customers have higher ride usage in summer and lower usage in winter.
## Share
Finally, Tableau was used to visualize the data. An interactive dashboard was created to present the key findings of the analysis. You can find visualization [here](https://public.tableau.com/views/Work_17031486030230/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link).
### Total Rides
![Total Rides.png](https://github.com/SorathF/Cyclistic-bike-share-Analysis/blob/main/Total%20Rides.png)

### Hourly Trends
![Hourly Trends](https://github.com/SorathF/Cyclistic-bike-share-Analysis/blob/fe2144e03df9e570fa712b60e5f52f2110a22234/Hourly%20Trends.png)
### Daily Trends
![Daily Trends](https://github.com/SorathF/Cyclistic-bike-share-Analysis/blob/main/Daily%20Trends.png)
### Popular Bike Types
![Popular Bike Types](https://github.com/SorathF/Cyclistic-bike-share-Analysis/blob/fe2144e03df9e570fa712b60e5f52f2110a22234/Popular%20Rides.png)
### Monthly Trends
![Monthly Trends](https://github.com/SorathF/Cyclistic-bike-share-Analysis/blob/main/Monthly%20trends.png)
### Seasonal Trends 
![Seasonal Trends](https://github.com/SorathF/Cyclistic-bike-share-Analysis/blob/c0ef500cf3c156be5f8d54f30ad511ee5f9b96c1/Seasonal%20pattern.png)
## Act
Based on the analysis, here are the four recommendations:

•	Organize social media marketing campaigns highlighting the benefits of riding on weekdays. Include benefits such as hassle-free commutes to work, less fuel consumption, and decreased heart disease risk.

•	Introduce member loyalty program in the form of points, discounts and rewards. 

•	Host cycling events in summer and promote them on social media, using relevant hashtags. Share visually appealing content on social media. Collaborate with a cafe to offer refreshments.

•	Highlight case studies of customers using rides in their daily lives on social media.
