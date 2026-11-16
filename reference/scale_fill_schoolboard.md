# School Board Color and Fill Scales

Discrete and continuous color and fill scales for `ggplot2` based on the
School Board color palette.

## Usage

``` r
scale_fill_schoolboard(direction = 1, ...)

scale_color_schoolboard(direction = 1, ...)

scale_fill_schoolboard_c(direction = 1, ...)

scale_color_schoolboard_c(direction = 1, ...)
```

## Arguments

- direction:

  Numeric. Direction of the palette. If `>= 0` (default), colors are in
  standard order. If `< 0`, colors are reversed.

- ...:

  Additional arguments passed to
  [`ggplot2::discrete_scale()`](https://ggplot2.tidyverse.org/reference/discrete_scale.html),
  [`ggplot2::scale_fill_gradientn()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html),
  or
  [`ggplot2::scale_color_gradientn()`](https://ggplot2.tidyverse.org/reference/scale_gradient.html).

## Value

A `ggplot2` scale object.

## Examples

``` r
library(ggplot2)

ggplot(mpg, aes(x = class, fill = class)) +
    geom_bar() +
    scale_fill_schoolboard()
```
