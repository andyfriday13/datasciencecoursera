complete <- function(directory, id = 1:332) {
## Return a data frame in the format:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID and 'nobs' is the number of complete observations.
#Initialize container for complete list.
	tmplst <- NULL
	smcpt <- NULL #Sum of complete cases
#Create a dataframe using the matrix function.
	cmplst <- data.frame(matrix(NA,nrow=0, ncol=2))
#Loop for constructing the file name dynamically.
	for  (i in id) {
		if (i < 10) {
			j <- paste("00",as.character(i),sep="")
		} else if (i > 9 & i < 100) {
			j <- paste ("0",as.character(i),sep="")
		} else {
			j <- as.character(i)
		}
#Use the value of J to dynamically generate file name for the
#read.csv() function.
		x <- read.csv(paste(directory,"/",j,".csv",sep=""))
		#tmplst <- complete.cases(x)
		smcpt <-sum(complete.cases(x))
#Create a row of record in the loop
		cmplst.row <- c(i,smcpt)
#Add the row into the dataframe using rbind()
		cmplst <- rbind(cmplst,cmplst.row)
	}
#Change the names of the columns as needed & return output
	colnames(cmplst) <- c("id","nobs")
	cmplst
}