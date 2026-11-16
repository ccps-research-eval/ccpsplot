#' Theme ORE
#'
#' A [ggplot2] theme for the CCPS Office of Research and Evaluation
#'
#' @param size Numeric. Base font size. Default is 12.
#' @param base_font Character. Base font family. Default is 'sans'
#' @param base_color Character. Color of text and ticks. Default is 'grey20'
#' @param accent_color Character. Color of grid lines. Default is 'grey40'.
#' @param faceted Logical. TRUE will reduce margins to make faceted subplots larger
#'
#' @importFrom ggplot2 theme_minimal theme element_line element_rect element_text
#' @importFrom ggplot2 element_blank rel margin unit
#' @importFrom grid unit
#'
#' @export
#'
#' @examples \dontrun{
#' library(ggplot2)
#' library(dplyr)
#'
#' # basic scatterplot
#' ggplot(mtcars, aes(mpg, wt)) +
#'     geom_point() +
#'     labs(
#'         x = "miles per gallon",
#'         y = "weight",
#'         title = "Scatterplot example",
#'         subtitle = "this is a subtitle",
#'         caption = "by bret bretterson"
#'     ) +
#'     theme_ore()
#' }
#'
theme_ore <- function(size = 12, base_font = "sans", base_color = "grey20", accent_color = "grey40", faceted = FALSE) {
    # arg checks
    stopifnot(
        "`size` must be a length 1 numeric vector" = is.numeric(size) && length(size) == 1,
        "`base_font` must a length 1 character vector" = is.character(base_font) && length(base_font) == 1,
        "`base_color` must be a length 1 character vector" = is.character(base_color) && length(base_color) == 1,
        "`accent_color` must be a length 1 character vector" = is.character(accent_color) && length(accent_color) == 1,
        "`faceted` must be a length 1 logical vector" = is.logical(faceted) && length(faceted) == 1
    )

    half <- size / 2

    ret <- theme_minimal(base_family = base_font, base_size = size)

    # controlling for plot margin if we need faceting
    plot_margin <- if (faceted) {
        margin(t = 1.5 * size, b = 1.5 * size, l = .75 * size, r = .75 * size)
    } else {
        margin(t = 3 * size, b = 3 * size, l = 1.5 * size, r = 1.5 * size)
    }

    ret <- ret +
        theme(
            line = element_line(color = base_color, linewidth = .3, linetype = 1),
            rect = element_rect(fill = "white", color = base_color),
            text = element_text(family = base_font, face = "plain", color = base_color, size = .95 * size, lineheight = .95),
            axis.line = element_blank(),
            axis.text = element_text(size = size * .9),
            axis.ticks = element_line(color = base_color),
            axis.ticks.length = unit(0, "pt"),
            axis.title = element_text(size = size),
            legend.background = element_rect(color = NA),
            legend.margin = margin(.2, .2, .2, .2, "cm"),
            legend.key = element_rect(fill = "white", color = NA),
            legend.key.size = unit(1.25, "lines"),
            legend.text = element_text(size = rel(.9)),
            legend.title = element_text(hjust = 0, size = rel(1)),
            panel.background = element_rect(fill = NA, color = NA),
            panel.border = element_blank(),
            panel.grid = element_blank(),
            panel.grid.major = element_line(linewidth = .2, color = accent_color),
            panel.grid.minor = element_line(linewidth = .2, color = accent_color),
            panel.spacing = unit(1.5 * size, "pt"),
            strip.background = element_rect(fill = NA, color = NA),
            strip.text = element_text(color = base_color, size = size, face = "bold"),
            strip.text.x = element_text(margin = margin(t = half, b = half)),
            strip.text.y = element_text(margin = margin(l = half, r = half)),
            plot.background = element_rect(color = NA),
            plot.title = element_text(size = 1.6 * size, face = "bold", margin = margin(b = .75 * size), hjust = 0, family = base_font),
            plot.title.position = "plot",
            plot.subtitle = element_text(size = size, margin = margin(b = .75 * size), hjust = 0),
            plot.caption = element_text(size = .95 * size, face = "italic"),
            plot.caption.position = "plot",
            plot.margin = plot_margin
        )

    ret
}
