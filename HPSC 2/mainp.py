import multiprocessing
import time
from timecons import timeconsumingfunc

if __name__ == "__main__":
    with multiprocessing.Pool() as pool:
        n=300
        start_time =time.time()
        for i in range(n):
            pool.map(timeconsumingfunc,"")
        end_time = time.time()
        exe= end_time - start_time
        print(f'The excecution time is : {exe}')
