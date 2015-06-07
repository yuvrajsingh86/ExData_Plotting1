read_data <- function(){
        
        file<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,colClasses = c("character","character",rep("numeric",7)),na='?')
        file$Time <- file$Time<-strptime(paste(file$Date, file$Time),"%d/%m/%Y %H:%M:%S")
        file$Date <- as.Date(file$Date,"%d/%m/%Y")
        WorkingSet<-subset(file, file$Date==as.Date("2007-02-02") | file$Date==as.Date("2007-02-01"))
        WorkingSet
}

plot4<-function(){
        if(is.null(WorkingSet)){
                WorkingSet <- load_data()
        }
        
        png("plot4.png",width = 480,height = 480)
        
        #Create 2*2 plotting area
        par(mfrow = c(2,2))
        
        #plot 1 no x label since it is done in next plot
        plot(WorkingSet$Time,WorkingSet$Global_active_power,type = "l",col="black",xlab = '',ylab = 'Global Active power')
        
        #plot2
        plot(WorkingSet$Time,WorkingSet$Voltage,type = "l",col="black",xlab = 'datetime',ylab = "Voltage")
        
        #plot3
        plot(WorkingSet$Time, WorkingSet$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
        lines(WorkingSet$Time, WorkingSet$Sub_metering_2, col="red")
        lines(WorkingSet$Time,WorkingSet$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=1,box.lwd=0,cex=0.5)
        
        #plot4
        
        plot(WorkingSet$Time,WorkingSet$Global_reactive_power,type = "l",col="black",xlab = 'datetime',ylab = "Global_reactive_power")
        
        dev.off()
}