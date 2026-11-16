# Theme ORE

A
[ggplot2::ggplot2](https://ggplot2.tidyverse.org/reference/ggplot2-package.html)
theme for the CCPS Office of Research and Evaluation

## Usage

``` r
theme_ore(
  size = 12,
  base_font = "sans",
  base_color = "grey20",
  accent_color = "grey40",
  faceted = FALSE
)
```

## Arguments

- size:

  Numeric. Base font size. Default is 12.

- base_font:

  Character. Base font family. Default is 'sans'

- base_color:

  Character. Color of text and ticks. Default is 'grey20'

- accent_color:

  Character. Color of grid lines. Default is 'grey40'.

- faceted:

  Logical. TRUE will reduce margins to make faceted subplots larger

## Examples

``` r
if (FALSE) { # \dontrun{
library(ggplot2)
library(dplyr)

# basic scatterplot
ggplot(mtcars, aes(mpg, wt)) +
    geom_point() +
    labs(
        x = "miles per gallon",
        y = "weight",
        title = "Scatterplot example",
        subtitle = "this is a subtitle",
        caption = "by bret bretterson"
    ) +
    theme_ore()
} # }
```
