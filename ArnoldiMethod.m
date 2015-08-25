% ArnoldiMethod
% Performs n iterations of the Arnoldi Method
% 
% Input:
% A - sqaure matrix to iterate on
% b - intial vector
% n - number of iterations to perform
%
% Output:   
% Q - mxn matrix
% S - (n+1)xn matrix
function [Q, S] = ArnoldiMethod(A, b, n)
%set the first column of Q
Q(:,1) = b/norm(b);

%for the given number iterations
for i=1:n
    %set the ith column of Q
    v = A*Q(:,i);
    
    %set the values of S
    for j=1:i
        S(j,i) = Q(:,j)'*v;
        
        %update v
        v = v-S(j,i)*Q(:,j);
    end
    S(i+1,i) = norm(v);
    
    if i < n
        %set the (i+1)th column of Q
        Q(:,i+1) = v/S(i+1,i);
    end
end
end
