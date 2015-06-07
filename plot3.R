read_data <- function(){
        
        file<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,colClasses = c("character","character",rep("numeric",7)),na='?')
        file$Time <- file$Time<-strptime(paste(file$Date, file$Time),"%d/%m/%Y %H:%M:%S")
        file$Date <- as.Date(file$Date,"%d/%m/%Y")
        WorkingSet<-subset(file, file$Date==as.Date("2007-02-02") | file$Date==as.Date("2007-02-01"))
        WorkingSet
}

plot3<-function(){
        if(is.null(WorkingSet)){
                WorkingSet <- load_data()
        }
        png("plot3.png",width = 480,height = 480)
        plot(WorkingSet$Time, WorkingSet$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
        lines(WorkingSet$Time, WorkingSet$Sub_metering_2, col="red")
        lines(WorkingSet$Time,WorkingSet$Sub_metering_3,col="blue")
        legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"),lty = 1)
        dev.off()
}