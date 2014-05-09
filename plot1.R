
library (sqldf)


f<- "./exdata-data-household_power_consumption/household_power_consumption.txt"


df1 = read.csv.sql (f ,sql = "select * from file where 
                    Date in ( '1/2/2007', '2/2/2007' ) ",sep = ";"
                    )
# replace ? with NA

df1[df1=="?"] <- NA

# omit all rows with NA


df1 = na.omit(df1)

png ("plot1.png", width = 480, height = 480)
hist (df1$Global_active_power , col = "red" , 
      main = "Global Active Power",
      xlab = "Global Active Power(Kilowatts)",
      )

dev.off()


