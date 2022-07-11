# Pewlett-Hackard-Analysis
Pewlett-Hackard-Analysis

# Overview of the analysis:
Determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. This will be done by analyzing multiple csv files that contain employee, employment titles and department data. Tables were created on pgAdmin 4 to facilitate the analysis. 

# Results:

## Retirement Titles Analysis

This analysis was done on two tables (employees and title). Both tables had unique data that was needed for the analysis. For the Employee table it had the first_name and last_name. While the Titles table had the title, from_date and to_date data. To join both data sets and create a new table with the required data, the emp_no data which was used as a reference for both data set as the primary key was used. Both tables had other data that was not requested but was needed to filter the data set. To identify the group of employees that were nearing retirement age, it was necessary to know when they were born. In this case, we were interested in employees that were born between 1952 and 1955.  However, after the data set was generated, it was noticed that there were duplicate data sets. The differentiator was the title of the employee and the to_date when the emplyee ended their last position and were promoted. IT could also be that the employees that were no longer employed with the company were still visisble in the data set.
![retirement_titles](https://user-images.githubusercontent.com/104809098/178184290-8d7ca89d-2bf4-41fc-8f59-a188fd41fc98.png)

## Unique Titles Analysis

The second analysis involved removing any duplicate data and focusing on the current employees. For this analysis it was easier to use the first data set that was generated. The requested data was minimized as well: emp_no, first_name, last_name and title. In this case the first step was removing any duplicate data. For this we needed to sort the data set first with the ascending emp_no and descending to_date. This way when the DISTINCT ON() function was used, the latest data for each employee would remain. The data was also filter by the to_date to verify that only current employees where analyzed.    
![unique_titles](https://user-images.githubusercontent.com/104809098/178185862-ea188294-d430-4a2e-908d-752b60dc0b80.png)

## Retiring Titles Analysis 

The third analysis required the count for each title of the soon to be retired employee. By getting the count one can see which job classification will be the most impacted by the retirement wave. By using the data set for the unique titles, it was simple to obtain the title count for each employee that is soon to retire. By sorting the count in descending order, one can visually determine the impact on each title.  
![retiring_titles](https://user-images.githubusercontent.com/104809098/178186738-5aca444f-7156-4c0a-9e21-7acc7d6fe1d9.png)

## Mentorship Eligibilty Analysis

Base on the previous analysis, it was determined that the impact of the the retirement wave would greatly impact the company. As a counter measure it was decided to create a mentorship eligibility data base. This meant looking at three data tables: Employees, Department Employee and Titles. By using all three tables, the mentorship eligibility data set can be quickly created. The first step is identifying what data is required from each table. From the Employees table the dat  required was the first_name, last_name and birth_date. From the Department Employee table the data required was the form_date and the to_date. Form the Titles table the data required was the title. The primary key used to join all three tables was the emp_no. As previously shown the data set needed to be filtered for all the current employees. It birth_date was used to identify the employees that would be elible to participate in the mentorship program by filtering for anyone born between January 1, 1965 and December 31, 1965. As was previously done, the all duplicate data needed to be removed and the most current data needed to remain. 
![Mentorship_eligibility](https://user-images.githubusercontent.com/104809098/178188175-4d50a039-02ee-44f3-a225-7dc3c06023cf.png)

# Summary

## How many roles will need to be filled as the "silver tsunami" begins to make an impact?

That is difficult to determine. This needs to be dermined by looking at each department. Some department's functionality might have dreacesed with the advent of new technology. IT is a good example of work that has been outsourced to other nations with the advent of the internet. It is also important to note that new department might be required to fill in the gap of a new market. The current budget for each department needs to be identified. It is well known that employees that stay with a company for many years make less than what the current market might dictate.    

## Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?

That needs to be determined after identifying how many people are required to fill in the future vacant positions. It is also important to look at how robust the current process for each impacted department is. Departments with well-defined roles and procedures might require less guidance. Departments with subpar documentation will be highly impacted as the gap in knowledge from senior employees is lost and needs to be re-learned by the employee that fills the position.   

## Queries that need to be performed

With the available data sets, the first query that need to be performed is on which department will be impacted. This will give a better idea on what type of countermeasure might be required. For example, department with subpar documentation might require the company to convince the retiring employee to stay on as a part-time position until the department fills in his position or enough information is documented to facilitate a better transfer of information. 

The necessary query is to gather market information on how much it would take to replace the positions that might need to be opened to outside employees. Then that information needs to be compared to the current budget for each department that will be impacted. Of course one needs to look at the openings that will occur due to the promotion of current employees to the vacant positions. 












