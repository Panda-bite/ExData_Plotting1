library(lubridate)
library(dplyr)

df<- read.csv2("household_power_consumption.txt")





df<- mutate(df, "dt"= as.POSIXct( paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S"))
df[,1]<- dmy(df[,1])

df<- subset(df, df$Date>= "2007-02-01" & df$Date <= "2007-02-02")
png("Plot_2.png", width = 480, height = 480)
plot(df$dt, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
dev.off()

            
            