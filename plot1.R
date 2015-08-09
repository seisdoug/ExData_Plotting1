## This script produces a histogram of Average Global Power for two days in February, 2007
##

par(mfcol= c(1,1))
power <- read.csv("household_power_consumption.txt", sep=";", colClasses= "character")
dates <- paste(power[,1],power[,2])
x <- strptime(dates,"%d/%m/%Y %H:%M:%S")
years <-unclass(x)$year + 1900
months <- months(x) 
days <- unclass(x)$mday
power.dates <- cbind(years,months,days,power[,3])
power.sub1 <- power.dates[which(power.dates[,1] == 2007),]
power.sub2 <- power.sub1[which(power.sub1[,2] == "February"),]
power.sub3 <- power.sub2[which(power.sub2[,4] != "?"),]
power.sub4 <- power.sub3[which(power.sub3[,3] == "1"| power.sub3[,3] == "2"),]
hist(as.numeric(power.sub4[,4]),col="red", xlab="Global Active Power (kilowatts)",ylab="Frequency", main = "Global Active Power")
dev.copy(png,file = "plot1.png") 
dev.off()