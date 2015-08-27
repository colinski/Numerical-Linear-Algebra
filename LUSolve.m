% LUSolve
% Solves a square system of linear equations via LU factorization 
%
% Input:    
% A - square coefficient matrix
% b - right hand side of the equation
%
% Output:   
% x - solution to the system, such that A*x=b
function [x] = LUSolve(A, b)
%calculate the order of A
m = length(A(1,:));

%LU factor A
[L,U] = LUFactor(A);

%solve the lower trinaglur system Ly=b via forward substitution
y=zeros(m,1);
for i=1:m
    y(i)=(b(i)-L(i, :)*y)/L(i,i);
end

%solve the upper trinaglur system Ux=y via back substitution
x=zeros(m,1);
for i=m:-1:1
    x(i)=(y(i)-U(i,:)*x)/U(i,i);
end
end
