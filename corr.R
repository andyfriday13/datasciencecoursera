corr <- function(directory, threshold = 0) {
## 'threshold' is a numeric vector of length 1 indicating the number of completely
## obeseved observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0
## Return a numeric vector of correlations
## Note: Do not round the result.
##
#Initialize container for complete list.
#Loop for constructing the file name dynamically.
	cr <- NULL #correlation between complete values.
	xfile <- list.files(directory,full.name=TRUE)
	print(length(xfile))
	for  (i in 1:length(xfile)) {
## read.csv() function.
		x <- read.csv(xfile[i])
		if (sum(complete.cases(x)) >= threshold) {
			cr <- c(cr,cor(x$sulfate,x$nitrate,use="complete.obs"))
		}
## End loop
	}
## final computations if any and return output
	cr
}