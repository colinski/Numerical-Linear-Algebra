% FunctionApprox
% Approximates a function in one variable as a k degree polynomial
%
% Input:
% f - symbolic MATLAB expression that represents a function
% k - degree of the polynomial to estimate
% [a,b] - range to estimate over
% m - number of linearly spaced points to estimate over
%
% Output:   
% p - Column vector that holds the coefficients of the generated polynomial
% (Where p(i) is the coefficient of the x^(i-1) term)
function [p] = FunctionApprox(f, k, a, b, m)
%generate m linearly spaced points over [a,b]
T = linspace(a, b, m)';
f = subs(f,sym('t'));

%build a matrix A where each column is T to 1st,2nd,...,kth power
for i=1:k+1
    A(:,i) = (T.^(i-1))';
end

%evaluate f at all m points and save these values in a vector tilf
for i=1:m
    t = T(i);
    tilf(i) = eval(f);
end

%Solve the resulting least squares system
p = LeastSqrs(A,tilf');
end
