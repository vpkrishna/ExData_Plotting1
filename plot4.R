project1<-read.table("H:/Prasanna Krishna/Analytics/Coursera/DataScience/EDA/Project1/household_power_consumption.txt",sep=';',nrows=100,stringsAsFactors=FALSE)
classes<-sapply(project1,class)
project1<-read.table("H:/Prasanna Krishna/Analytics/Coursera/DataScience/EDA/Project1/household_power_consumption.txt",sep=';',colClasses=classes,stringsAsFactors=FALSE)
project1a<-project1[2:nrow(project1),]
project1a$V1<-as.Date( project1a$V1,format ='%d/%m/%Y')
project2a<-project1a[(project1a$V1 >=  "2007-02-01" ),]
project3a<-project2a[(project2a$V1 <=  "2007-02-02" ),]
project3a$V3<-as.numeric(project3a$V3)

joined<-paste(project3a$V1,project3a$V2)
joined<-strptime(joined, "%Y-%m-%d %H:%M:%S")


project3a$V7<-as.numeric(project3a$V7)
project3a$V8<-as.numeric(project3a$V8)
project3a$V9<-as.numeric(project3a$V9)
project3a$V4<-as.numeric(project3a$V4)
project3a$V5<-as.numeric(project3a$V5)
 
 par(mfrow=c(2,2)) 
 
 
plot(joined,project3a$V3,ylab="Global Active Power",xlab="",type="l")
plot(joined,project3a$V5,ylab="Voltage",xlab="datetime",type="l")

plot(joined,project3a$V7,ylab="Energy sub metering ",xlab="",,type="l")
lines(joined,project3a$V8,type="l",col="red")
lines(joined,project3a$V9,type="l",col="blue")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),col=c("black","red","blue"),lty=1)
plot(joined,project3a$V4,ylab="Global Reactive Power",xlab="datetime",type="l")
dev.copy(png,'plot4.png')
dev.off()