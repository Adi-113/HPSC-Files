library(foreach)
library(doParallel)

timeconsumingfun <- function() {
  
  Sys.sleep(5)  
}


registerDoParallel(6)

start_time <- proc.time()[3]
n<-150
foreach(i = 1:n, .combine = c) %dopar% {
  timeconsumingfun()
}

end_time <- proc.time()[3]
execution_time <- end_time - start_time
print(paste("Execution time:", round(execution_time,4), "seconds"))