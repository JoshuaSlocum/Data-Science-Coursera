# Reproducible Research: Peer Assessment 1


## Loading and preprocessing the data
First, we load the step data into a data frame called "data".

```r
data <- read.csv("activity.csv",header=TRUE)
```

## What is mean total number of steps taken per day?
First, we compute the total number of steps per day and save it as a vector called totalSteps.

```r
totalSteps <- tapply(data$steps,data$date,"sum")
```
Second, we create the histogram of total steps per day.  

```r
hist(totalSteps)
```

![plot of chunk hist](./PA1_template_files/figure-html/hist.png) 

Mean total steps taken per day (disregarding NA values):

```r
mean(totalSteps,na.rm=TRUE)
```

```
## [1] 10766
```
Median total steps taken per day (disregarding NA values):

```r
median(totalSteps,na.rm=TRUE)
```

```
## [1] 10765
```
## What is the average daily activity pattern?
To analyze the average daily activity we first create a vector of mean steps by interval called intervalAvg (disregarding NA values in the process).

```r
intervalAvg <- tapply(data$steps,data$interval,"mean",na.rm=TRUE)
```

Time series plot of the average daily activity. This is the average number of steps taken averaged across all days over the 5-minute intervals.

```r
plot(x=names(intervalAvg),y=intervalAvg,type="l",xlab="Interval",ylab="Average Step Count", main="Average Daily Activity Pattern")
```

![plot of chunk activityplot](./PA1_template_files/figure-html/activityplot.png) 

Which five 5-minute interval, on average, contains the maximum number of steps?

```r
intervalAvg[intervalAvg==max(intervalAvg)]
```

```
##   835 
## 206.2
```
Interval 835 has the maximum number of steps at 206.1698 average steps per day.


## Imputing missing values
First, we calculate the number of missing values in the data.

```r
nrow(data[is.na(data$steps),])
```

```
## [1] 2304
```
Next, we will impute the 5-minute interval average steps for those intervals that are currently "NA". That is, if on a given day interval 1410's step count is NA then we will imput the mean step count calculated from interval 1410 across all other days where the step count data is not missing.

We already have the average number of steps across days per interval stored in the intervalAvg vector. First, we create a copy of the original data set to perform the imputations on called "imputed_data". Then, using the intervalAvg vector we iterate over the set that we wish to preform the imputations and directly impute the missing values. 

```r
imputed_data <- data
n <-nrow(imputed_data)
for(i in 1:n){
  condition <- is.na(imputed_data[i,1])
  if(condition==TRUE){
    imputed_data[i,1] <- intervalAvg[names(intervalAvg)==imputed_data[i,3]]
  }
}
```
Now, we make a histogram of total steps per day and compute the mean and median daily steps for the imputed data set. We proceed using the same method as before by first summing the steps for each day.

```r
imputedTotalSteps <- tapply(imputed_data$steps,imputed_data$date,"sum")
```
Histogram if total steps per day for the imputed data set.

```r
hist(imputedTotalSteps)
```

![plot of chunk imphist](./PA1_template_files/figure-html/imphist.png) 

Then, we calculate the mean and median

```r
mean(imputedTotalSteps)
```

```
## [1] 10766
```

```r
median(imputedTotalSteps)
```

```
## [1] 10766
```
We observe that after imputation the mean is unchanged, and median has increased from 10765 to 10766 and thus now equals the mean. This makes sense since by imputing the average for the interval we effectively imputed the daily mean. Since the days that were now missing have total steps equal to the daily mean this will cause the median to move towards the mean (in this case such that the two are now equal).

## Are there differences in activity patterns between weekdays and weekends?
First, we create a factor variable for "weekend" and "weekday" called "day". Then, we attach it to the "imputed_data" DF as a factor variable called "day".

```r
weekends <- c("Saturday","Sunday")
days <- weekdays(as.Date(data$date))
day.factor <- ifelse(days %in% weekends,"weekend","weekday")
imputed_data$day <- factor(day.factor)
```
Now that we have created the factor varibles, we can construct the panel plot. To do this we first break apart the imputed data into two DFs, one for wekeends and one for weekdays. Then we calculate the interval averages for the two sets. The panel plot is constructed using the base graphics system and two calls to plot(), one for each data set.

```r
imputed_weekend <- imputed_data[imputed_data$day=="weekend",]
imputed_weekday <- imputed_data[imputed_data$day=="weekday",]
weekend_means <- data.frame(steps=tapply(imputed_weekend$steps,imputed_weekend$interval,"mean"),day="weekend")
weekend_means$interval <- row.names(weekend_means)
weekday_means <- data.frame(steps=tapply(imputed_weekday$steps,imputed_weekday$interval,"mean"),day="weekday")
weekday_means$interval <- row.names(weekday_means)
par(mfrow = c(2,1))
plot(x=weekend_means$interval,y=weekend_means$steps,type="l",xlab="",ylab="Average Step Count", main="Weekend")
plot(x=weekday_means$interval,y=weekday_means$steps,type="l",xlab="Interval",ylab="Average Step Count", main="Weekday")
```

![plot of chunk wkdaypanelplot](./PA1_template_files/figure-html/wkdaypanelplot.png) 

From the above plots we can clearly see that, on average, there is less activity during weekdays than during weekends. From this we can infer the user likely spends most of their workday in one spot and does not have to move far.

In addittion, we see a large spike in step count at roughly the same location (starting roughly at interval 730) in the morning on both weekends and weekdays, which likely indicates that the user's morning routine on both days involves a lot of activity in that time. We also see a quick jump from 0 to about 50 just after the 500 interval on weekdays likely coresponding to a normal weekday routine of waking up around that time and then a slightly increasing amount of activity throughout the morning until the large spike. The more gradual increase in the weekend data in the same interval indicates that the user likely wakes up later on weekends, but not always, and not on such a defined schedule as weekdays. 

We also see that the activity on weekends tends to stay higher after the 20000 interval and declining until about the 2100 interval. On weekdays, we see activity remain much lower in the same period but no sharp drop to zero indicating that bedtime is somewhat varied, though in a narrow band, during the week.

