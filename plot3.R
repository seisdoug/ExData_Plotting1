## This script produces a line plot of Average Global Power for two days in February, 2007
##


power <- read.csv("household_power_consumption.txt", sep=";", colClasses= "character")
par(mfcol=c(1,1))        
dates <- paste(power[,1],power[,2])
x <- strptime(dates,"%d/%m/%Y %H:%M:%S")
years <-unclass(x)$year + 1900
months <- months(x) 
days <- unclass(x)$mday
power.dates <- data.frame(x,years,months,days,power[,7], power[,8],power[,9])
power.sub1 <- power.dates[which(power.dates[,2] == 2007),]
power.sub2 <- power.sub1[which(power.sub1[,3] == "February"),]
power.sub3 <- power.sub2[which(as.character(power.sub2[,5]) != "?" & as.character(power.sub2[,6]) != "?" & as.character(power.sub2[,7]) != "?"),]
power.sub4 <- power.sub3[which (power.sub3[,4] == 1 | power.sub3[,4]== 2),]
xv<- power.sub4[,1]
yv1 <- as.numeric(as.character(power.sub4[,5]))
yv2 <- as.numeric(as.character(power.sub4[,6]))
yv3 <- as.numeric(as.character(power.sub4[,7]))
plot(xv,yv1,ylab="Energy sub metering",xlab="", type="n")
points(xv,yv1, type="l", col="black")
points(xv,yv2, type = "l", xlab="", ylab="", col="red")
points(xv,yv3, type="l", xlab="", ylab="", col = "blue")
leg_text <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
leg_lines <- c("l","l","l")
leg_colors <- c("black","red","blue")
leg_length <- 2
legend("topright", legend = leg_text, lty=1, col=leg_colors, seg.len=2)
dev.copy(png,file = "plot3.png") 
dev.off()