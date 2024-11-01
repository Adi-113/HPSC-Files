import os
import time
import multiprocessing

def get_all_substrings(input_string):
    length = len(input_string)
    return [input_string[i:j+1] for i in range(length) for j in range(i,length)]

def checkpal(s):
    substrings = [a for a in get_all_substrings(s) if len(a) > 1]
    t=[i for i in substrings if i == i[::-1]and len(i)==5]
    if len(t)!=0:
        return 1
    else:
        return 0 

if __name__ == "__main__":
    folder_path = "C://Users//adith//Desktop//UMASSD//HPSC//code3//palindromes"
    files = [f for f in os.listdir(folder_path) if f.endswith(".txt")]
    with multiprocessing.Pool() as pool:
        start_time=time.time()
        for file in files:
            file_path = os.path.join(folder_path, file)
            with open(file_path, 'r') as f:
                data = f.read()
            t = data.replace("\n", "")
            pool.map(checkpal,t)
        end_time = time.time()
        exe= end_time - start_time
        print(f'The excecution time is : {exe:.4f}')