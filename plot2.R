
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

png ("plot2.png", width = 480, height = 480)

plot(dt,df1$Global_active_power, type="o", pch = '.',
     ylab = "Global_active_power(Kilowatts)")
dev.off()



