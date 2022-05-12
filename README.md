# Healthcare-Analytics_-Survival-Analysis-of-Lung-Cancer-Patient-Treatment


This project is to understand the effect of chemotherapy (standard treatment) vs chemotherapy combined with a new drug (test treatment) on the Veteran's Administration Lung Cancer Trial data which consists of data of 137 patients with advanced, inoperable lung cancer who underwent this treatment.

Data Source :
Veteran's Administration Lung Cancer Trial, Source: Kalbfleisch and Prentice (pp. 223-224)

From the Kaplan-Meier survival graphs, we can draw the following inferences-
•	Test Treatment results in longer survival days overall in the long run for time greater than 250 days compared to standard treatment. 

•	Days 0 to 25 - No difference in survival days for test treatment i.e., treatment 2+ chemo for first 25 days.

•	Days 45 to 150 - The standard treatment is better than the test treatment with higher survival probability from around 45 days to 180 days.

•	Days 150 to 250 - Between 180 to 250 days, both treatments have almost similar survival probability.

•	Days 250+ - Post 250 days, test treatment has higher survival probability.

•	This could mean that it takes about 6 months to start seeing the effects of the new drug.

•	Also, the confidence levels with respect to the spread (in blue and red on the left graph) are a little higher in area, which implies that test treatment has more confidence on the survival probability than standard treatment. 

R packages :
ggsurvplot,survminer,survival,stargazer

FINAL INTERPRETATION & RECOMMENDATION

•	The new drug treatment increases death risk of patient by 33.8% for patients with celltype1(squamous), 161.3% for celltype2(small cell),101.4% for celltype3(adeno) and 161.7% for patients with celltype4(large cell). 

•	This death risk drops by 91.6% for patients with prior chemotherapy. 

•	Therefore, this treatment can be suggested only to patients with prior chemotherapy who have celltype1(squamous). For this set of patients, death risk will go down by 57.8%.

Code and Report attached to main repository.
