#pull data and convert to Date
df <-read.table("~/Downloads/household_power_consumption.txt",
                header=TRUE, sep=";",na.strings = "?")
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

df$Date= as.Date(df$Date, format="%d/%m/%Y")

#subset
df_power <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plot 4 Charts in a Qudrant

  par(mfrow=c(2,2))
  par(mar=c(4,4,4,4))

#upper left: Glb_ActPwr
plot(df_power$DateTime, df_power$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")
#upper right: Glb_ActPwr
plot(df_power$DateTime, df_power$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")
#lowerleft: Energy Sub Metering
plot(df_power$DateTime, df_power$Sub_metering_1, type = "l", xlab = "",
       ylab = "Energy sub metering")
  points(df_power$DateTime, df_power$Sub_metering_2, type = "l", col = "red")
  points(df_power$DateTime, df_power$Sub_metering_3, type = "l", col = "blue")
  #add legend
  legend("topright", lty = 1, col = c("black","red","blue"), y.intersp=.75,cex=.75,
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
#lower right: Glb_ReActPwr
plot(df_power$DateTime, df_power$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

#Export Chart to .png
dev.copy(png, file = "plot04.png", width=500, height=500)
dev.off()
