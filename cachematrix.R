## Overall description: functions that can cache/change the value of the matrix and calculate/cache its inverse.

## Assuming that the matrix supplied is always invertible, so it is always square matrix.
## makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
}
get<-function() x
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)
}

## cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix or it calculates 
#the inverse of the special "matrix".

cacheSolve <- function(x=matrix(), ...) {
    m<-x$getmatrix()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
    datos<-x$get()
    m<-solve(datos, ...)
    x$setmatrix(m)
    m
}
