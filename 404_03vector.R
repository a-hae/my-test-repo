
# 29.10.2019
# read in some data
# sp obejkt alt; sf objekt ist neu!!!! sf ist mit geometry
# zur info sstr(objekt)
# exersice 1--------------------------------------------------------------------

library(sf)
library(sp)
# Load north Carolina dara------------------------------------------------------

nc = read_sf(system.file("shape/nc.shp", package = "sf"))
class(nc)  
typeof(nc)
str(nc[, 1:2])
# simple features: umschreibung des Paketes
# GDAl: read and write data aller räumlichen daten, stellt treiber für versch....
# Datenformaten bereit, proj: alle projektionen GEOS: für prozessierung

# unterschied sp und sf; sf effizienter und einfacher als sp,4
# sf nutz normaler dataframes, sp war eigene WElt, eigen klassen

# coordunate reference system
st_crs(nc)

# plotting only forst column
plot(nc[, "BIR79"])

# Exersice 2--------------------------------------------------------------------
data("meuse")

meuse_sp = meuse

# spatial objekt aus aus x und y column-----------------------------------------

coordinates(meuse_sp) = c("x", "y")
# objekt in sf objekt konvertieren----------------------------------------------

meuse_sf = st_as_sf(meuse_sp) 

class(meuse_sf)

# kein Koordinatensystem gesetzt, sonst solle es immer vorhanden sein-----------
# welche projektion hat ein Datensatz?? erst orginale Projektion setzenn und 
# dann umprojezieren!

st_crs(meuse_sf)
# Exersice 1 : heavy metal, meuse------------------------------------------------------

meuse_cad = summary(meuse_sf[,1])
meuse_cop = summary(meuse_sf[,"copper"])
meuse_lead = summary(meuse_sf[,"lead"])
 
vars = c("cadmium", "copper")

summary(meuse_sf[, vars])


# 1.5---------------------------------------------------------------------------
med = median(meuse_sf$copper)
# Filter: daten, zeilen mit name addreesiert
dplyr::filter(meuse_sf, elev > 7 & copper < med) # beide müssen stimmen
# bei && wird zweites erst ausgeführt, wenn erster erfolreicha ausgeführt wi

subset = meuse_sf[meuse_sf$copper > med & meuse_sf$elev > 7, ]


plot(meuse_sf[, "copper"], col = "black")
plot(st_geometry(meuse_sf))
plot(st_geometry(subset), pch = 16, col = "red", add = TRUE)







