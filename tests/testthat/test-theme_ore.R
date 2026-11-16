library(ggplot2)

test_that("theme_ore errors handle correctly", {
  expect_error(theme_ore(size = "a"))
  expect_error(theme_ore(size = 1:2))

  expect_error(theme_ore(base_font = 1))
  expect_error(theme_ore(base_font = c("a", "b")))

  expect_error(theme_ore(base_color = 1))
  expect_error(theme_ore(base_color = c("a", "b")))

  expect_error(theme_ore(accent_color = 1))
  expect_error(theme_ore(accent_color = c("a", "b")))

  expect_error(theme_ore(faceted = "a"))
  expect_error(theme_ore(faceted = c(TRUE, FALSE)))
})

test_that("theme_ore returns a valid, complete ggplot2 theme", {
  ore <- theme_ore()

  expect_s3_class(ore, c("theme", "gg"))

  expect_true(attr(ore, "complete"))
})

test_that("default theme properties match CCPS ORE specifications", {
  ore <- theme_ore()

  # Colors
  expect_equal(ore$line$colour, "grey20")
  expect_equal(ore$text$colour, "grey20")
  expect_equal(ore$panel.grid.major$colour, "grey40")
  expect_equal(ore$panel.grid.minor$colour, "grey40")

  # Typography & sizing (default size = 12)
  ds <- 12
  expect_equal(ore$text$family, "sans")
  expect_equal(ore$text$size, ds * 0.95)
  expect_equal(ore$axis.text$size, ds * 0.9)
  expect_equal(ore$axis.title$size, ds)
  expect_equal(ore$plot.title$size, ds * 1.6)
  expect_equal(ore$plot.title$face, "bold")
  expect_equal(ore$plot.title.position, "plot")
  expect_equal(ore$plot.caption.position, "plot")

  # Blank elements
  expect_s3_class(ore$axis.line, "element_blank")
  expect_s3_class(ore$panel.border, "element_blank")
  expect_s3_class(ore$panel.grid, "element_blank")
})

test_that("custom arguments propogate correctly", {
  ore <- theme_ore(
    size = 14,
    base_font = "serif",
    base_color = "#003366",
    accent_color = "#CCCCCC"
  )

  expect_equal(ore$text$family, "serif")
  expect_equal(ore$plot.title$family, "serif")
  expect_equal(ore$text$colour, "#003366")
  expect_equal(ore$strip.text$colour, "#003366")
  expect_equal(ore$panel.grid.major$colour, "#CCCCCC")
  expect_equal(ore$panel.grid.minor$colour, "#CCCCCC")
  expect_equal(ore$panel.spacing, grid::unit(1.5 * 14, "pt"))
})

test_that("faceted argument adjusts plot margins correctly", {
  # size 10 for easy multiplication
  no_fct <- theme_ore(faceted = FALSE, size = 10)
  yes_fct <- theme_ore(faceted = TRUE, size = 10)

  expect_equal(
    as.numeric(no_fct$plot.margin),
    c(30, 15, 30, 15)
  )

  expect_equal(
    as.numeric(yes_fct$plot.margin),
    c(15, 7.5, 15, 7.5)
  )
})
