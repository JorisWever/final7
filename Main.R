# MGI 22
# Erwin van den Berg
# Joris Wever
# January 2016
# Exercise 7 of the Geo-Scripting Course from WUR

# libraries
library(raster)
library(rgdal)

# import functions
source('R/importFromUrl.R')
source('R/getHighestNDVIcity.R')
source('R/plotFunction.R')

## !!! Before running the script, make sure you updata the packages (takes some minutes)
update.packages(checkBuilt=TRUE, ask = FALSE)

# import data
importFromUrl("https://github.com/GeoScripting-WUR/VectorRaster/raw/gh-pages/data/MODIS.zip")

# main code
# 1		 	Create MODIS Brick
MODISpath <- list.files(path = 'data/', pattern = glob2rx('*.grd'), full.names = TRUE)
MODISbrick <- brick(MODISpath)

# 2 		Create shape-files
municipshp <- getData('GADM', country='NLD', level=2, path='data/')
provinceshp <- getData('GADM', country='NLD', level=1, path='data/')

# 3 		Reproject shape-files
municip_proj <- spTransform(municipshp, CRS(proj4string(MODISbrick)))
province_proj <- spTransform(provinceshp, CRS(proj4string(MODISbrick)))

# 4			Mask MODIS data
NDVI <- mask(MODISbrick, municip_proj)

# 5			Collect results per Municipality (please be patient, it could take a while)
municip_jan <- getHighestNDVIbyShape(NDVI, municip_proj, 'Mun', 'January')
province_jan <- getHighestNDVIbyShape(NDVI, province_proj, 'Prov', 'January')
municip_aug <- getHighestNDVIbyShape(NDVI, municip_proj, 'Mun', 'August')
province_aug <- getHighestNDVIbyShape(NDVI, province_proj, 'Prov', 'August')
municip_avg <- getHighestNDVIbyShape(NDVI, municip_proj, 'Mun')
province_avg <- getHighestNDVIbyShape(NDVI, province_proj, 'Prov')

# 6     Plot function
# plot examples
plotFunction(municip_proj, 'Mun')
plotFunction(province_proj, 'Prov')
plotFunction(municip_proj, 'Mun', 'January')
plotFunction(municip_proj, 'Mun', 'August')
plotFunction(province_proj, 'Prov', 'January')
plotFunction(province_proj, 'Prov', 'August')



