# -*- coding: utf-8 -*-
"""4392_samueljoshuav.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1ak140pWSQL9nrVsuZcHK6xFNSM-08d31
"""

length = int(input("Enter length: "))
width = int(input("Enter width: "))
area_calc = length * width
print(f"Area is found to be: {area_calc}")
if area_calc > 50:
  print("Size is large")
elif area_calc > 20 & area_calc < 50:
  print("Size is medium")
else:
  print("Size is small")

weight = int(input("Enter weight: "))
height = int(input("Enter height:"))
bmi = (weight/(height**2))
print("BMI is found to be:",bmi)

stud = {}
subject = input("Enter subject: ")
grade = int(input("Enter grade: "))
stud[subject]=grade

for subject,grade in stud.items():
  print(f"{subject}:{grade}")

age = int(input())

if age>1 & age<=10:
    print("Child")
elif age>10 & age<=21:
    print("Teenager")
elif age> 21 & age<=50:
    print("Adult")
else:
    print("Senior member")

def promotional(list):
  result = []

for i in list:
  if i%2==0:
    result.append(i)

list = [1,2,3,4]
promotional(list)

for i in range(1,6):
  if i%2==0:
    print(i)

def sec_system():
  password_char = input("Enter password:")
  p = input("Recheck pass: ")
  if p in password_char:
    print("Password match")
  else:
    print("No match")

sec_system()

def cust_satis():
  score1 = input("Enter the score in hand: ")
  score2 = input("Enter the score in hand:")
  score3 = input("Enter the score in hand: ")
  list_score = [score1,score2,score3]
  sum = 0
  for i in list_score:
    sum = sum+ 1
    avg = sum//3
  return avg

cust_satis()
print("Average scores is found to be:",avg)

def cus_satis():
  score1 = int(input())
  score2 = int(input())
  score3 = int(input())
  average_score = ((score1+score2+score3) / 3)
  print("Average of three scores is:",average_score)

cus_satis()

# vowel condition for filtering based on the presence of a vowel
for i in range(list):
  if i in ('a' or 'e' or 'i' or 'o' or 'u'):
    print("vowel")
  else:
    pass

deadline_date = input("Enter deadline date:")
current_date = input("Enter current date")

if deadline_date == current_date:
  print("Deadline has arrived!! Remainder")
else:
  print("Deadline upcoming")

def finance_robust():
  x = int(input()) # some param involved in interest calc
  y = int(input()) # some param involved in interest calc
  z = int(input()) #some param involved in interest calc
  salary_savings = (x+y/z)
  print("Salary interest_calc:",salary_savings)
  try:
    salary_savings = (x+y/z)
  except TypeError:
    print("Error in the entered values")

finance_robust()

def poll():
  text = input()
  try:
    text = ""
  except TypeError:
    print("Enter date has to be reevualuted since it does not seem to be in the right format")

poll()

def scientist_data_process():
  num1 = int(input())
  num2 = int(input())
  try:
    num1/num2
  except ZeroDivisionError:
    print("Error: Cannot be divided by zero")

scientist_data_process()

def writing_to_file():
  with open(name,'f') as file:
    file.write(req_content)

name = "sam.txt"
req_content = "This is the sample file"

def writing_to_file()

file = open('sam.txt','r')
file.readlines()

def update_file():
  with open(name,'f') as file:
    file.write(req_content,new_content)

name = "news.txt"
req_content = "Company news: Accquired new"
new_content = "Stock performance: Improvement in currrent stock"

update_file()