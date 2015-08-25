% GMRES
% Estimates a solution to a system of linear equations 
% by performing n iterations of the Arnoldi Method
% Input: 
% A - coefficient matrix
% b - right hand side vector
% n - number of iterations to perform
%
% Output:    
% x - estimation of the solution
function [x] = GMRES(A, b, n)
%perform n iterations of the Arnoldi Method
[Q, S] = ArnoldiMethod(A,b,n);

%calculate tilb
tilb=zeros(n+1,1);
tilb(1)=norm(b);

%solve the least squares system
a=S\tilb;

%calculate x
x=Q*a;
end
