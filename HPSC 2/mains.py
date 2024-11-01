import time
from timecons import timeconsumingfunc
n=300
start_time =time.time()
for i in range(n):
    timeconsumingfunc()
end_time = time.time()
exe= end_time - start_time
print(f'The excecution time is : {exe:.4f}')