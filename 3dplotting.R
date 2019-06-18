# http://www.r-graph-gallery.com/

moxbuller = function(n) {   
  u = runif(n)   
  v = runif(n)   
  x = cos(2*pi*u)*sqrt(-2*log(v))  
  y = sin(2*pi*v)*sqrt(-2*log(u))
  r = list(x=x, y=y)
  return(r) 
}
r = moxbuller(50000) 
par(bg="black") 
par(mar=c(0,0,0,0)) 
plot(r$x,r$y, pch=".", col="blue", cex=1.2)

hist(r$x)
#Un espece de noeud en 3D de ouf !!!
library(rgl)
#Choose the size of the image on the output (800,650 to have 800 x 600)
r3dDefaults$windowRect <- c(0,50, 800, 650) 
open3d()
#If you want to put line on the background
#bg3d(sphere = TRUE, color = c("grey", "white"), lit = TRUE, back = "lines" ,lwd=2)
bg3d(col=rgb(0.2,0.8,0.5,0.8))
theta <- seq(0, 2*pi, len = 50)
knot <- cylinder3d(
  center = cbind(sin(theta) + 3*sin(2*theta), 2*sin(3*theta), cos(theta) - 2*cos(2*theta)),
  e1 = cbind(cos(theta) + 4*cos(2*theta),6*cos(3*theta),sin(theta) + 4*sin(2*theta)),radius = 0.9,closed = TRUE)
shade3d(addNormals(subdivision3d(knot, depth = 2)), col = rgb(0.4,0.2,0.8,0.3))
#For portfolio 
rgl.snapshot( "#20_portfolio_knot_3D.png", fmt="png", top=TRUE  )
#Pour une image mobile en html (attention, doit etre accompagnée de ses 2 fichiers soeurs...)
writeWebGL( filename="#20_portfolio_knot_3D.html" ,  width=1500)

