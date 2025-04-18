
# animalshelterdataanalysis

<!-- badges: start -->
[![R-CMD-check](https://github.com/DSCI-310-2025/animalshelterdataanalysis/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/DSCI-310-2025/animalshelterdataanalysis/actions/workflows/R-CMD-check.yaml)
[![Codecov test coverage](https://codecov.io/gh/DSCI-310-2025/animalshelterdataanalysis/graph/badge.svg)](https://app.codecov.io/gh/DSCI-310-2025/animalshelterdataanalysis)
<!-- badges: end -->

The goal of the `animalshelterdataanalysis` package is to provide a set of functions for cleaning, analyzing, and visualizing animal shelter data. This package includes tools to preprocess raw shelter data, such as cleaning and transforming variables like `outcome_type` and `age_at_intake`, creating visualizations like proportional stacked bar plots, and exporting summary tables in CSV format. The functions are designed to support data analysis pipelines in animal shelter data projects, enabling easy exploration of trends, distributions, and relationships in the data.

## Installation

You can install the development version of animalshelterdataanalysis from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("DSCI-310-2025/animalshelterdataanalysis")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(animalshelterdataanalysis)
## basic example code
```

## Usage
A common task when working with animal shelter data is cleaning the dataset to ensure it's ready for analysis. The `clean_animal_shelter_data()` function helps with that.

```r
# Load the necessary libraries
library(animalshelterdataanalysis)

# Example usage of the clean_animal_shelter_data function
raw_data <- read_csv("animal_shelter_raw.csv")
cleaned_data <- clean_animal_shelter_data(raw_data)

# View the cleaned data
head(cleaned_data)
```
Others helpful usage are functions that generate barplots, tables, and splts the datasets: 

The function make_barplot() generates a proportional stacked bar plot to visualize categorical data, like outcomes based on animal type.
```r
# Example usage of make_barplot
make_barplot(cleaned_data, x = "animal_type", x_name = "Animal Type", 
             class = "outcome_group", class_name = "Outcome Group")
```
The function make_table() creates a frequency table and saves it as a CSV file
```r
# Example usage of make_table
make_table(cleaned_data$animal_type, folder = "output", name = "animal_type_table.csv")
```
The function split_data() splits the dataset into training and testing sets for model building
```r
# Example usage of split_data
split <- split_data(cleaned_data, prop = 0.75, strata = "outcome_group", seed = 123)
train_data <- split[[1]]
test_data <- split[[2]]
```

## Position in the R Package Ecosystem

The `animalshelterdataanalysis` package is designed to streamline the data analysis workflow for animal shelter datasets. While many R packages like `dplyr`, `ggplot2`, and `tidyverse` offer powerful general tools for data manipulation and visualization, `animalshelterdataanalysis` provides specialized functions tailored specifically for shelter data.

Key similar packages include:
- **`dplyr`**: A general-purpose package for data manipulation, widely used across many domains. Our package extends `dplyr`'s functionality by providing specific functions like `clean_animal_shelter_data()` for cleaning shelter-related variables (e.g., `outcome_type`, `age_at_intake`).
- **`tidymodels`**: A package ecosystem for machine learning workflows, which includes tools for data preprocessing and modeling. `animalshelterdataanalysis` provides an easier integration with `tidymodels` by allowing seamless splitting of data for training and testing (e.g., using `split_data()`), specifically tuned for shelter datasets.
- **`ggplot2`**: A versatile plotting package used for creating visualizations. While `ggplot2` can create many types of plots, `animalshelterdataanalysis` specializes in generating specific visualizations such as proportional stacked bar plots tailored to animal shelter data (`make_barplot()`).

Compared to other data analysis packages, `animalshelterdataanalysis` reduces the complexity of working with animal shelter data by providing predefined workflows for data cleaning, visualization, and analysis. The package automates repetitive tasks, such as data preprocessing and exporting summary tables, making it a valuable tool for anyone working with shelter data.
