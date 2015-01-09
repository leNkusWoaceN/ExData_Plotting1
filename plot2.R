# exdata-010 Class Project 1
# student: Mark Anderson (coursera.org@ma7.org)
# date: Thu Jan  8 07:37:11 CST 2015
# filename: plot2.R 

# load getData function
source("get_data.R")

# load power.consumption 
power.consumption <- getData()

# open device
png(filename='plot2.png',width=480,height=480,units='px')

#plot data
plot(
  power.consumption$DateTime,
  power.consumption$Global_active_power,
  type='l'
)

# close device
dev.off()

