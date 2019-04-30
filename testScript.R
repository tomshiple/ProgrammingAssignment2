# Source testScript.R with echo=TRUE, like this:
# source("testScript.R", echo =TRUE)

source("cacheMatrix.R")

# Create a 2x2 matrix, then create function vector
m <- matrix(1:4, 2, 2)
f <- makeCacheMatrix(m)

# We need to set m first, before we can get it.  First get returns NULL.
f$get()
f$set(m)
f$get()

# Inverse isn't yet set.  Solve for inverse of m.  Then we can get the inverse.
f$getinverse()
cacheSolve(f)
f$getinverse()

# Next call to solve gets inverse from cache.
cacheSolve(f)

# If we call set with the original matrix, the inverse will not be reset, and solve still finds it in the cache.
f$set(m)
cacheSolve(f)

# Create a second matrix, m2.  Call set with m2, which resets the cached inverse.   
m2 <- matrix(5:8, 2, 2)
f$set(m2)

# Solve for the inverse for m2.  A second call finds it in the cache.
cacheSolve(f)
cacheSolve(f)
