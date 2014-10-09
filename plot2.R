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
#Plot to PNG file
png(file="plot2.png",width = 480, height = 480, units = "px")
plot(x,gap,type='l',ylab="Global Active Power (Kilowatts)",xlab="")
dev.off()