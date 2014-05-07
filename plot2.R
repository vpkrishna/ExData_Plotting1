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
plot(joined,project3a$V3,ylab="Global Active Power (kilowatts)",xlab="",type="l")
dev.copy(png,'plot2.png',width = 480, height = 480, units = "px")
dev.off()

