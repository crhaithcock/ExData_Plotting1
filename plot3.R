
# Assumes working directory has the expected dataset


df.load <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt",sep=";", stringsAsFactors = FALSE)
df.load$Date <-as.Date(df.load$Date, "%d/%m/%Y")

df.subset <- subset(df.load,Date>='2007-02-01' & Date <='2007-02-02' )
df.subset$Global_active_power <- as.numeric(df.subset$Global_active_power)


plot3 <- function(){
    plot(df.subset$Sub_metering_1, type = "l", main ="",ylab="Energy Sub metering",xlab="",xaxt="n")
    lines(df.subset$Sub_metering_2,col="red")
    lines(df.subset$Sub_metering_3, col = "blue")
    axis(side = 1, at = c(0, 1440, 2880), labels=c("Thur", "Fri", "Sat"))   
    
    legend (x="topright", lty=c(1,1,1), lwd = c(2.5,2.5,2.5), col = c("black","red","blue"),legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    
}



png(filename="plot3.png",width=480, height=480)
plot3()
dev.off()


