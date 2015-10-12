
# Assumes working directory has the expected dataset


df.load <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt",sep=";", stringsAsFactors = FALSE)
df.load$Date <-as.Date(df.load$Date, "%d/%m/%Y")

df.subset <- subset(df.load,Date>='2007-02-01' & Date <='2007-02-02' )
df.subset$Global_active_power <- as.numeric(df.subset$Global_active_power)


plot1 <- function(load_data){
    hist(df.subset$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
}
    

png(filename="plot1.png",width=480, height=480)
plot1()
dev.off()


