% Lab #6, , problem 2, more general approach
% It is thought that the gas mileage obtained by a particular model of 
% automobile will be higher if unleaded premium gasoline is used in the 
% vehicle rather than regular unleaded gasoline. To gather evidence in 
% this matter, 10 cars are randomly selected from the assembly line and 
% tested using a specified brand of premium gasoline; 10 others are 
% randomly selected and tested using the brand's regular gasoline. Tests 
% are conducted under identical controlled conditions and gas mileages 
% for both types of gas are assumed independent and (approximately) 
% normally distributed. These data result:
%   Premium            Regular
% 22.4  21.7    !    17.7  14.8 
% 24.5  23.4    !    19.6  19.6 
% 21.6  23.3    !    12.1  14.8 
% 22.4  21.6    !    15.4  12.6 
% 24.8  20.0    !    14.0  12.2  
% Let 0 < alpha < 1.
% a. At the alpha significance level, is there evidence that the variances
% of the two populations are equal?
% b. Based on the result in part  a., at the same significance level, 
% does gas mileage seem to be higher, on average, when premium gasoline 
% is used?

clear all


x1 = [46, 37, 39, 48, 47, 44, 35, 31, 44, 37];
x2 = [35, 33, 31, 35, 34, 30, 27, 32, 31, 31];

n1 = length(x1); n2 = length(x2);
alpha = input('significance level alpha = ');
m1 = mean(x1); m2 = mean(x2);
v1 = var(x1); v2 = var(x2); 

f1 = finv(alpha/2, n1 - 1, n2 - 1);
f2 = finv(1 - alpha/2, n1 - 1, n2 - 1); % quantiles for two-tailed test (for rejection region)

% part a. 
% The null hypothesis H0: sigma1^2 = sigma2^2
% The alt. hypothesis H1: sigma1^2 ~= sigma2^2
% two-tailed for comparing the variances
[H, P, CI, stats] = vartest2(x1, x2,"alpha",alpha);


fprintf('\n part a. Comparing variances\n')
fprintf('Two-tailed test for comparing variances\n')
if H==0
    fprintf('H is %d\n', H)
    fprintf('So the null hypothesis is not rejected,\n')
    fprintf('i.e. the variances seem to be equal\n')
    fprintf('the rejection region for F is (%6.4f, %6.4f) U (%6.4f, %6.4f)\n', -inf, f1, f2, inf)
    fprintf('the value of the test statistic F is %6.4f\n', stats.fstat)
    fprintf('the P-value for the variances test is %6.4f\n', P)
    
else
    fprintf('h is %d\n', H)
    fprintf('So the null hypothesis is rejected,\n')
    fprintf('i.e. the variances seem to be different\n')
    fprintf('the rejection region for F is (%6.4f,%6.4f)U(%6.4f,%6.4f)\n', -inf, f1, f2, inf)
    fprintf('the value of the test statistic F is %6.4f\n', stats.fstat)
    fprintf('the P-value for the variances test is %6.4f\n', P)

end

m56 = mean(x1) - mean(x2);
samp_std1 = std(x1);
samp_std2 = std(x2);
c = (samp_std1*samp_std1/n1)/(samp_std1*samp_std1/n1 + samp_std2*samp_std2/n2)
n = 1/(c*c/(n1-1)+(1-c)*(1-c)/(n2-1));
tt = tinv(1-alpha/2, n);
samp2 = sqrt(samp_std1*samp_std1/n1 + samp_std2*samp_std2/n2);
int1= m56 - tt * samp2;
int2 = m56 + tt * samp2;
fprintf('intervalele sunt astea de le am calculat: (%6.4f, %6.4f)\n', int1, int2)  







