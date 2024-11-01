import random
import string
n=10 #Number of files
chars_per_file = 1000 #Number of characters per file

# Create a list of uppercase letters
letters = list(string.ascii_uppercase)

# Function to generate a random 5-letter palindrome
def generate_palindrome():
    first_half = ''.join(random.choice(letters) for _ in range(2))
    return first_half + first_half[::-1]

# Generate the files
for i in range(n):
    # Generate a list of random uppercase letters
    random_letters = random.choices(letters, k=chars_per_file - 5)
    
    # Generate a random 5-letter palindrome
    palindrome = generate_palindrome()
    
    # Insert the palindrome at a random position
    pos = random.randint(0, len(random_letters))
    random_letters.insert(pos,palindrome)
    
    # Join the list into a string and write it to a file
    with open(f"palindromes/file_{i+1}.txt", "w") as f:
        f.write("".join(random_letters))
