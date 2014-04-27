# Example usage:
# A  <- matrix(rnorm(n*n), nrow = n) - Create a square matrix A
# sm <- makeCacheMatrix(A)           - Create a special matrix (sm)
# sm$get()                           - Return the matrix
# cacheSolve(sm)                     - Return the inverse of special matrix 
# cacheSolve(sm)                     - Call it the 2nd time, which allows to return the cache of the inverse matrix

makeCacheMatrix <- function(x = matrix()) { #x is a default argument of type "matrix" if none is passed in
    # inv will store the cached inverse matrix
    inv <- NULL

    # Setter for x and inv matrix
    set <- function(y) {
        x <<- y # note that the operator <<- is used incide a function see doc.
        inv <<- NULL
    }

    # Getter for the matrix x	
    get <- function() x

    # Setter for the inverse
    setinv <- function(inverse) inv <<- inverse

    # Getter for the inverse
    getinv <- function() inv

    # Return the matrix with newly defined functions
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}

# cacheSolve: Compute the inverse matrix. If the inverse is already
# calculated before, it returns the cached inverse.

cacheSolve <- function(x, ...) {
    inv <- x$getinv()

    # If the inverse matrix is already calculated, return it
    if (!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }

    # Otherwise, calculate it
    data <- x$get()
    inv <- solve(data, ...)

    # Cache of the inverse matrix
    x$setinv(inv)

    # Return it
    inv
}


