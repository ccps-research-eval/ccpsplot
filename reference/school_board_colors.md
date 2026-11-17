# School Board Color Palette

Retrieves hexadecimal color codes from the School Board color palette.
If `n` is not provided, all colors are returned.

## Usage

``` r
school_board_colors(n = NULL)

school_board_palette(n = NULL)
```

## Arguments

- n:

  Numeric. The number of colors to extract from the palette.

## Value

A named character vector of hex color codes.

## Examples

``` r
# Return all palette colors
school_board_colors()
#>        teal        pink         red      orange      yellow light_green 
#>   "#00627a"   "#cf4b9b"   "#dc4d48"   "#f68c50"   "#ffc222"   "#8ac75a" 
#>       green  light_blue      purple 
#> "#00a380ff"   "#00a8e5"   "#845aa6" 

# Extract first 3 colors
school_board_colors(3)
#>      teal      pink       red 
#> "#00627a" "#cf4b9b" "#dc4d48" 
```
