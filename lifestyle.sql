CREATE DATABASE LIFESTYLE;
USE LIFESTYLE;
DESCRIBE Health;
#Retrieve all records from the dataset
SELECT * FROM health
limit 5;

#Show only Age, Gender, Sleep Duration.
SELECT Age, Gender, Sleep_Duration FROM health;

#Find all people whose Sleep Duration > 7 hours.
Select * from health 
where Sleep_Duration >7;

#Count total number of records.
SELECT COUNT(*) as total_records FROM health;

#Get distinct values of Occupation.
Select distinct Occupation from health ;

#Find number of males and females.
Select Count(*),Gender from health
group by Gender;

#Find average sleep duration of all people.
Select avg(Sleep_Duration) from health;

#Find average stress level by Gender.
Select avg(Stress_Level) as avgstress ,Gender from health
group by Gender;

#Count number of people in each BMI Category.
Select Count(*),BMI_Category from health
group by BMI_Category;

#Find top 3 occupations with highest average stress level.
Select avg(Stress_Level) as avgstress, Occupation from health
group by Occupation 
order by Occupation desc
limit 3;

#Find people with Sleep Disorder = 'Insomnia' and Stress Level > 6.
Select * from health 
where Sleep_Disorder = 'Insomnia' and Stress_Level >6;

#Find average Daily Steps by Occupation.
select avg(Daily_Steps) as avgsteps ,Occupation from health
group by Occupation;

#Get minimum and maximum Heart Rate.
Select min(Heart_Rate) as minimum_heart_rate, max(Heart_Rate) as maximum_heart_rate from health;

#Find correlation-like insight (approx):→ People with high stress (>6), what is their avg sleep duration?
Select avg(Sleep_Duration) from health
where Stress_Level>6;

#Rank people based on Sleep Duration
SELECT *,
RANK() OVER (ORDER BY Sleep_Duration DESC) AS SleepRank
FROM health;

#Find top 5 most active people (Daily Steps)
Select * from health
order by Daily_Steps desc
limit 5;

#Find percentage of people with Sleep Disorder
SELECT 
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM health)) AS percentage
FROM health
WHERE Sleep_Disorder <> 'None';

#Create age groups and count people in each
SELECT 
    CASE 
        WHEN Age < 30 THEN 'Young'
        WHEN Age BETWEEN 30 AND 50 THEN 'Middle Age'
        ELSE 'Senior'
    END AS Age_Group,
    COUNT(*) AS Count
FROM health
GROUP BY Age_Group;

#Find average sleep duration for each Sleep Disorder
Select avg(Sleep_duration) as avg_duration,Sleep_Disorder
from health
group by Sleep_Disorder;

#Find which BMI Category has highest stress level
Select BMI_Category, avg(Stress_Level) as avg_stress
from health
group by BMI_Category
order by avg_stress desc;