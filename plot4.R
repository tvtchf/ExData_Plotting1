data<-read.csv("data/household_power_consumption.txt",sep=";",stringsAsFactor=FALSE) #read data
data$Time<-strptime(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %T") #convert to Data Time
data$Date<-as.Date(data$Date,format="%d/%m/%Y") # convert to Date
sub_data<-data[data$Date == "2007-02-01" | data$Date=="2007-02-02",] # Get subset 
names(sub_data)[2]<-"datetime" # rename Time with datetime
sub_data[3:9]<-sapply(sub_data[3:9],as.numeric)# Convert to numeric

#Create Plot
library(datasets)
png(file = "plot4.png") # output png file
par(mfrow=c(2,2)) # 4 plots 
#plot 1
with(sub_data,plot(datetime,Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l"))
#plot 2
with(sub_data,plot(datetime,Voltage,xlab="datetime",ylab="Voltage",type="l"))
#plot 3
with(sub_data,plot(datetime,Sub_metering_1,xlab="",ylab="Energy sub metering",col="black",type="l")) # Draw plot
with(sub_data,points(datetime,Sub_metering_2,xlab="",ylab="Energy sub metering",col="red",type="l"))
with(sub_data,points(datetime,Sub_metering_3,xlab="",ylab="Energy sub metering",col="blue",type="l"))
legend("topright",legend=c("Sub metering 1","Sub metering 2","Sub metering 3"),lty=1,bty="n",col=c("black","red","blue"))
#plot 4
with(sub_data,plot(datetime,Global_reactive_power,type="l"))

dev.off()
