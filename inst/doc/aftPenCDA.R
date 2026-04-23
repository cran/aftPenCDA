## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  out.width = "100%",
  fig.width = 7,
  fig.height = 4,
  fig.align = "center",
  dpi = 150
)

## ----eval = FALSE-------------------------------------------------------------
# devtools::install_github("seonsy/aftPenCDA")

## ----eval=FALSE---------------------------------------------------------------
# library(aftPenCDA)

## ----eval=FALSE---------------------------------------------------------------
# data("simdat_rc")

## ----eval=FALSE---------------------------------------------------------------
# fit_bar <- aftpen(simdat_rc, lambda = 0.3, se = "CF", type = "BAR")
# fit_bar$beta

## ----eval=FALSE---------------------------------------------------------------
# fit_lasso  <- aftpen(simdat_rc, lambda = 0.1, se = "CF", type = "LASSO")
# fit_alasso <- aftpen(simdat_rc, lambda = 0.1, se = "CF", type = "ALASSO")
# fit_scad   <- aftpen(simdat_rc, lambda = 0.1, se = "CF", type = "SCAD")

## ----eval=FALSE---------------------------------------------------------------
# data("simdat_pic")

## ----eval=FALSE---------------------------------------------------------------
# fit_pic <- aftpen_pic(simdat_pic, lambda = 0.0005, se = "CF", type = "BAR")
# fit_pic$beta

## ----eval=FALSE---------------------------------------------------------------
# fit_pic_lasso  <- aftpen_pic(simdat_pic, lambda = 0.001, se = "CF", type = "LASSO")
# fit_pic_alasso <- aftpen_pic(simdat_pic, lambda = 0.001, se = "CF", type = "ALASSO")
# fit_pic_scad   <- aftpen_pic(simdat_pic, lambda = 0.001, se = "CF", type = "SCAD")

## ----eval=FALSE---------------------------------------------------------------
# fit_zl <- aftpen(simdat_rc, lambda = 0.1, se = "ZL", type = "BAR")

