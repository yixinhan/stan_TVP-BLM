# stan_TVP-BLM
Bayesian regression with time-varying parameters in stan，采用时变参数贝叶斯回归(TVP-BLM)的方法计算汇率影响因子的系数值，系数是时变的；

时变参数贝叶斯回归(TVP-BLM)的方法采用stan工具；

文件TVP_Blm.stan是TVP-BLM的主模型文件；  

文件TVP_Blm.R是采用R语言编译TVP_Blm.stan文件，并进行MCMC抽样计算得到汇率影响因子的系数值；  

图片b1_median.png是经过TVP-BLM模型的计算，得到的短期利率（月度数据）对汇率（月度数据）的时变系数值，median指1000次抽样得到的中位数；  

200多条数据，一条链大概计算60s；  

