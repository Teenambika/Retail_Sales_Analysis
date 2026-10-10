import pandas as pd
from pandas import to_datetime

df = pd.read_csv("retail_sales_dataset.csv")
print(df.head(10))
#print(df.info()) - checking datatypes
#print(df.isnull().sum()) - checking missing values
#print(df.duplicated().sum()) - checking duplicate values
#print(df.describe()) - checking impossible values
#print(df["column_name"].unique()) - checking unique values

#remove duplicates
df = df.drop_duplicates()
print(df.duplicated().sum())

#remove missing values
df = df.dropna()
print(df.isnull().sum())

#formate date column
df["order_date"] = pd.to_datetime(df["order_date"],format="mixed",errors="coerce")
print(df["order_date"].isnull().sum())
print(df["order_date"].dtypes)

#Standardizing inconsistent values
df["gender"] = df["gender"].replace({
    "m" : "Male",
    "M" : "Male",
    "male"  : "Male",
    "MALE" : "Male",
    "f" : "Female",
    "F" : "Female",
    "female" : "Female",
    "FEMALE" : "Female"
})
print(df["gender"].unique())
df["order_status"] = df["order_status"].replace({
    "delivered" : "Delivered",
    "pending"   : "Pending",
    "cancelled" : "Cancelled",
    "shipped" : "Shipped"
})
print(df["order_status"].unique())

#remove negative values
df = df[df["age"]>0]
print((df["age"]<0).sum())
df = df[df["days_to_ship"]>0]
print((df["days_to_ship"]<0).sum())
df = df[df["quantity"]>0]
print((df["quantity"]<0).sum())

#Checking removing invalid age
print(df[(df['age']<18)|(df['age']>100)]
['age'].value_counts())

df = df[(df['age'] >=18) & (df['age'] <= 100)]
print(df['age'].min())
print(df['age'].max())

print(df.shape)

#save the cleaned dataset
df.to_csv("retail_sales_cleaned.csv",index=False)

