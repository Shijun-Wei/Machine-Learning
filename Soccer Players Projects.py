import numpy as np
import pandas as pd
import scipy as sp
import os
import seaborn as sns
import matplotlib.pyplot as plt
import statsmodels.api as sm
from sklearn import preprocessing
from sklearn.model_selection import train_test_split
from sklearn.feature_selection import RFE
from sklearn.linear_model import LogisticRegression
from sklearn.linear_model import LinearRegression
from sklearn import metrics
from sklearn.metrics import confusion_matrix
from imblearn.over_sampling import SMOTE
pd.options.mode.chained_assignment = None


Soccer = pd.read_csv("FIFA_Player_List.csv", encoding='latin-1')
Soccer.head()

#Checking for nulls
Soccer.isnull().values.any()