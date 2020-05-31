library(lubridate)
library(dplyr)

df<- read.csv2("household_power_consumption.txt")

df<- mutate(df, "dt"= as.POSIXct( paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S"))
df[,1]<- dmy(df[,1])

df<- subset(df, df$Date>= "2007-02-01" & df$Date <= "2007-02-02")
df[,5]<- as.numeric(df[,5])
df[,6]<- as.numeric(df[,6])
df[,7]<- as.numeric(df[,7])
df$Global_active_power<- as.numeric(df$Global_active_power)

png("plot_4.png", width = 480, height = 480)

par(mfcol=c(2,2))
plot(df$dt, df$Global_active_power, xlab = "datetime", ylab = "Global Active Power", type = "l")

with(df, plot(df$dt,df$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
lines(df$dt, df$Sub_metering_2, col="red")
lines(df$dt, df$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

plot(df$dt, df$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(df$dt, df$Global_reactive_power, xlab = "datetime", ylab = "Global reactive power", type = "l")

dev.off()



