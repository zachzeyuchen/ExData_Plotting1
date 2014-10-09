#Read file into mydata
mydata<-read.csv('household_power_consumption.txt',sep=';')
#Extract the data on 2007-02-01 and 2007-02-02
mydata2<-subset(mydata,Date=="1/2/2007"|Date=='2/2/2007')
#Extract dates and times
dates<-as.character(mydata2[,1])
times<-as.character(mydata2[,2])
#convert dates and times to Date/Time Class
x<-paste(dates,times)
x<-strptime(x,"%d/%m/%Y %H:%M:%S")
#Extract the Global Active Power variable
gap<-as.numeric(as.character(mydata2$Global_active_power))
#Extract the sub meter 1-3 variables
Sub_metering_1<-as.numeric(as.character(mydata2$Sub_metering_1))
Sub_metering_2<-as.numeric(as.character(mydata2$Sub_metering_2))
Sub_metering_3<-as.numeric(as.character(mydata2$Sub_metering_3))
#Extract Voltage
voltage<-as.numeric(as.character(mydata2$Voltage))
#Extract Global_reactive_power
grp<-as.numeric(as.character(mydata2$Global_reactive_power))
#Plot to PNG file
png(file="plot4.png",width = 480, height = 480, units = "px")
#Setting up the plot
par(mfrow=c(2,2))
#Plot1
plot(x,gap,type='l',ylab="Global Active Power (Kilowatts)",xlab="")
#Plot2
plot(x,voltage,type='l',ylab="Voltage",xlab="datetime")
#Plot3
plot(x,Sub_metering_1,type='l',ylab="Energy sub metering",xlab="")
lines(x,Sub_metering_2,col="Red")
lines(x,Sub_metering_3,col="Blue")
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=c(1,1),col=c("Black","Red","Blue"),lwd=c(2.5,2.5))
#Plot4
plot(x,grp,type='l',ylab="Global_reactive_power",xlab="datetime")
dev.off()

