


##########################################################
#########################################################
object.size("hpc.txt")
setwd("coursera")
library(data.table)
#####reading data
data<-read.table("hpc.txt",header=T,sep=";",dec=".",colClasses = c('character', 'character', 'numeric',
                'numeric', 'numeric', 'numeric',
                'numeric', 'numeric', 'numeric'),na.strings='?')


data$DateTime <- strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")

data <- subset(data, 
               as.Date(DateTime) >= as.Date("2007-02-01") & 
                 as.Date(DateTime) <= as.Date("2007-02-02"))


png("plot1.png", height=480, width=480)


hist(data$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)',main = 'Global Active Power')


dev.off()
