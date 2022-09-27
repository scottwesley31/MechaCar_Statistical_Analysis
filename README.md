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
When looking at the summary statistics of the `total_summary` table, all of the suspension coils as a collective group do pass the design specifications at a variance < 100 PSI (~62.29 PSI). This is not the case when each manufacturing lot is considered. Despite having a similar mean and median to the other manufacturing lots, the overall PSI variance is well outside of design specifications (~170.29 PSI). It's high standard deviation value (13.05) also indicates a large spread of data.

### T-Tests on Suspension Coils

A one-sample t-test was run on the PSI values of the population dataset (`Suspension_table`) and a randomly sampled group of 50 datapoints from the same dataset (`sample_table`). The statistical findings of this t-test were are depicted below:

![t-test_all](https://user-images.githubusercontent.com/107309793/192177327-a424e7fe-62d4-42f5-b823-14feeebd8f2a.png)

In this case the calculated p-value is over the assumed significance level of 0.05% (0.05869) which means that there isn't sufficient evidence to reject the null hypothesis. The two means are statistically similar.

The `Suspension_table` was then filtered for only the datapoints relevant to each manufacturing lot (Lot1-Lot3) and each of these sample means (`Lot1_table`, `Lot2_table`, and `Lot3_table`) were compared to the original population mean also utilizing a one-sample t-test. The results for each comparison are depicted below:

#### Lot 1
![t-test_lot1](https://user-images.githubusercontent.com/107309793/192177739-73ac5bdb-40d0-4500-a7fe-62fcfe89a356.png)

The p-value in this case is really small (1.568e-11) meaning the null hypothesis can be rejected and indicating that the means are statistically different.

#### Lot 2
![t-test_lot2](https://user-images.githubusercontent.com/107309793/192178695-20f7625a-f9bf-43fe-8255-c2412f0924f7.png)

Just like Lot 1, the p-value in this case is also small (0.0005911) which means the null hypothesis can also be rejected. The means are statistically different.

#### Lot 3
![t-test_lot3](https://user-images.githubusercontent.com/107309793/192178839-d314e75f-f7a9-48b4-a8c9-ea2cfe45c98e.png)

Lastly, the p-value for Lot 3 is 0.1589 which indicates that there is insufficient evidence to reject the null hypothesis. The Lot 3 mean is statistically similar to the population mean.

### Study Design: MechaCar vs Competition

This study design is under the assumption that additional data can be obtained for MechaCar performance (outside of the existing data from `MechaCar_mpg.csv` and `Suspension_Coil.csv`.

#### What metric or metrics are you going to test?
These are the metrics I would test which relate to car performance:
- Horsepower (hp)
- Quarter mile race time (qsec)
- Breaking distance
- Fuel economy (mpg)

#### What is the null hypothesis and alternative hypothesis?
**Null Hypothesis**
There is no statistical difference between the MechaCar performance mean (hp, qsec, breaking distance, mpg) and competitor performance mean.
**Alternative Hypothesis**
There is a statistical difference between the MechaCar performance mean and the competitor performance mean.

#### What statistical test would you use to test the hypothesis? And why?
All of the metrics listed above are numeric and continuous because they are measurements. Each metric can be compared to it's counterpart between the two groups (i.e. MechaCar horsepower vs. competitor horsepower) meaning they are also dichotomous. Assuming that the MechaCar and competitor metrics are sampled randomly from a resonably large population dataset, a two-sample t-test would be appropriate to compare the distributions means of each corresponding metric.

Prior to running the two-sample t-test for each metric, each sample would need to be checked for normal distribution. Each metric sample could be used to graph a density plot to better visualize the distribution. Then the Shapiro-Wilk test could be run to confirm a p-value larger than 0.05.

Once the t-test results for each metric are run, the null hypotheses can either be rejected or supported allowing for an overall statistically supported comparison of performance between MechaCar and it's competitor. Looking objectively at the statistical differences between each sample mean would confirm which metrics are better (or not truly different) and therefore which population of cars perform better overall.

#### What data is needed to run the statistical test?
The datasets from both MechaCar and the competitor would need to be reasonably large since samples will be pulled randomly for all four metrics (hp, qsec, breaking distance, and mpg). The data should include unique values for vehicle IDs (or at least data associated with specific models) which would ensure duplicates are not randomly sampled into the statistical analysis step. I also feel that the dataset from each company should be comparable in size.
