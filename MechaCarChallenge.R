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