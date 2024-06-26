# -*- coding: utf-8 -*-
"""Lab2classi_samuel.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1cTX4sj4ql2mDUKKT4Y1slcpYYI9abSz2
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score

df = pd.read_csv('/content/penguins_classification.csv')
df

df.isnull().sum()

mean1 = df['bill_depth_mm'].mean()
df['bill_depth_mm'] = df['bill_depth_mm'].fillna(mean1)

df.duplicated().sum()

categ_cols = df.select_dtypes(include='object').columns
categ_cols

encoding = LabelEncoder()

df['island'] = encoding.fit_transform(df['island'])

df['species'] = encoding.fit_transform(df['species'])

for i in df:
  sns.boxplot(df[i])
  plt.show()

Q1 = df.quantile(0.25)
Q3 = df.quantile(0.75)
IQR = Q3 - Q1
lower_bound = Q1-1.5*IQR
upper_bound = Q3+1.5*IQR
outlier = ((df<lower_bound) | (df>upper_bound)).any(axis=1)
df = df[~outlier]
df

X = df.drop(columns='species')
X

Y = df['species']
Y

X_train,X_test,Y_train,Y_test = train_test_split(X,Y,test_size = 0.2,random_state=42)

model = RandomForestClassifier()

model.fit(X_train,Y_train)

Y_pred = model.predict(X_test)
Y_pred

accuracy_score(Y_test,Y_pred)

