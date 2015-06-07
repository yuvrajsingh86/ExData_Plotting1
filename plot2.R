read_data <- function(){
        
        file<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,colClasses = c("character","character",rep("numeric",7)),na='?')
        file$Time <- file$Time<-strptime(paste(file$Date, file$Time),"%d/%m/%Y %H:%M:%S")
        file$Date <- as.Date(file$Date,"%d/%m/%Y")
        WorkingSet<-subset(file, file$Date==as.Date("2007-02-02") | file$Date==as.Date("2007-02-01"))
        WorkingSet
}

plot2<- function(){
        
        if(is.null(WorkingSet)){
                WorkingSet <- load_data()
        }
        png("plot2.png", width=480, height=480)
        plot(WorkingSet$Time,WorkingSet$Global_active_power,type = "l",col="black",xlab = '',ylab = 'Global Active Power (kilowatts)')
        dev.off()
}