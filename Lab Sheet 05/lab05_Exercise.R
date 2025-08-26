setwd("C:\\Users\\it24101563\\Desktop\\IT24101563")
DeliveryTimes <- read.table("Exercise - Lab 05.txt", header=FALSE)
colnames(DeliveryTimes) <- c("time")   # rename column
attach(DeliveryTimes)

histogram <- hist(
  time,
  main = "Histogram for Delivery Times",
  xlab = "Delivery Time",
  ylab = "Frequency",
  breaks = seq(20, 70, length.out = 10),  # 9 classes
  right = FALSE,
  col = "lightblue",
  border = "black"
)

# Q3: Comment on distribution shape
# The histogram shows that the distribution of delivery times is 
# approximately symmetric but slightly skewed to the right. 
# Most delivery times are clustered in the middle class intervals,
# with fewer values at the extreme ends.

breaks <- histogram$breaks
freq <- histogram$counts
cum.freq <- c(0, cumsum(freq))  

plot(breaks, cum.freq,
     type = "l",
     main = "Cumulative Frequency Polygon (Ogive)",
     xlab = "Delivery Time",
     ylab = "Cumulative Frequency",
     col = "blue",
     lwd = 2)

cbind(Upper = breaks, CumFreq = cum.freq)
