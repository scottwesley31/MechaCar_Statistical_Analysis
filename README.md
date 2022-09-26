# MechaCar_Statistical_Analysis
Module 15

## Results

### Linear Regression to Predict MPG

Multiple linear regression was performed on the MechaCar fuel efficiency dataset. Here is a screenshot of the results:
![linear_regression](https://user-images.githubusercontent.com/107309793/192170088-e717eef0-cf80-4ed5-a5c6-6ed6ba94b93f.png)

#### What variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?
1) Intercept ***
2) vehicle_length ***
3) ground_clearance ***

#### Is the slope of the linear model considered to be zero?
The p-values of the coefficients listed above are all less than an assumed significance level of 0.05%. This indicates that the slope of this linear model is not zero (because there is sufficient evidence to reject the null hypothesis of a non-zero slope).

#### Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?
In this case the reported r-squared value from this multiple linear regression is ~0.72 which indicates that roughly about 72% of the variablity for fuel efficiency (mpg) is accounted for using this linear model. It's notable that the intercept is highly signficant which could mean that there are other variables not considered in this model contributing to the variance. Most of the time this model can predict mpg but a lack of significance in the 3 other variables likely indicates overfitting.

### Summary Statistics on Suspension Coils

Summary statistics of all suspension coils tested are included in the `total_summary` table below:
![total_summary](https://user-images.githubusercontent.com/107309793/192172150-e8f29992-edec-40f3-ba75-306fbefe96fc.png)

The same set of summary statistics were then calculated for each manufacturing lot in the `lot_summary` table below:
![lot_summary](https://user-images.githubusercontent.com/107309793/192172200-1e75bb66-210f-4802-b631-b0767b49835a.png)

#### The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?
