library(lubridate)
library(dplyr)

df<- read.csv2("household_power_consumption.txt")





df<- mutate(df, "dt"= as.POSIXct( paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S"))
df[,1]<- dmy(df[,1])

df<- subset(df, df$Date>= "2007-02-01" & df$Date <= "2007-02-02")
df[,5]<- as.numeric(df[,5])
df[,6]<- as.numeric(df[,6])
df[,7]<- as.numeric(df[,7])
png("plot_3.png", width = 480, height = 480)

with(df, plot(df$dt,df$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
       
lines(df$dt, df$Sub_metering_2, col="red")
lines(df$dt, df$Sub_metering_3, col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))
dev.off()