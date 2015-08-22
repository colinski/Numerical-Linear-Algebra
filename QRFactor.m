% QRFactor
% Factorizes a square matrix A into an orthogonal matrix Q 
% and an upper trianglur matrix R, such that A = Q*R.
%
% Input:
% A - square matrix to be factored
%
% Output:   
% Q - orthogonal matrix
% R - upper trianglur matrix
function [Q, R] = QRFactor(A)
%calculate the order of A
m = length(A(1,:));

%initialize R as a copy of A
R = A;

%initialize Q as the idenitiy matrix
Q = eye(m);

%for each row of A
for i = 1:m-1
    %calculate vectors x and y
    x = R(:,i);
    c = norm(x(i:m));
    y = [x(1:i-1)', c, zeros(1,m-i)]';
    
    %calculate a vector w which will be used for the Householder transformation
    if(norm(x-y) == 0)
        w = zeros(1,m)';
    else
        w = (x-y)/norm(x-y);
    end
    
    %apply the Householder transformation to Q and R
    Q = Q - (Q * (2 * w)) * w';
    R = R - (2 * w) * (w' * R);
end
end
