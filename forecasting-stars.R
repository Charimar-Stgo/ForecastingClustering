# Install necessary packages
install.packages("forecast")
install.packages("ggplot2")
install.packages("writexl")

# Load libraries
library(forecast)
library(ggplot2)
library(writexl)

# Historical data
data <- data.frame(
  Date = c(2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024),
  Cut1 = c(43, 56, 47, 50, 50, 42, 43, 52),
  Cut2 = c(63, 70, 68, 66, 66, 61, 62, 63),
  Cut3 = c(69, 78, 76, 76, 76, 69, 70, 71),
  Cut4 = c(76, 84, 82, 83, 83, 76, 77, 79)
)

# Convert to time series objects
ts_cut1 <- ts(data$Cut1, start = 2017, frequency = 1)
ts_cut2 <- ts(data$Cut2, start = 2017, frequency = 1)
ts_cut3 <- ts(data$Cut3, start = 2017, frequency = 1)
ts_cut4 <- ts(data$Cut4, start = 2017, frequency = 1)

# Forecasting
forecast_cut1 <- auto.arima(ts_cut1)
forecast_cut2 <- auto.arima(ts_cut2)
forecast_cut3 <- auto.arima(ts_cut3)
forecast_cut4 <- auto.arima(ts_cut4)

# Forecast for 2025, 2026, 2027
forecast_cut1_future <- forecast(forecast_cut1, h = 3)
forecast_cut2_future <- forecast(forecast_cut2, h = 3)
forecast_cut3_future <- forecast(forecast_cut3, h = 3)
forecast_cut4_future <- forecast(forecast_cut4, h = 3)

# Prepare data for export
forecast_data <- data.frame(
  Year = c(2025, 2026, 2027),
  Cut1 = forecast_cut1_future$mean,
  Cut2 = forecast_cut2_future$mean,
  Cut3 = forecast_cut3_future$mean,
  Cut4 = forecast_cut4_future$mean
)

# Write data to Excel
write_xlsx(list(Forecast = forecast_data), path = "C:/Users/marie/Downloads/forecast_results.xlsx")

# Print success message
cat("Forecast results have been written to forecast_results.xlsx")

