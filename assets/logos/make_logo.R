.libPaths("~/GitHub/mediation_measurement_noise/lib/")
library(tidyverse)

seq_theta <- seq(0,4*pi,by=0.05)
cartesian_golden_spiral <- function(theta) {
    a <- polar_golden_spiral(theta)*cos(theta)
    b <- polar_golden_spiral(theta)*sin(theta)
    c(a,b)
}
polar_golden_spiral <- function(theta) exp(0.30635*theta)
(serie <- sapply(seq_theta,cartesian_golden_spiral))

png("~/GitHub/MadeleineGastonguay.github.io/assets/logos/logo.png", width = 450, height = 300)
data.frame(t(serie)) %>% 
  ggplot(aes(x=X1,y=X2)) + geom_path(color = "#f582aa", lwd = 2) +
    theme(panel.grid.minor = element_blank(),
          axis.text.x = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks = element_blank(),
          axis.title = element_blank()) +
    scale_y_continuous(breaks = seq(-20,20,by=10)) +
    scale_x_continuous(breaks = seq(-20,50,by=10)) +
    coord_fixed() +
    labs(x = "",
         y = "")
dev.off()
