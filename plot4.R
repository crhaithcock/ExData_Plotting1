
# Assumes working directory has the expected dataset


 df.load <- read.csv("household_power_consumption.txt",sep=";", stringsAsFactors = FALSE)
 df.load$Date <-as.Date(df.load$Date, "%d/%m/%Y")
 
 df.subset <- subset(df.load,Date>='2007-02-01' & Date <='2007-02-02' )
 df.subset$Global_active_power <- as.numeric(df.subset$Global_active_power)


plot4 <- function(){
    
    par(mfrow=c(2,2))
    
    plot(df.subset$Global_active_power, type = "l", main ="",ylab="Global Active Power",xlab="",xaxt="n")
    axis(side = 1, at = c(0, 1440, 2880), labels=c("Thur", "Fri", "Sat"))  
    
    plot(df.subset$Voltage, type = "l", main ="",ylab="Voltage", xlab="datetime", xaxt="n")
    axis(side = 1, at = c(0, 1440, 2880), labels=c("Thur", "Fri", "Sat")) 
    
    plot(df.subset$Sub_metering_1, type = "l", main ="",ylab="Energy Sub metering",xlab="",xaxt="n")
    lines(df.subset$Sub_metering_2,col="red")
    lines(df.subset$Sub_metering_3, col = "blue")
    axis(side = 1, at = c(0, 1440, 2880), labels=c("Thur", "Fri", "Sat"))   
    legend (x="topright" ,bty="n",lty=c(1,1,1), lwd = c(2.5,2.5,2.5), col = c("black","red","blue"),legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    
    
    plot(df.subset$Global_reactive_power,type="l", ylab="Global_reactive_power",xlab="datetime")

    }



png(filename="plot4.png",width=480, height=480)
plot4()
dev.off()


