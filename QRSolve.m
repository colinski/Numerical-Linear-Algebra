% QRSolve
% Solves a square system of linear equations via QR factorization 
%
% Input:    
% A - square coefficient matrix
% b - right hand side of the equation
%
% Output:   
% x - solution to the system, such that A*x=b
function [x] = QRSolve(A,b)
%calculate the order of A
m = length(A(1,:));

%QR factor A
[Q,R] = QRFactor(A);

%Solve the resulting the upper triangular system, Rx = Q'b, via back substitution
b = Q'*b;
for i = m:-1:1
    x(i) = b(i);
    for j = i+1:m
        x(i) = x(i) - R(i,j)*x(j);
    end
    x(i)=x(i)/R(i,i);
end
x = x';
end
