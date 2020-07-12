#pull data and convert to Date
df <-read.table("~/Downloads/household_power_consumption.txt",
                header=TRUE, sep=";",na.strings = "?")
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

df$Date= as.Date(df$Date, format="%d/%m/%Y")

#subset
df_power <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

  #plot line chart with appliance/device sub metering
  plot(df_power$DateTime, df_power$Sub_metering_1, type = "l", xlab = "",
       ylab = "Energy sub metering")
  points(df_power$DateTime, df_power$Sub_metering_2, type = "l", col = "red")
  points(df_power$DateTime, df_power$Sub_metering_3, type = "l", col = "blue")
  
  legend("topright", lty = 1, col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
#Export Chart to .png
dev.copy(png, file = "plot03.png", width=500, height=500)
dev.off()
