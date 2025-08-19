setwd("C:/Users/IT24101563/Desktop/IT24101563")

branch_data <- read.csv("C:/Users/IT24101563/Desktop/Exercise.txt")

head(branch_data)

str(branch_data)

dev.off()

par(mar = c(4, 4, 2, 1))

boxplot(branch_data$Sales_X1, 
        main = "Boxplot of Sales (X1)", 
        ylab = "Sales", 
        col = "lightblue")

five_num_summary <- fivenum(branch_data$Advertising_X2)
print(five_num_summary)

IQR_advertising <- IQR(branch_data$Advertising_X2)
print(paste("IQR for Advertising_X2:", IQR_advertising))

find_outliers <- function(x) {
  Q1 <- quantile(x, 0.25)
  Q3 <- quantile(x, 0.75)
  IQR_value <- IQR(x)
  
  lower_bound <- Q1 - 1.5 * IQR_value
  upper_bound <- Q3 + 1.5 * IQR_value
  
  outliers <- x[x < lower_bound | x > upper_bound]
  return(outliers)
}

outliers_advertising <- find_outliers(branch_data$Advertising_X2)
print("Outliers in Advertising_X2:")
print(outliers_advertising)

outliers_years <- find_outliers(branch_data$Years_X3)
print("Outliers in Years_X3:")
print(outliers_years)
