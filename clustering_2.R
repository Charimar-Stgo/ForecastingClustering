# Specify the file path to your CSV file
file_path <- "/Users/charimarsantiago/Desktop/Data Jam/CMS excercise/CMS datasets/mpa_data.csv"

# Read the CSV file into a data frame
name_data <- read.csv(file_path)

# Now you can start working with your data
# For example, you can print the first few rows
head(name_data)

# Sample data (replace this with your actual data)
mpa_data <- data.frame(mpa_data$CONTRACT_ID,
                       mpa_data$MPA)

# Convert the data to a matrix format
mpa_matrix <- as.matrix(mpa_data[, -1])  # Exclude the first column (contract_id)

# Remove rows with NA values
clean_mpa_matrix <- na.omit(mpa_matrix)
# Assuming you have your measure data in a matrix or data frame named 'measure_data'

# Perform hierarchical clustering with Euclidean distance and Ward's method
hc <- hclust(dist(clean_mpa_matrix), method = "ward.D2")

# Cut the dendrogram to obtain 5 clusters
clusters <- cutree(hc, k = 5)

# Print the cluster assignments
print(clusters)

# Add the clusters as a new column to your data frame
clean_mpa_matrix$cluster <- clusters

# Print the updated data frame with clusters
print(clean_mpa_matrix)