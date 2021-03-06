# exdata-010 Class Project 1
# student: Mark Anderson (coursera.org@ma7.org)
# date: Thu Jan  8 07:37:11 CST 2015
# filename: plot3.R 

# load getData function
source("get_data.R")

# load power.consumption 
power.consumption <- getData()

# open device
png(filename='plot3.png',width=480,height=480,units='px',bg = "transparent")

#plot data
plot(
  power.consumption$DateTime,
  power.consumption$Sub_metering_1,
  type='l',
  col='black',
  xlab='',
  ylab='Energy sub metering'
)
lines(power.consumption$DateTime,power.consumption$Sub_metering_2,col='red')
lines(power.consumption$DateTime,power.consumption$Sub_metering_3,col='blue')

legend(
  'topright',
  legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
  col   =c('black',         'red',           'blue'),
  lty='solid'
) 
  
# close device
dev.off()

