#SURVIVAL_ANALYSIS 
setwd("C:/AR Files/USF/Projects/Heathcare Survival Analysis")
d <- read.table("LungCancer.txt", skip=15)
str(d)
colnames(d) <- c("treatment", "cell_type", "survivaldays",	"status",	"karnofskyscore","months", "age", "priorchem")

#factorizing character variables
d$treatment <- factor(d$treatment)
d$cell_type <- factor(d$cell_type)
d$priorchem <- factor(d$priorchem)
d$treatment <- relevel(d$treatment, ref="1")
d$priorchem <- relevel(d$priorchem, ref="0")

#vieweing distribution of data
summary(d$survivaldays)
table(d$cell_type)
table(d$priorchem)
table(d$survivaldays)
table(d$status)
table(d$treatment)

#Kaplan-Meier non-parametric analysis
# install.packages("survival")

library(survival)
y <- Surv(d$survival, d$status)
km <- survfit(y ~ treatment, data=d)
summary(km)

library(survminer)
ggsurvplot(fit=km, xlab="Days", ylab="Survival Probability")

library(ggplot2)
library(ggfortify)
autoplot(model_fit) + 
  labs(x = "\n Survival Time (Days) ", y = "Survival Probabilities \n", 
       title = "Survival Times Of \n Patients \n") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.title.x = element_text(face="bold", colour="#FF7A33", size = 18),
        axis.title.y = element_text(face="bold", colour="#FF7A33", size = 18),
        legend.title = element_text(face="bold", size = 18))

#KM Estimates for 365 and 183 days 
model_fit <- survfit(Surv(d$survivaldays,d$status) ~ d$treatment, data = d)
summary(km, times=365)
summary(km, times=183)
print(km)
survdiff(Surv(d$survivaldays, d$status) ~ d$treatment, data = d)

kmgroup <- survfit(Surv(d$survivaldays,d$status) ~ d$cell_type) 
summary(kmgroup)
print(kmgroup)

#cell type 2 and 3 i.e., small cell and adeno have far less survival days based on our sample size 

hist(d$survivaldays)
hist(log(d$survivaldays))
#log transformation looks more normal

#Analysis with selected variables
y <- Surv(d$survivaldays,d$status) 
cox2 <- coxph(y ~ treatment + cell_type +  months+ age + priorchem)
exp2 <- survreg(y ~ treatment + cell_type +  months+ age + priorchem, dist="exponential")
weibull2 <- survreg(y ~ treatment + cell_type +  months+ age + priorchem, dist="weibull")
loglogistic2 <- survreg(y ~ treatment + cell_type +  months+ age + priorchem, dist="loglogistic")

library(stargazer)
stargazer(cox2, exp2, weibull2, loglogistic2, type="text",single.row=TRUE)

#Analysis with Interaction Terms

cox <- coxph(y ~ treatment*cell_type + treatment*age + treatment*months 
             + treatment*priorchem, data=d, method="breslow")

exp <- survreg(y ~ treatment*cell_type + treatment*age + treatment*months 
               + treatment*priorchem, data=d, dist="exponential")

weibull <- survreg(y ~ treatment*cell_type + treatment*age + treatment*months 
                   + treatment*priorchem, data=d, dist="weibull")

loglogistic <- survreg(y ~ treatment*cell_type + treatment*age + treatment*months 
                       + treatment*priorchem, data=d, dist="loglogistic")

stargazer(cox, exp, weibull, type="text", single.row=TRUE)