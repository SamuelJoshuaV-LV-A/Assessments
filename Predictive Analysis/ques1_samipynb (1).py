# -*- coding: utf-8 -*-
"""QUES1_SAMipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1pUo1DEhwI-DXYn8zGSJ9lX7FWRXCmEmA
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.linear_model import LinearRegression
from scipy.stats import zscore
from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import MinMaxScaler
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error, mean_absolute_error, r2_score
from math import sqrt

#Loading data

df = pd.read_csv("/content/bengaluru_house_prices.csv")
df

#Checking for duplicates

df.isnull().sum()

#Using imputation to fill the missing value detected

from sklearn.impute import KNNImputer
num_cols = df.select_dtypes(include=['int64','float64']).columns

imputing = KNNImputer()
for i in num_cols:
  df[i] = imputing.fit_transform(df[[i]])

df.dtypes

df['total_sqft'] = pd.to_numeric(df['total_sqft'],errors='coerce')

df.dtypes

df.isnull().sum()

mean1 = df['total_sqft'].mean()
df['total_sqft'] = df['total_sqft'].fillna(mean1)

df.isnull().sum()

categorical_columns = df.select_dtypes(include=['object']).columns

# Fill null values with mode
for column in categorical_columns:
    mode_value = df[column].mode()[0]
    df[column].fillna(mode_value, inplace=True)

df.isnull().sum()

#Checking for duplicates

df.duplicated().sum()

#Dropping duplicates

df= df.drop_duplicates()

df.duplicated().sum()

#Comprehensive overview of data

df.describe(include='all')

df.shape

#Box plot to check for univariate analysis and checking for the presence of outliers

for i in num_cols:
  sns.boxplot(df[i])
  plt.show()

# BOX plot shows that outliers are present and hence we handle the outliers by removing them

#Removing outliers

Q1 = df[num_cols].quantile(0.25)
Q3 = df[num_cols].quantile(0.75)
IQR = Q3 - Q1
lower_bound = Q1-1.5*IQR
upper_bound = Q3+1.5*IQR
outlier = ((df[num_cols]<lower_bound) | (df[num_cols]>upper_bound)).any(axis=1)
df = df[~outlier]
df

#After removing outliers

df.shape

#Verfication after outlier removal
#Box plot - Serves for univariate analysis as well
for i in num_cols:
  sns.boxplot(df[i])
  plt.show()

#univariate analysis using histogram

for i in num_cols:
  sns.histplot(df[i])
  plt.title(f'Histogram of {num_cols}')
  plt.xlabel('Numerical columns')
  plt.ylabel('Frequency')
  plt.show()

#bivaraite analysis using scatter plot for EDA and understanding the data in depth

for i in range(len(num_cols)):
    for j in range(i + 1, len(num_cols)):
        plt.figure(figsize=(10, 6))
        sns.scatterplot(data=df, x=num_cols[i], y=num_cols[j])
        plt.title(f'Scatter Plot between {num_cols[i]} and {num_cols[j]}')
        plt.show()

df.dtypes

# I find that total_sqft has numerical values but is of the wrong datatype and hence I change it

df['total_sqft'] = pd.to_numeric(df['total_sqft'],errors='coerce')

df.dtypes

#Correlation

numerical_cols = df.select_dtypes(include=['int64','float64']).columns
df[numerical_cols].corr()

#Correlation for feature selection (engineering)

sns.heatmap(df[numerical_cols].corr(),annot=True,cmap="coolwarm",fmt=".2f")

# Business idea noted - Number of bathroom seems to influence the overall price
#It makes sense from a business point of view

#Feature selection - Every column here has predictive power and does influce the house prices
# This is found from both correlation and domain knowledge

categorical_columns = df.select_dtypes(include=['object']).columns
categorical_columns

#Encoding the categorical variables because most machine learning algorithms cannot handle categorical data directly and require numerical input

from sklearn.preprocessing import LabelEncoder
from sklearn.preprocessing import LabelEncoder
encoding = LabelEncoder()
df['area_type'] = encoding.fit_transform(df['area_type'])
df['availability'] = encoding.fit_transform(df['availability'])
df['size'] = encoding.fit_transform(df['size'])
df['society'] = encoding.fit_transform(df['society'])

df['location'] = encoding.fit_transform(df['location'])

df.dtypes

#FEATURE (Should not consist of the target variable)

X = df.drop(columns='price')
X

#TARGET

Y = df['price']
Y

#Splitting data to train and test

X_train,X_test,Y_train,Y_test = train_test_split(X,Y,test_size=0.3,random_state=42)

#Scaling for better optimization

from sklearn.preprocessing import StandardScaler

scaling = StandardScaler()
X_train = scaling.fit_transform(X_train)
X_test = scaling.transform(X_test)

model = LinearRegression()
model.fit(X_train,Y_train)

y_pred = model.predict(X_test)

#Model Evaluation

from sklearn.metrics import mean_squared_error, mean_absolute_error, r2_score

print('R^2: ', r2_score(Y_test, y_pred))
print('MAE: ',mean_absolute_error(Y_test, y_pred))
print('MSE: ', mean_squared_error(Y_test, y_pred))
print('RMSE: ', np.sqrt(mean_squared_error(Y_test, y_pred)))

#Polynomial Regression

from sklearn.preprocessing import PolynomialFeatures
polynomial = PolynomialFeatures(degree=2)
X_train_pol = polynomial.fit_transform(X_train)

model2 = LinearRegression()
model2.fit(X_train_pol,Y_train)

X_test_poly = polynomial.transform(X_test)
pol_predict = model2.predict(X_test_poly)
pol_predict

#Model Evaluation

print('R^2: ', r2_score(Y_test, pol_predict))
print('MAE: ',mean_absolute_error(Y_test, pol_predict))
print('MSE: ', mean_squared_error(Y_test, pol_predict))
print('RMSE: ', np.sqrt(mean_squared_error(Y_test, pol_predict)))

# Lower MSE: Indicates that the model's predictions are close to the actual values, implying better performance.

# Rsqaure here suggests a good fit, meaning the model captures most of the variability in the target variable.

plt.scatter(Y_test, y_pred, c='red', label='Actual')
plt.scatter(Y_test, Y_test, c='blue', label='Predicted')
plt.xlabel("Actual values")
plt.ylabel("Predicted values")
plt.plot([min(Y_test), max(Y_test)], [min(Y_test), max(Y_test)], color='black', linestyle='-', label='bestfitline')
plt.legend()

plt.scatter(Y_test, pol_predict, c='red', label='Actual')
plt.scatter(Y_test, Y_test, c='blue', label='Predicted')
plt.xlabel("Actual values")
plt.ylabel("Predicted values")
plt.plot([min(Y_test), max(Y_test)], [min(Y_test), max(Y_test)], color='black', linestyle='-', label='bestfitline')
plt.legend()

# Business idea noted - Number of bathroom seems to influence the overall price
#It makes sense from a business point of view