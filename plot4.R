
library (sqldf)


f<- "./exdata-data-household_power_consumption/household_power_consumption.txt"

df1 = read.csv.sql (f ,sql = "select * from file where 
                    Date in ( '1/2/2007', '2/2/2007' ) ",sep = ";"
                    )

# replace ? with NA

df1[df1=="?"] <- NA

# omit all rows with NA


df1 = na.omit(df1)

# ..............common code till here for all plots

# code specific to plot2

df1$Date <- as.Date(df1$Date, "%d/%m/%Y")

dt = paste(df1$Date , df1$Time, sep = " ")
dt = as.POSIXct(strptime(dt, "%Y-%m-%d %H:%M:%S"))

png ("plot4.png", width = 480, height = 480)

# set the canvas for 2x2 plot

par(mfrow = c(2,2))
plot(dt,df1$Global_active_power, type='o',pch ='.',
     ylab= "Global Active Power", 
     xlab = "")
plot(dt,df1$Voltage, type='o',pch ='.',
     ylab= "Voltage", 
     xlab = "datetime")

plot(dt,df1$Sub_metering_1, type='o',pch ='.',
     ylab= "Energy submetering", 
     xlab = "")

points (dt , df1$Sub_metering_2 , type='o' , pch ='.',col="red")
points (dt , df1$Sub_metering_3 , type='o' , pch ='.', col= "blue")

legend ("topright", c("Sub_metering_1", "Sub_metering_2","Sub_Metering_3"), 
        col = c("black","red","blue"), 
        lty = c(1,1),
        lwd = c(2.5,2.5),
        cex=0.6,
        bty="n")


plot(dt,df1$Global_reactive_power, type='o',pch ='.',
     ylab= "Global_Reactive_power", 
     xlab = "datetime")


dev.off()



