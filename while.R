a<-1
b<-0
c<-0
cnt<-0
while (cnt < 10) {
	a <- b+a
	print (b)
	b <- b+a
	cnt <- cnt+1
}