
data<-read.csv("data/household_power_consumption.txt",sep=";",stringsAsFactor=FALSE) #read data
data$Time<-strptime(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %T") #convert to Data Time
data$Date<-as.Date(data$Date,format="%d/%m/%Y") # convert to Date
sub_data<-data[data$Date == "2007-02-01" | data$Date=="2007-02-02",] # Get subset 
names(sub_data)[2]<-"datetime" # rename Time with datetime
sub_data[3:9]<-sapply(sub_data[3:9],as.numeric)# Convert to numeric

#Create Plot
library(datasets)
png(file = "plot1.png")
par(mar=c(5,5,5,5))
with(sub_data,hist(Global_active_power,col="red",main="",xlab="Global Active Power (kilowatts)",ylab="Frequency")) # Draw plot
title("Global Active Power")
dev.off()
