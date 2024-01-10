# Load the iris dataset
data(iris)

# Summary of the dataset
summary(iris)

# Install and load necessary packages
install.packages(c("ggplot2", "dplyr", "tidyr", "ggpubr"))
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggpubr)

# Pairwise scatterplots for continuous variables
pairs(iris[, 1:4], col = iris$Species)

# Boxplots for each variable by Species
iris %>%
  gather(key = "Variable", value = "Value", -Species) %>%
  ggplot(aes(x = Species, y = Value, fill = Species)) +
  geom_boxplot() +
  facet_wrap(~Variable, scales = "free_y") +
  theme_minimal()

# Density plots for each variable by Species
iris %>%
  gather(key = "Variable", value = "Value", -Species) %>%
  ggplot(aes(x = Value, fill = Species)) +
  geom_density(alpha = 0.7) +
  facet_wrap(~Variable, scales = "free_y") +
  theme_minimal()

# Correlation matrix plot
cor_matrix <- cor(iris[, 1:4])
corrplot::corrplot(cor_matrix, method = "color")

# Bar plot for categorical variable (Species)
ggplot(iris, aes(x = Species, fill = Species)) +
  geom_bar() +
  theme_minimal()

# Violin plot for continuous variable by Species
ggplot(iris, aes(x = Species, y = Sepal.Length, fill = Species)) +
  geom_violin() +
  theme_minimal()

