## test push
## Two functions to use cache to store the inverse of a matrix

## makeCacheMatrix...creates an R object that stores...
## a matrix and its inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## cacheSolve computes the inverse of the matrix object...
## returned by makeCacheMatrix; if the inverse matrix has...
## already been cached (same matrix), then it retrieves...
## the stored inverse matrix instead of calculating the new...
## matrix object.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
