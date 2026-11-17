library(ggplot2)

test_that("school_board_colors returns valid named vectors of length n", {
  all_cols <- school_board_colors()

  expect_named(all_cols)
  expect_type(all_cols, "character")
  expect_length(all_cols, 9)

  # testing subsetting
  expect_equal(school_board_colors(3), all_cols[1:3])
  expect_identical(school_board_palette(4), school_board_colors(4))

  # test error cases
  expect_error(school_board_colors(10))
  expect_error(school_board_colors("a"))
  expect_error(school_board_colors(c(1, 2)))
  expect_error(school_board_colors(NA_character_))
})

test_that("internal palette generators strip names and produce correct colors", {
  gen_fwd <- palette_gen(direction = 1)
  gen_rev <- palette_gen(direction = -1)

  cols_f <- gen_fwd(4)
  cols_r <- gen_rev(4)

  expect_null(names(cols_f))
  expect_equal(cols_f, unname(school_board_colors(4)))
  expect_equal(cols_r, rev(unname(school_board_colors(4))))

  ramp_fwd <- palette_gen_c(direction = 1)
  ramp_rev <- palette_gen_c(direction = -1)
  expect_equal(ramp_fwd(5)[1], toupper(unname(school_board_colors(1))))
  expect_equal(ramp_rev(5)[1], toupper(unname(school_board_colors(2))[2]))
})

test_that("discrete color and fill scales map actual hex codes to plot layers", {
  z <- data.frame(
    grp = c("a", "b", "c"),
    x = 1:3,
    y = 1:3
  )

  p_color <- ggplot(z, aes(x, y, color = grp)) +
    geom_point() +
    scale_color_schoolboard()

  p_fill <- ggplot(z, aes(grp, y, fill = grp)) +
    geom_col() +
    scale_fill_schoolboard()

  pcb <- ggplot2::layer_data(p_color)
  pfb <- ggplot2::layer_data(p_fill)

  expect_false(anyNA(pcb$colour))
  expect_equal(pcb$colour, unname(school_board_colors(3)))

  expect_false(anyNA(pfb$fill))
  expect_equal(pfb$fill, unname(school_board_colors(3)))
})

test_that("discrete scale warns or errors cleanly when categories exceed palette size", {
  df_many <- data.frame(
    group = factor(LETTERS[1:10]),
    x = 1:10,
    y = 1:10
  )

  p <- ggplot(df_many, aes(x, y, color = group)) +
    geom_point() +
    scale_color_schoolboard()

  expect_error(
    ggplot2::ggplot_build(p),
    "The maximum number of colors in this palette is 9"
  )
})
