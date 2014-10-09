#Read file into mydata
mydata<-read.csv('household_power_consumption.txt',sep=';')
#Extract the data on 2007-02-01 and 2007-02-02
mydata2<-subset(mydata,Date=="1/2/2007"|Date=='2/2/2007')
#Extract the Global Active Power variable
gap<-as.numeric(as.character(mydata2$Global_active_power))
#Draw the histogram and copy to a PNG file
png(file="plot1.png",width = 480, height = 480, units = "px")
hist(gap,col='Red',xlab="Global Active Power (Kilowatts)",
     main="Global Active Power")
dev.off()
