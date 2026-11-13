#' School Board Color Palette
#'
#' Retrieves hexadecimal color codes from the School Board color palette. If
#' `n` is not provided, all colors are returned.
#'
#' @param n Numeric. The number of colors to extract from the palette.
#'
#' @return A named character vector of hex color codes.
#' @export
#'
#' @examples
#' # Return all palette colors
#' school_board_colors()
#'
#' # Extract first 3 colors
#' school_board_colors(3)
school_board_colors <- function(n = NULL) {
    stopifnot(is.null(n) || is.numeric(n), length(n) == 1)

    sb_colors <- c(
        "teal" = "#00627a",
        "pink" = "#cf4b9b",
        "red" = "#dc4d48",
        "orange" = "#f68c50",
        "yellow" = "#ffc222",
        "light_green" = "#8ac75a",
        "green" = "#00a380ff",
        "light_blue" = "#00a8e5",
        "purple" = "#845aa6"
    )

    l <- length(sb_colors)

    if (is.null(n)) {
        return(sb_colors)
    }

    if (n > l) {
        rlang::abort(
            paste0("The maximum number of colors in this palette is ", l)
        )
    }

    return(sb_colors[1:n])
}

#' @rdname school_board_colors
#' @export
school_board_palette <- function(n = NULL) {
    school_board_colors(n)
}

# internal palette generator for discrete scales
palette_gen <- function(direction = 1) {
    stopifnot(is.numeric(direction))

    function(n) {
        pal <- school_board_palette(n)

        if (direction >= 0) pal else rev(pal)
    }
}

# internal palette generator function for continuous scales
palette_gen_c <- function(direction = 1, ...) {
    pal <- school_board_palette()[1:2]

    pal <- if (direction >= 0) pal else rev(pal)

    colorRampPalette(pal, ...)
}

#' School Board Color and Fill Scales
#'
#' Discrete and continuous color and fill scales for \code{ggplot2} based on the
#' School Board color palette.
#'
#' @param direction Numeric. Direction of the palette. If `>= 0` (default),
#'   colors are in standard order. If `< 0`, colors are reversed.
#' @param ... Additional arguments passed to [ggplot2::discrete_scale()],
#'   [ggplot2::scale_fill_gradientn()], or [ggplot2::scale_color_gradientn()].
#'
#' @return A \code{ggplot2} scale object.
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(mpg, aes(x = class, fill = class)) +
#'     geom_bar() +
#'     scale_fill_schoolboard()
scale_fill_schoolboard <- function(direction = 1, ...) {
    ggplot2::discrete_scale(
        aesthetics = "fill",
        scale_name = "schoolboard",
        palette = palette_gen(direction),
        ...
    )
}

#' @rdname scale_fill_schoolboard
#' @export
scale_color_schoolboard <- function(direction = 1, ...) {
    ggplot2::discrete_scale(
        aesthetics = "color",
        scale_name = "schoolboard",
        palette = palette_gen(direction),
        ...
    )
}

#' @rdname scale_fill_schoolboard
#' @export
scale_fill_schoolboard_c <- function(direction = 1, ...) {
    pal <- palette_gen_c(direction = direction)

    ggplot2::scale_fill_gradientn(colors = pal(256), ...)
}

#' @rdname scale_fill_schoolboard
#' @export
scale_color_schoolboard_c <- function(direction = 1, ...) {
    pal <- palette_gen_c(direction = direction)

    ggplot2::scale_color_gradientn(colors = pal(256), ...)
}
