require("rstan")
require("loo")
require("bayesplot")
require("ggplot2")

alldata=read.csv(file="alldata.csv",header = TRUE)

y_monthrtn = alldata$S
y_monthrtn=y_monthrtn-mean(y_monthrtn)
x = alldata[,3:8]


blmmodel_data <- list(
  N = length(y_monthrtn),
  y = y_monthrtn,
  x1 = alldata[,3],
  x2 = alldata[,4],
  x3 = alldata[,5],
  x4 = alldata[,6],
  x5 = alldata[,7],
  x6 = alldata[,8]
)

niter=1000
nchains=4

#options(mc.cores = parallel::detectCores())

TVP_Blm_model <- stan_model("TVP_Blm.stan")

TVP_Blm_mod <- sampling(TVP_Blm_model, data= blmmodel_data, iter = niter, chains = nchains)

para1=as.data.frame(TVP_Blm_mod@sim$samples[[1]])
dim(para1)

a=as.data.frame(TVP_Blm_mod, pars = "alpha")
a_median=apply(a,2,median)
a_median #截距
plot(ts(a_median))

b1=as.data.frame(TVP_Blm_mod, pars = "beta1")
dim(b1)
b1_median=apply(b1,2,median)
b1_median
plot(ts(b1_median))

b2=as.data.frame(TVP_Blm_mod, pars = "beta2")
dim(b2)
b2_median=apply(b2,2,median)
b2_median


b3=as.data.frame(TVP_Blm_mod, pars = "beta3")
dim(b3)
b3_median=apply(b3,2,median)
b3_median


b4=as.data.frame(TVP_Blm_mod, pars = "beta4")
dim(b4)
b4_median=apply(b4,2,median)
b4_median


b5=as.data.frame(TVP_Blm_mod, pars = "beta5")
dim(b5)
b5_median=apply(b5,2,median)
b5_median

b6=as.data.frame(TVP_Blm_mod, pars = "beta6")
dim(b6)
b6_median=apply(b6,2,median)
b6_median

print(TVP_Blm_mod, pars = c("alpha", "beta1", "beta2","beta3","beta4","beta5","beta6","sigma"))

para_stan=summary(TVP_Blm_mod,pars=c("alpha", "beta1", "beta2","beta3","beta4","beta5","beta6","sigma"), probs=c(.05,.50,.95))
para_stan$summary

Empirical_ncp_keep_pars = c("alpha", "beta1", "beta2","beta3","beta4","beta5","beta6","sigma")
Empirical_ncp_posterior = as.array(TVP_Blm_mod, pars = Empirical_ncp_keep_pars)

mcmc_dens(Empirical_ncp_posterior, pars = Empirical_ncp_keep_pars,facet_args = list(nrow = 1))
mcmc_pairs(Empirical_ncp_posterior, pars =Empirical_ncp_keep_pars)


