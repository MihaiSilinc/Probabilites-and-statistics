clear
alpha = 0.05;

x = [1001.7, 975.0, 988.3, 978.7, 988.9, 1000.3, 979.2, 968.9, 983.5, 999.2, 985.6];
n = length(x);

% a)
% The null hypothesis H0: mu = 995
% the alt. hypothesis H1: mu > 995. This is a right-tailed test for mu.
m0b = 995;
[H, P, CI, stats] = ttest(x,m0b,"alpha",alpha,"tail","right");

fprintf('\n H is %d', H)

if H==1
    fprintf('\n So the null hypothesis is rejected,\n') 
    fprintf('i.e. the data suggests that the average exceeds 995m/s.\n')
else
    fprintf('\n So the null hypothesis is not rejected,\n')
    fprintf('i.e. the data suggests that the average DOES NOT exceed 995m/s.\n')
    
end

% b)
alpha2 = 0.01;
v = var(x);
q1 = chi2inv(1 - alpha2/2, n - 1);
q2 = chi2inv(alpha2/2, n - 1); % here we need BOTH quantiles, there's no more symmetry
v1 = (n - 1) * v/q1; v2 = (n - 1) * v/q2;
s1 = sqrt(v1); s2 = sqrt(v2);
fprintf('b) conf. interval for st. deviation (s1, s2) = (%4.3f, %4.3f)\n\n', s1, s2)