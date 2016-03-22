### ORIGINAL VERSION:
## The purpose of this exercise was to write two functions.
## One function needed to create and temporarily store a square matrix,
## and the other function needed to calculate the inverse of that matrix. 

## FUNCTION 1: This function creates a square matrix (a matrix with an equal
## number of columns and rows and--for the purposes of testing this function--
## a unique value in each cell.

makeCacheMatrix <- function(x) {
  matrix(data=1:4,ncol=x,nrow=x)
}


## FUNCTION 2: This function uses function 1 internally, and it
## returns a matrix that is the inverse of the first matrix, using the 
## solve function.

cacheSolve <- function(x, ...) {
  solve(makeCacheMatrix(x))
}

### EDITED VERSION
## FUNCTION 1:

## I got rid of the default data values but otherwise left it the same. 

makeCacheMatrix <- function(x,data) {
  matrix(data=data,ncol=x,nrow=x)
}

## FUNCTION 2:
## I included an internal storage variable (y), and a clause to look at
## whether the contents of y were new or already calculated.

cacheSolve <- function(x,data) {
  y<-makeCacheMatrix(x=x,data=data)  
  z<-solve(y)
    ifelse(y=z,y,z)  
}

### The following code is what I used to test the modified functions.

## Generate some fake data
a<-sample(1:8,4)
b<-sample(1:8,4)
c<-sample(1:8,4)
d<-sample(1:8,4)
e<-sample(1:8,4)
f<-sample(1:8,4)
g<-sample(1:8,4)

## Try the second function out on the fake data.
cacheSolve(x=2,data=a)
cacheSolve(x=2,data=b)
cacheSolve(x=2,data=c)
cacheSolve(x=2,data=d)
cacheSolve(x=2,data=e)
cacheSolve(x=2,data=f)
cacheSolve(x=2,data=g)

## Limitation: I'm still not sure how to test the cacheSolve funtion's
## ability to save time by pulling up an existing inverse matrix
## if it has already been computed. Clearly, I have work to do!
