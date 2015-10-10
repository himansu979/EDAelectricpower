setwd("/Users/himanapple/Desktop/DataScience/Git-repository-projects/EDAelectricpower")
### change the directory name where dataset is present.
### to run, do : source("plot1.R)

##### Read the data file
all_data <- read.table("../household_power_consumption.txt", sep = ";", header = TRUE, na.strings=c("?", " ", "NA", "NAN"))
# 2075260 observations and 9 variables in the dataset
# all observations with ? are replaced by NA

##############################
### Data Cleaning Step
###############################

# change the date format
all_data$Date <- as.Date(all_data$Date, format = "%d/%m/%Y")

# change the timestamp format
all_data$timestamp <- paste(all_data$Date, all_data$Time) # make a new timestamp variable combining Date and Time variable
all_data$Time <- strptime(all_data$timestamp, format = "%Y-%m-%d %H:%M:%S")

# read only the subset of the data asked in the project, Date on 2007-02-01 and 2007-02-02
raw_data <- subset(all_data, Date=="2007-02-01" | Date=="2007-02-02")

### check if NA are present in the raw_data set
#print(colSums(is.na(raw_data)))
# All columns are showing zero, no NA's are present in the subset.

# checking the dataset using summary()
#print(summary(raw_data))

##############################
### Making the plot1.png
###############################

png(file = "plot1.png", width=480, height=480)
hist(raw_data$Global_active_power, col="red", main="Global Active Power",
xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()


