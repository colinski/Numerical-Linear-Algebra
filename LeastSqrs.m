% LeastSqrs
% Solves over- and underdetmered least sqaures systems via normal equations
%
% Input:    
% A - square coefficient matrix
% b - right hand side of the equation
%
% Output:   
% x - least squares solution to the system
function [x] = LeastSqrs(A, b)
%calculate the order of A
[m,n] = size(A);

%overdetermined
if m > n
    x = QRSolve(A'*A, A'*b);
end

%underdetermined
if m < n
    t = QRSolve(A*A', b);
    x = A'*t;
end

%if the matrix is square, solve as usual
if m == n
    x = QRSolve(A, b);
end
end
