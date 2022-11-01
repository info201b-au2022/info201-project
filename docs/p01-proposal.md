# Power Abuse: An Analysis of Police Brutality and its Pervasiveness in the US: Project Proposal

## *_Codename: Project Police Brutality_*  
Calvin Tzen, nivlac@uw.edu  
Lesley Xu, cxu24@uw.edu  
Olivia Nurita Price, oprice@uw.edu  
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington  
Autumn 2022

### Abstract
We are concerned with the cases of police brutality occurring in the United States because the number of brutal use of force toward minority groups continues to rise.
To address this concern, we plan to analyze data concerning police brutality and display our results of analysis through visualizing the data, answering questions, and summarizing our findings. We will try to pinpoint specific factors that account for the reason people are being unfairly targeted by the police.

### Keywords
_Police brutality; Racism; Racism in the United States; Demographics; use of force;_

### Introduction
Police brutality poses a huge issue to society as reports of it continue to occur. With so many wrongful deaths and injuries happening to civilians by the police, it brings up the conversation about the discrimination that allows this to happen. Our team aims to investigate the issue of police brutality in the United States by analyzing different datasets from years 2015 to 2017. We hope to examine the factors relating to the police’s unnecessary use of force towards civilians. We want to mainly consider how race is correlated with police brutality, but also look at other factors such as location, manner of death, and certain facts concerning those locations like high school graduation rate and poverty rate. We hope by analyzing these factors, we can continue a discussion about the discrimination that happens within the different cases of police brutality.

### The Dataset
The dataset that we’ve chosen contains data concerning police brutality victims, including information such as manner of death, whether or not they were armed, gender, age, race, mental illnesses, attempts to flee, and city of death. In addition, they’ve provided information about the various cities, such as median household income, high school graduation rate of everyone over 25, poverty levels, and the demographic with regards to race. This data will help us answer our research questions as they provide variables that we can analyze to see if there’s any correlation between them, such as number of incidents vs the high school graduation rate in a city, or the race of people killed vs the demographic in the city.

| Name of data file | # of rows (observations) | # of columns (variables) |
| :--- | :--- | :---|
| PoliceKillingsUS.csv | Unsure, at least 2800 | 14 |
| ShareRaceByCity.csv | 24219 | 7 |
| PercentagePeopleBelowPovertyLevel.csv | 24255 | 3 |
| PercentOver25CompletedHighSchool.csv | 24255 | 3 |
| MedianHouseholdIncome2015.csv | 24249 | 3 |

The citation for the dataset is included in our references.

This dataset was collected by Karolina Wullum, a current Product Manager at NIUM in Singapore. She cites the Washington Post as the chief contributor to the compilation of the database of fatal killings by police, caused by the difficulty of finding this kind of information otherwise, due to the killings not being comprehensively documented and thus allowing many cases to go unreported. Wullum also collected census data on poverty rate, high school graduation rate, median household income, and racial demographics in many US cities, citing this data from a government data census. It is unknown how the data collection method was funded, though seeing as much of the data came from the Washington Post, it can be assumed that the newspaper funded much of the research. This data benefits those who are looking to find more detailed information regarding police killings and those who are trying to find if there’s any correlation with these killings and other factors, as well as policymakers to try and reinforce safer and proactive policies. As the Washington Post is a wildly popular newspaper in the US with millions of readers every month, we assume that the data was validated with qualified professionals and held secure, thus making it a credible and trustworthy dataset. We personally obtained this data through Kaggle, where Wullum posted this data for the general public to look at.

### Expected Implications
Through analyzing, visualizing, and presenting the police shooting dataset, we hope our work will address the discussion of the rationality of those fatal police shootings, and the influences to society. By answering the question of whether or not police shootings include racism or gender as a key factor, we hope that our work will be able to prove the defining factors that play into police brutality and unwarranted deaths. We’ve previously seen how police officers in many states require only 12 months or less of training before being cleared to serve on the force. If we find that for example, police in cities with a low high school graduation rate contain many instances of police brutality, then we may be able to link how lack of education can lead to violence-commiting officers. Possible implications for policymakers may include a more well-regulated policy on the use of force, as well as more qualifications and training required in order to become a police officer.

### Limitations
Some limitations that we’ve considered for our dataset include the fact that it might be a little bit outdated, with a lot of these datasets ending around 2017-2020. These end before COVID hit, so the data may not be representative of current situations. One dataset we found that covered the most amount of information only addresses the years 2015-2017. Because this data is a bit outdated, the results of our findings might not be completely relevant to the current state of police brutality in the US. However, since police brutality is an ongoing issue, we hope it still addresses the still current problems with racism in police brutality. Another limitation that we’ve considered is that within the dataset some minorities will not be represented well. Certain traits such as one’s sexuality or specific race may fall under umbrella terms so that they are less likely to be looked at specifically. Due to the low participation from law enforcement, FBI are no longer posting dataset containing details of each incident to the public.

### References

Mitchell, J., & Chihaya, G. K. (2022, April 26). Tract level associations between historical residential redlining and contemporary fatal encounters with police. Social Science &amp; Medicine.
https://www.sciencedirect.com/science/article/pii/S0277953622002957

Untrained police. The Institute for Criminal Justice Training Reform. (n.d.). Retrieved October 31, 2022, from https://www.trainingreform.org/untrained-police

WebMD. (2021, November 15). Lack of data hinders study of police killings. WebMD. https://www.webmd.com/a-to-z-guides/news/20211115/lack-of-police-killing-data

Wullum, K. (2017, September 22). Fatal police shootings in the US. Kaggle. Retrieved October 31, 2022, from https://www.kaggle.com/datasets/kwullum/fatal-police-shootings-in-the-us

WP Company. (2020, January 22). Fatal force: Police shootings database. The Washington Post. https://www.washingtonpost.com/graphics/investigations/police-shootings-database/

Zare, H., Meyerson, N. S., Delgado, P., Crifasi, C., Spencer, M., Gaskin, D., &amp; Thorpe, R. J. (2022, July 2). How place and race drive the numbers of fatal police shootings in the US: 2015–2020. Preventive Medicine. https://www.sciencedirect.com/science/article/pii/S0091743522001815
