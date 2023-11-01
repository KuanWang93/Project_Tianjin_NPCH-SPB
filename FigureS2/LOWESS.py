#%%
import os
import pandas as pd
import numpy as np
import statsmodels.api as sm
from sklearn.linear_model import LinearRegression
from scipy.interpolate import interp1d


item_dir = '/project/wang/kuan/new_tianjin/backup_archieve/get_time_series/resolution1km/extracted_ts/'
filelist = []
failedlist = []

os.chdir(item_dir)
for Names in os.listdir(item_dir):
    if Names.startswith('point_'):
        filelist.append(Names)
#%%
for file in filelist:
    df = pd.read_csv(file,sep = '\t+',usecols=[0,1],names=['DecimalYear','U'],skiprows=0, engine='python')
    lowess = sm.nonparametric.lowess
    t = df.loc[:,'DecimalYear'].values.reshape(-1)
    u = df.loc[:,'U'].values.reshape(-1)
    np.seterr(invalid='ignore')
    #print (u)
#%%
    try:
        wu = lowess(u, t, frac=1/10, it = 2)                       #Z-axis Lowess scatter
        lowess_u = wu[:,1]
        lowess_tu = wu[:,0]
        fu = interp1d(lowess_tu, lowess_u, bounds_error=False)
        u_LOWESS = fu(t)

#%%
    except ValueError:
        print (str(file) + ' ' + 'has problem')
        failedlist = open('Failed_List.txt', 'a')
        failedlist.write(file + '\n')
        pass

    
    df1 = pd.DataFrame(u_LOWESS, columns = ['ulowess'])

    frames = [df, df1]
    #print (frames)


    Newdf = pd.concat(frames, axis=1, join='inner')              #T U u_residual

    #     print (Newdf)
#%%
    # Newdf = Newdf.fillna(0)

    # df_outlier_removed = Newdf.loc[(Newdf['eresidual'] > -4.5*emad) & (Newdf['eresidual'] < 4.5*emad) & (Newdf['nresidual'] > -4.5*nmad) & (Newdf['nresidual'] < 4.5*nmad) & (Newdf['uresidual'] > -4.5*umad) & (Newdf['uresidual'] < 4.5*umad)]
    
    Newdf.to_csv('LOWESS_' + str(file), index=False, header=None, sep=" ")


