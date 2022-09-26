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