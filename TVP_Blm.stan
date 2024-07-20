data {
  int<lower=0> N;
  vector[N] x1;
  vector[N] x2;
  vector[N] x3;
  vector[N] x4;
  vector[N] x5;
  vector[N] x6;
  vector[N] y;
}
parameters {
  vector[N] alpha;
  vector[N] beta1;
  vector[N] beta2;
  vector[N] beta3;
  vector[N] beta4;
  vector[N] beta5;
  vector[N] beta6;
  vector<lower=0>[N] sigma; 
}


model {
  alpha ~ normal(0, 10);   
  beta1 ~ normal(0, 1);   
  beta2 ~ normal(0, 1); 
  beta3 ~ normal(0, 1); 
  beta4 ~ normal(0, 1); 
  beta5 ~ normal(0, 1); 
  beta6 ~ normal(0, 1); 
  sigma ~ exponential(1); 
  for (n in 1:N) {  
    y[n] ~ normal(alpha[n] + x1[n] * beta1[n] + x2[n] * beta2[n] + x3[n] * beta3[n]
      +x4[n] * beta4[n] + x5[n] * beta5[n] + x6[n] * beta6[n], sigma[n]);  
  }  
}