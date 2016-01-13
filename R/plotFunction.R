plotFunction <- function(shape, level=NA, month=NA){
	par(mfrow=c(1,2))
	if(is.na(month)){
		if(level == 'Mun'){
			plot(shape, col='grey', main= 'Greenest municipality in The 
Netherlands in 2014', axes=TRUE)
			greenest_entity <- shape[shape$NAME_2 == municip_avg,]
			plot(greenest_entity, col='green', add=TRUE)
			text(greenest_entity, labels=municip_avg, col='blue', pos=4)
		}
		else if(level == 'Prov'){
			plot(shape, col='grey', main= 'Greenest province in The 
Netherlands in 2014', axes=TRUE)
			greenest_entity <- shape[shape$NAME_1 == province_avg,]
			plot(greenest_entity, col='green', add=TRUE)
			text(greenest_entity, labels=province_avg, col='blue', pos=4)
		}
	}
	else {
		if(level == 'Mun'){ 
			if(month == 'January'){ 
				plot(shape, col='grey', main= 'Greenest municipality in The 
Netherlands in January', axes=TRUE)
				greenest_entity <- shape[shape$NAME_2 == municip_jan,]
				plot(greenest_entity, col='green', add=TRUE)
				text(greenest_entity, labels=municip_jan, col='blue', pos=4)
			}
			else if( month == 'August'){
				plot(shape, col='grey', main= 'Greenest municipality in The 
Netherlands in August', axes=TRUE)
				greenest_entity <- shape[shape$NAME_2 == municip_aug,]
				plot(greenest_entity, col='green', add=TRUE)
				text(greenest_entity, labels=municip_aug, col='blue', pos=4)
			}
		}
		else if (level == 'Prov'){
			if(month == 'January'){ 
				plot(shape, col='grey', main= 'Greenest Province in The 
Netherlands in January', axes=TRUE)
				greenest_entity <- shape[shape$NAME_1 == province_jan,]
				plot(greenest_entity, col='green', add=TRUE)
				text(greenest_entity, labels=province_jan, col='blue', pos=4)
			}
			else if( month == 'August'){
				plot(shape, col='grey', main= 'Greenest Province in The 
Netherlands in August', axes=TRUE)
				greenest_entity <- shape[shape$NAME_1 == province_aug,]
				plot(greenest_entity, col='green', add=TRUE)
				text(greenest_entity, labels=province_jan, col='blue', pos=2)
			}
		}
	}
}