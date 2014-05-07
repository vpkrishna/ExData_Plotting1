project1<-read.table("H:/Prasanna Krishna/Analytics/Coursera/DataScience/EDA/Project1/household_power_consumption.txt",sep=';',nrows=100,stringsAsFactors=FALSE)
classes<-sapply(project1,class)
project1<-read.table("H:/Prasanna Krishna/Analytics/Coursera/DataScience/EDA/Project1/household_power_consumption.txt",sep=';',colClasses=classes,stringsAsFactors=FALSE)
project1a<-project1[2:nrow(project1),]
project1a$V1<-as.Date( project1a$V1,format ='%d/%m/%Y')
project2a<-project1a[(project1a$V1 >=  "2007-02-01" ),]
project3a<-project2a[(project2a$V1 <=  "2007-02-02" ),]
project3a$V3<-as.numeric(project3a$V3)
hist( project3a$V3,xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
dev.copy(png,'plot1.png',width = 480, height = 480, units = "px")
dev.off()