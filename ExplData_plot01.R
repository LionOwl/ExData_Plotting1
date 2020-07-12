#pull data and convert to Date
df <-read.table("~/Downloads/household_power_consumption.txt",
                header=TRUE, sep=";",na.strings = "?")
df$DateTime <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

df$Date= as.Date(df$Date, format="%d/%m/%Y")

#subset
df_power <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#plot histogram
hist(df_power$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     main = "Global Active Power", breaks = 13, 
     ylim = c(0,1200), xlim = c(0, 6))

#Export Chart to .png
dev.copy(png, file = "plot01.png", width=500, height=500)
dev.off()
