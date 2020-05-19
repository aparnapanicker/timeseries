monthly_milk <- read.csv("monthly_milk.csv")
daily_milk <- read.csv("daily_milk.csv")

#Need to convert the montly milk to have mnth column to be date 
str(monthly_milk)
monthly_milk$month_date <- as.Date(monthly_milk$month, format = "%Y-%m-%d")
class(monthly_milk$month_date)

#Creating time series object
library(tseries)
monthly_milk_ts <- ts(monthly_milk$milk_prod_per_cow_kg, start = c(1962, 1) , end = c(1975,12),  frequency = 12)
#Show the cycle of ts object
cycle(monthly_milk_ts)


#Plot the ts using the plot()
plot(monthly_milk_ts, xlab = "year", ylab = "monlty milk (liters)", main = "montly milk production between 1962 and 1975")


#Check for seasonality with trend
plot(aggregate(monthly_milk_ts, FUN = mean))
#Check for seasonality with boxplot() function
