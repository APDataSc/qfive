#' Under five mortality rate (u5MR) estimation
#'
#' Estimate de u5MR from `data` values with the different versions of Brass method.
#'
#' @param data A data.frame containing the information.
#' @param women A numeric variable with the women (N) number.
#' @param child_born A numeric variable with the child ever born (CEB) number.
#' @param child_dead A numeric variable with the child deaths (CD).
#' @param agegrp A character string of the mother age groups.
#' @param model A character string of the model life table.
#' @param svy_year A numeric variable with the reference date in decimals.
#' @param sex A character string with the sex.
#' @param e_0 A numeric variable with the life expectancy corresponding to the life table selected.
#' @param mac A numeric variable with the mother average of child-bearing.
# Add returning value description and tag
#' @return A data frame with the q_1, q_5 and reference time estimated.
# Export this function
#' @export

u5mr <-
function (data, women = "women", child_born = "child_born",
                               child_dead = "child_dead", agegrp = "agegrp",
                               model = "CD West", svy_year, sex,
                               e_0 = 60, mac = 27){
  agegrp <- data[[agegrp]]
  women <- data[[women]]
  child_born <- data[[child_born]]
  child_dead <- data[[child_dead]]
  pi <- child_born/women
  di <- child_dead/child_born
  p1 <- pi[1]
  p2 <- pi[2]
  p3 <- pi[3]

  coeff_trussell_ki <- mlt[ , 1:6 ]
  t47 <- coeff_trussell_ki[lt_model == model, -1]
  ki <- t47$ai + (t47$bi * p1/p2) + (t47$ci * p2/p3) + t47$di*mac
  qx <- ki * di

  coeff_trussell_ti <- mlt[ , c(1:2, 7:9) ]
  t48 <- coeff_trussell_ti[lt_model == model, -1]
  ti <- t48$ei + (t48$fi * p1/p2) + (t48$gi * p2/p3)
  year <- round(svy_year - ti, 2)

# Trusell and Palloni-Helligman version
    Ys <- modelLTx1 %>%
      setDT() %>%
      .[type_mlt == model & e0 == e_0] %>%  #luego poner dinámico
      dcast(age ~ sex, value.var = "lx1", fun.aggregate = sum) %>%
      .[age>0, lx := (1.05*male+female)/2.05] %>%
      .[ , Ys := 0.5*log((100000-lx)/lx)] %>%
      .[ age %in% c(1:3, 5, 10, 15, 20) ] %>%
      pull(Ys)

    alpha <- 0.5*(log(qx/(1-qx)))-Ys

    q1 <- exp(2*(alpha+Ys[1]))/(1+(exp(2*(alpha+Ys[1]))))
    q5 <- exp(2*(alpha+Ys[4]))/(1+(exp(2*(alpha+Ys[4]))))

  data.frame(agegrp, women, child_born, child_dead, pi, di,
             ki, qx, ti, year, q1, q5)
}
