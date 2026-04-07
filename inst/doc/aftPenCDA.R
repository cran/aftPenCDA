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
# 
# set.seed(1)
# 
# n <- 100
# p <- 10
# 
# beta0 <- c(1, 1, 1, rep(0, p - 3))
# x <- matrix(rnorm(n * p), n, p)
# 
# T <- exp(x %*% beta0 + rnorm(n))
# C <- rexp(n, rate = 0.5)
# 
# y <- pmin(T, C)
# d <- as.numeric(T <= C)
# 
# dt <- data.frame(y = y, d = d, x)

## ----eval=FALSE---------------------------------------------------------------
# fit_bar <- aftpen(dt, lambda = 0.1, se = "CF", type = "BAR")
# fit_bar$beta

## ----eval=FALSE---------------------------------------------------------------
# fit_lasso  <- aftpen(dt, lambda = 0.1, se = "CF", type = "LASSO")
# fit_alasso <- aftpen(dt, lambda = 0.1, se = "CF", type = "ALASSO")
# fit_scad   <- aftpen(dt, lambda = 0.1, se = "CF", type = "SCAD")

## ----eval=FALSE---------------------------------------------------------------
# set.seed(1)
# 
# ## simplified generator for clustered partly interval-censored data
# n <- 100
# p <- 2
# beta0 <- c(1,1)
# clu_rate <- 0.5
# exactrates <- 0.8
# left <- 0.001
# right <- 0.01
# 
# ## cluster-level frailty and informative cluster sizes
# eta <- 1 / clu_rate
# v <- rgamma(n, shape = eta, rate = eta)
# m <- ifelse(v > median(v), 5, 3)
# id <- rep(seq_len(n), m)
# vi <- rep(v, m)
# 
# ## subject-level covariates and failure times
# N <- sum(m)
# x <- matrix(rnorm(N * p), ncol = p)
# colnames(x) <- paste0("x", seq_len(p))
# 
# T <- as.vector(exp(x %*% beta0 + vi * log(rexp(N))))
# 
# ## build (L, R, delta)
# L <- R <- delta <- numeric(N)
# index <- rbinom(N, 1, exactrates)
# 
# for (i in seq_len(N)) {
#   if (index[i] == 1) {
#     L[i] <- T[i]
#     R[i] <- T[i]
#     delta[i] <- 1
#   } else {
#     U <- cumsum(c(1e-8, runif(10, left, right)))
#     LL <- U[-length(U)]
#     RR <- U[-1]
# 
#     if (T[i] < min(LL)) {
#       L[i] <- 1e-8
#       R[i] <- min(LL)
#       delta[i] <- 0
#     } else if (T[i] > max(RR)) {
#       L[i] <- max(RR)
#       R[i] <- 1e8
#       delta[i] <- 0
#     } else {
#       idd <- which(T[i] > LL & T[i] < RR)
# 
#       if (length(idd) == 1) {
#         L[i] <- LL[idd]
#         R[i] <- RR[idd]
#         delta[i] <- 0
#       } else {
#         L[i] <- T[i]
#         R[i] <- T[i]
#         delta[i] <- 1
#       }
#     }
#   }
# }
# 
# dt_pic <- data.frame(
#   L = L,
#   R = R,
#   delta = delta,
#   id = id,
#   x1 = x[, 1],
#   x2 = x[, 2]
# )

## ----eval=FALSE---------------------------------------------------------------
# fit_pic <- aftpen_pic(dt_pic, lambda = 0.0005, se = "CF", type = "BAR")
# fit_pic$beta

## ----eval=FALSE---------------------------------------------------------------
# fit_pic_lasso  <- aftpen_pic(dt_pic, lambda = 0.001, se = "CF", type = "LASSO")
# fit_pic_alasso <- aftpen_pic(dt_pic, lambda = 0.001, se = "CF", type = "ALASSO")
# fit_pic_scad   <- aftpen_pic(dt_pic, lambda = 0.001, se = "CF", type = "SCAD")

## ----eval=FALSE---------------------------------------------------------------
# fit_zl <- aftpen(dt, lambda = 0.1, se = "ZL", type = "BAR")

