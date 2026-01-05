import pandas as pd
from sqlalchemy import create_engine
path = "F:/data manipulation/Electronic.csv"
df = pd.read_csv(path)
print(df.isnull().sum())

df.columns = df.columns.str.lower()
df.columns = df.columns.str.replace(' ','_')
df = df.rename(columns = {"discount_(%)" : "discount_percent"})
print(df.head())

#Divide customer in 4 age groups
df["age_group"] = pd.qcut(df["age"], q = 4, labels = ["Young Adult", "Adult", "Middle Aged", "Senior"])
print(df[["age", "age_group"]].head())

username = "postgres"
password = "12345"
host = "localhost"
port = "5433"
database = "electronic_product_purchase"
engine = create_engine(f"postgresql+psycopg2://{username}:{password}@{host}:{port}/{database}")
table_name = "electronics"
df.to_sql(table_name, engine, if_exists = "replace", index = False)
print(f"Table: '{table_name}' and Database: '{database}'")