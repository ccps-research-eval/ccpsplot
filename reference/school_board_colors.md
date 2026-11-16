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
#> Error in school_board_colors(): length(n) == 1 is not TRUE

# Extract first 3 colors
school_board_colors(3)
#>      teal      pink       red 
#> "#00627a" "#cf4b9b" "#dc4d48" 
```
