
# Assumes working directory has the expected dataset


df.load <- read.csv("household_power_consumption.txt",sep=";", stringsAsFactors = FALSE)
df.load$Date <-as.Date(df.load$Date, "%d/%m/%Y")

df.subset <- subset(df.load,Date>='2007-02-01' & Date <='2007-02-02' )
df.subset$Global_active_power <- as.numeric(df.subset$Global_active_power)


plot2 <- function(){
    plot(df.subset$Global_active_power, type = "l", main ="",ylab="Global Active Power (kilowatts)",xlab="",xaxt="n")
    axis(side = 1, at = c(0, 1440, 2880), labels=c("Thur", "Fri", "Sat"))   
}



png(filename="plot2.png",width=480, height=480)
plot2()
dev.off()


