# Power Abuse: An Analysis of Police Brutality and its Pervasiveness in the US: Project Proposal

## *_Codename: Project Police Brutality_*  
Calvin Tzen, nivlac@uw.edu  
Lesley Xu, cxu24@uw.edu  
Olivia Nurita Price, oprice@uw.edu  
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington  
Autumn 2022

### Problem Domain
**Project framing**: Because our problem is police brutality in the US, the problem domain includes the various factors that can lead to police brutality. We will be addressing various factors such as race, location, graduation rate, and household income from multiple perspectives such as governmental, social, and economic. Addressing these factors can allow us to ask whether there’s any correlation between them and cases of police brutality. According to “How place and race drive the numbers of fatal police shootings in the US: 2015–2020.”,race and location play a significant role in fatal police shootings. At the same time, the rate of shootings remains steady over the past few years according to “Fatal force: Police shootings database.” “Tract level associations between historical residential redlining and contemporary fatal encounters with police”, different from the other two references, provided us with an insight of the correlation between the location and the probability of fatal police shootings happening. For instance, the areas redlined by HOLC are predicted to be having more fatal encounters.

**Human values**: Some human values of our project are social justice, human rights, civic responsibility. We find it important for us and those that view our project to understand the severity of police brutality and do what we can to make differences. These values originate from a desire to be a part of society that promotes peace and equality. Value tensions?

**Stakeholders**: The direct stakeholders of our project concerning police brutality include police officers and the general public, or anyone that can be a victim of police brutality because our project directly affects police officers and their potential victims. The general public has the right to feel protected by the police, and avoid discrimination, and our project aims to demonstrate the violation of that right, so that the general public is aware of the lack of safety and fairness that they could potentially experience. The general public could be motivated to educate themselves on these experiences and keep themselves safe, while the police could be motivated to recognize the inequities in the criminal justice system to make a change in their everyday lives. The indirect stakeholders include policy-makers, activists, and other people within the criminal justice system, such as lawyers and judges. As police brutality continues to be an issue, these indirect stakeholders can further make changes within our society and always consider these issues.

**Benefits and harms**: The benefits of our project include getting a clear picture of the victims of fatal U.S. police shootings through data wrangling. The intervention of data and technology with our problem we’re addressing can allow for us to consider multiple factors and variables and use technology to compare that with cases of police brutality. The stakeholders such as the general public and potential victims can be benefited as their issues are being addressed to positively make a change. Police officers could feel harmed as people will want to take action against what they are doing, therefore affecting their jobs. An unanticipated consequence that could occur is that because of the lack of accurate data, our results might not produce what we expect it to produce, and therefore not be as helpful in continuing the conversation about these issues. According to research done at University of Washington, “Nearly 60% of deaths among Black people were misclassified, making this group the most under-reported of all races.”. Situations like these make inaccurate results plausible.


### Research Questions
People will have a stereotype on the power difference between different groups of people, and females are believed to be less strong than males. Were those fatal police shootings tend to observably happen to more females or to males? Is there an obvious positive correlation between genders and police shootings?  

What proportion of police shootings involve a minority group?
Or Is racism a factor in police brutality? We can see what races are targeted the most and this helps us see if certain race groups are being disproportionately targeted by the police. This can address the racism that occurs by the police.

Is there a correlation between police brutality and other factors? Factors such as household income and state that it occurred in can be looked at against reports of police brutality. Looking at other variables beside race can widen the conversation about factors affecting police brutality, and we can potentially discuss ways to address it.

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
