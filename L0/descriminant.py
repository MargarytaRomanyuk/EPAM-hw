import math
def descriminant (a,b,c):
        return (b**2 - 4*a*c)
def solv_square(d):
        return math.sqrt(abs(d))
        
def roots(d,a,b,c):
        if d > 0:
            print(" real and different roots ")  
            print((-b + solv_square(d)) / (2 * a)) 
            print((-b - solv_square(d)) / (2 * a))  
        elif d == 0:
            print(" real and same roots")
            print(-b / (2 * a))  
        else:  
            print("Complex Roots")  
            print(- b / (2 * a), " + i", solv_square(d))  
            print(- b / (2 * a), " - i", solv_square(d))
def asc_value (messege):
    print(messege)
    
def main():
    return (asc_value('Please, enter values each on a new line'))

main ()
a = int(input("enter a = "))
b = int(input("enter b = "))
c = int(input("enter c = "))
if a == 0:
    print("Input correct value")
d = descriminant (a,b,c)

print(roots(d,a,b,c))