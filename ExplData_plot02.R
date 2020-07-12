#pull data and convert to Date
df <-read.table("~/Downloads/household_power_consumption.txt",
                header=TRUE, sep=";",na.strings = "?")
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

df$Date= as.Date(df$Date, format="%d/%m/%Y")

#subset
df_power <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#plot line chart by day

plot(df_power$DateTime, df_power$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

#Export Chart to .png
dev.copy(png, file = "plot02.png", width=500, height=500)
dev.off()

