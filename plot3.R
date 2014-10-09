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
#Extract the sub meter 1-3 variables
Sub_metering_1<-as.numeric(as.character(mydata2$Sub_metering_1))
Sub_metering_2<-as.numeric(as.character(mydata2$Sub_metering_2))
Sub_metering_3<-as.numeric(as.character(mydata2$Sub_metering_3))
#Plot to PNG file
png(file="plot3.png",width = 480, height = 480, units = "px")
plot(x,Sub_metering_1,type='l',ylab="Energy sub metering",xlab="")
#Add two lines for meter 2 and 3
lines(x,Sub_metering_2,col="Red")
lines(x,Sub_metering_3,col="Blue")
#Add Legends to the graph
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=c(1,1),col=c("Black","Red","Blue"),lwd=c(2.5,2.5))
dev.off()
