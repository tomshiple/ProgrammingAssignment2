## This pair of functions allows for caching the result of computing the inverse of a matrix.
## 

## Creates a vector of functions for manipulating the matrix x.  Specifically, there are functions for setting and getting the matrix,
## and for setting and getting the inverse of the matrix.  The inverse of the matrix is cached to save runtime.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  x <- NULL  # set initially to NULL so that set() must be called before get() can be called
  set <- function(y) {
    if (is.null(inv)) {
      # inv already NULL, leave as is
    } else if (identical(x, y)) {
      # not changing x, so leave inv as is
      message("matrix unchanged; do not reset inverse")
    } else {
      message("resetting inverse to NULL")
      inv <<- NULL    
    }
    x <<- y
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## Takes a function vector x for manipulating a matrix m.  If the inverse inv has already been
## computed and stored in x, then just return inv.  Otherwise compute the inverse, store it, and return it.
## Assumes that m is invertible.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}
