getHighestNDVIbyShape <- function(dataFrame, shape, level = NA, month = NA){
  #initialize output when there's no match in the list below
  shapeName = 'No matches found'

  # find the yearly average (in case no month was defined)
  if(is.na(month)){
     yearRaster <- dataFrame[[1]] + dataFrame[[2]] + dataFrame[[3]] + dataFrame[[4]] + dataFrame[[5]] + dataFrame[[6]] + dataFrame[[7]] + dataFrame[[8]] + dataFrame[[9]] + dataFrame[[10]] + dataFrame[[11]] + dataFrame[[12]]
     meandf <- extract(yearRaster, shape, df=TRUE,fun=mean, sp=TRUE)
     max <- max(meandf[['layer']], na.rm = TRUE)
     subset <- subset(meandf, layer == max)
     if(level == 'Mun'){
        shapeName <- subset$NAME_2
     }
     else if(level == 'Prov'){
       shapeName <- subset$NAME_1
     }
  }
  
  
  # find the monthly average, distinction between municipality and province level)
  else {
      	if(level == 'Mun' & !is.na(month)){ 
      		meanNDVI <- extract(dataFrame[[month]], shape, df=TRUE,fun=mean, sp=TRUE)
      		max <- max(meanNDVI[[month]], na.rm = TRUE)
      		
      		if(month == 'January'){ 
      			subset <- subset(meanNDVI, January == max)
      		}
      		else if( month == 'August'){
      			subset <- subset(meanNDVI, August == max)
      		}
      		shapeName <- subset$NAME_2
      	}
    	
    	else if (level == 'Prov' & !is.na(month)){
      		meanNDVI <- extract(dataFrame[[month]], shape, df=TRUE,fun=mean, sp=TRUE)
      		max <- max(meanNDVI[[month]], na.rm = TRUE)
      		
      		if(month == 'January'){ 
      			subset <- subset(meanNDVI, January == max)
      		}
      		else if( month == 'August'){
      			subset <- subset(meanNDVI, August == max)
      		}
      		shapeName <- subset$NAME_1
    	}
  }
  return(shapeName)
}