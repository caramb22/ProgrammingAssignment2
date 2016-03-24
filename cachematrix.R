# A function that can create a matrix and cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  # Create an empty object to hold the inverse.
  inverse <- NULL
  # Create another function that retrieves and stores information. 
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  # A function that returns data.
  get <- function() x
  # A function that retrieves the inverse matrix.
  setInverse <- function(inverse) inverse <<- inverse
  # A function that returns the inverse matrix.
  getInverse <- function() inverse
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

# A function that checks whether an inverse has already been cached.
cacheSolve <- function(x, ...) {
  # Look at the inverse matrix cache... 
  inverse <- x$getInverse()
  # ... and determine whether is has a cached matrix in it already. 
  if(!is.null(inverse)) {
    # If so, pop out a message indicating the cached matrix is being retrieved,
    message("do you have any Grey Poupon?")
    # and return the cached inverse matrix.
    return(inverse)
  }
  # If the inverse has not been cached, pull up the matix...
  data <- x$get()
  # ...and calculate its inverse.
  inverse <- solve(data, ...)
  # Append that information to the dataset...
  x$setInverse(inverse)
  # And show it.
  inverse
}
