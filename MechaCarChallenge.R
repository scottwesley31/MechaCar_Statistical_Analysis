#################
# Deliverable 1 #
#################

# 3. Load the dplyr package
library(dplyr)

# 4. Import and read the MechaCar_mpg.csv file as a dataframe.
Mecha_table <- read.csv(file='MechaCar_mpg.csv', check.names=F, stringsAsFactors = F)
head(Mecha_table)

# 5. Perform multiple linear regression using all variables
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance +
     AWD,data=Mecha_table)

# 6. Determine the p-value and the r-squared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance +
             AWD,data=Mecha_table))

#################
# Deliverable 2 #
#################

# 2. Import and read in the Suspension_Coil.csv file as a table
Suspension_table <- read.csv(file='Suspension_Coil.csv', check.names=F, stringsAsFactors = F)
head(Suspension_table)

# 3. Create a total_summary dataframe using the summarize() function to get
# the mean, median, variance, and standard deviation of PSI
total_summary <- Suspension_table %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI),
            SD=sd(PSI), .groups = 'keep')

# 4. Create a lot_summary dataframe using the group_by() and summarize() functions
# to group each manufacturing lot by mean, median, variacne, and SD of the PSI
lot_summary <- Suspension_table %>% group_by(Manufacturing_Lot) %>% 
  summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI),
  SD=sd(PSI), .groups = 'keep')

#################
# Deliverable 3 #
#################

# 1. Use the t.test() function to determine if the PSI across all manufacturing
# lots is statistically different from the population mean of 1,500 PSI.

# Normality tests for PSI
# Test distribution of PSI from Suspension_Coil dataset

# Import tidyverse
library(tidyverse)

# Visualize distribution using density plot
ggplot(Suspension_table,aes(x=PSI)) + geom_density()

# Import dataset into ggplot2
plt <- ggplot(Suspension_table,aes(x=PSI))
# Visualize distribution using density plot
plt + geom_density()

# Randomly sample 50 datapoints
sample_table <- Suspension_table %>% sample_n(50)
# Import dataset into ggplot2
plt <- ggplot(sample_table,aes(x=PSI))
# Visualize distribution using density plot
plt + geom_density()

# Use t.test() to check if PSI from sample_table and Suspension_table
# are the same (one-sample t-test)
# Compare sample versus population means
t.test(sample_table$PSI,mu=mean(Suspension_table$PSI))

# p-value is above assumed significance level of 0.05%; therefore there is not
# sufficient evidence to reject the null hypothesis. The two means are
# statistically similar.

# 2. Use the t.test() function and its subset() argument to determine if the PSI
# for each manufacturing lot is statistically different from the population
# mean of 1,500 per square inch.

# Filter Suspension_table using subset() function for Lot1
Lot1_table <- subset(Suspension_table, Manufacturing_Lot == "Lot1")

# Use t.test() to check if PSI from Lot1 and Suspension_table
# are the same (one-sample t-test)
# Compare the subset mean to the population mean
t.test(Lot1_table$PSI,mu=mean(Suspension_table$PSI))

# Results in p-value of 1.568e-11

# Filter Suspension_table using subset() function for Lot2
Lot2_table <- subset(Suspension_table, Manufacturing_Lot == "Lot2")

# Use t.test() to check if PSI from Lot2 and Suspension_table
# are the same (one-sample t-test)
# Compare the subset mean to the population mean
t.test(Lot2_table$PSI,mu=mean(Suspension_table$PSI))

# Results in p-value of 0.0005911

# Filter Suspension_table using subset() function for Lot3
Lot3_table <- subset(Suspension_table, Manufacturing_Lot == "Lot3")

# Use t.test() to check if PSI from Lot3 and Suspension_table
# are the same (one-sample t-test)
# Compare the subset mean to the population mean
t.test(Lot3_table$PSI,mu=mean(Suspension_table$PSI))

# Results in p-value of 0.1589