


##########################################################
#########################################################
object.size("hpc.txt")
setwd("coursera")
library(data.table)
#####reading data
data<-read.table("hpc.txt",header=T,sep=";",dec=".",colClasses = c('character', 'character', 'numeric',
                'numeric', 'numeric', 'numeric',
                'numeric', 'numeric', 'numeric'),na.strings='?')


data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data <- subset(data, 
               as.Date(DateTime) >= as.Date("2007-02-01") & 
                 as.Date(DateTime) <= as.Date("2007-02-02"))



png("plot4.png", height=480, width=480)

par(mfrow=(c(2,2)))
#plot1
plot(data$DateTime,data$Global_active_power,xlab="", ylab = 'Global Active Power (kilowatts)',type="l")
#plot2
plot(data$DateTime,data$Voltage,xlab='datetime',ylab="Voltage",type="l")
#plot3
plot(data$DateTime,data$Sub_metering_1,xlab="", ylab = 'Energy sub metering',type="l",col="black")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")
#plot4
plot(data$DateTime,data$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()
