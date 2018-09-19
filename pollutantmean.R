#This is the part 1 of the week 2 programming assignment
pollutantmean <- function (directory,pollutant,id = 1:332) {
	#initialize the consolidated mean of all files
	cMean <- NULL
	xwt <- NULL
	#Loop for constructing the file name dynamically.
	for  (i in id) {
		if (i < 10) {
			j <- paste("00",as.character(i),sep="")
		} else if (i > 9 & i < 100) {
			j <- paste ("0",as.character(i),sep="")
		} else {
			j <- as.character(i)
		}
		#print(j)
		#Use the value of J to dynamically generate file name for the
		#read.csv() function.
		x <- read.csv(paste(directory,"/",j,".csv",sep=""))
		#Populate the vector cMean with a list of means from all the files.
		if (!is.nan(mean(x[[pollutant]],na.rm=TRUE))){
		cMean <- c(cMean,mean(x[[pollutant]],na.rm = TRUE))
		#print(cMean)
		xwt <- c(xwt,sum(!is.na(x[[pollutant]])))
		}
	}
	#Print xwt
	#print(xwt)
	#Return weighte cMean. REMEMBER!!! calculating mean of means is an incorrect approach. always calculate weighted mean.
	sum(cMean*xwt)/sum(xwt)
}