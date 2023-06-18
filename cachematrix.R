# Function to create a special matrix object that can cache its inverse
makeCacheMatrix <- function(x) {
  inv <- NULL

  set <- function(y) {
    x <<- y  
    inv <<- NULL  
  }
  
  get <- function() {
    x  
  }

  getInverse <- function() {
    if (!is.null(inv)) {
      message("Getting cached inverse")
      return(inv)
    } else {
      message("Calculating inverse")
      inv <- solve(x)
      return(inv)
    }
  }

  list(set = set, get = get, getInverse = getInverse)
}

# Function to compute the inverse of a matrix, using caching if available
cacheSolve <- function(x) {
  inv <- x$getInverse()

  inv
}
