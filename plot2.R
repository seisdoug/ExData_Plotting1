## This script produces a line plot of Average Global Power for two days in February, 2007
##


power <- read.csv("household_power_consumption.txt", sep=";", colClasses= "character")
par(mfcol=c(1,1))       
dates <- paste(power[,1],power[,2])
x <- strptime(dates,"%d/%m/%Y %H:%M:%S")
years <-unclass(x)$year + 1900
months <- months(x) 
days <- unclass(x)$mday
power.dates <- data.frame(x,years,months,days,power[,3])
power.sub1 <- power.dates[which(power.dates[,2] == 2007),]
power.sub2 <- power.sub1[which(power.sub1[,3] == "February"),]
power.sub3 <- power.sub2[which(as.character(power.sub2[,5]) != "?"),]
power.sub4 <- power.sub3[which (power.sub3[,4] == 1 | power.sub3[,4]== 2),]
xv<- power.sub4[,1]
yv <- as.numeric(as.character(power.sub4[,5]))
plot(xv,yv, type="l" ,ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,file = "plot2.png") 
dev.off()