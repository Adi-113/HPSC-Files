library(foreach)
timeconsumingfun <- function() {
  
  Sys.sleep(5)  
}

start_time <- proc.time()[3]
n<-150
foreach(i = 1:n, .combine = c) %do% {
  timeconsumingfun()
}

end_time <- proc.time()[3]
execution_time <- end_time - start_time
print(paste("Execution time:", execution_time))

