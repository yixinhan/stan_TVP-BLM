# stan_TVP-BLM
Bayesian regression with time-varying parameters in stan，采用时变参数贝叶斯回归(TVP-BLM)的方法计算汇率影响因子的系数值，系数是时变的；

时变参数贝叶斯回归(TVP-BLM)的方法采用stan工具；

文件TVP_Blm.stan是TVP-BLM的主模型文件；  

alldata.csv是从2006年8月至2023年12月的汇率S、利率i、CPI、货币供应量M1、产出y、产出增速g、通胀率π共200多条月数据；

文件TVP_Blm.R采用R语言解析TVP_Blm.stan模型文件，并进行MCMC抽样计算得到汇率影响因子的系数值；一共设置4条链抽样，一条链大概计算60s；  

图片b1_median.png是经过TVP-BLM模型的计算，得到的短期利率（月度数据）对汇率（月度数据）的时变系数值，median指1000次抽样得到的中位数；  



