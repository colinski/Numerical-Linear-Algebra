% LUFactor
% Factorizes a square matrix A into a lower trianglur matrix L and
% an upper trianglur matrix U, such that A = L*U.
% Input:    A (square matrix to be factored)
%
% Output:   L (lower trianglur matrix)
%           U (upper trianglur matrix)
function [L, U] = LUFactor(A)
%calculate the order of A
m=length(A(1,:));

%for each row of A
for i=1:m-1
    %For each row under the ith row
    for j=i+1:m
        %calculate the pivoting factor and store it in the lower
        %triangaluar portion of A
        A(j,i)=A(j,i)/A(i,i);
        for k=i+1:m
            %process the upper triangular portion of A
            A(j,k)=A(j,k)-A(i,k)*A(j,i);
        end
    end
end
%extract the upper and lower trinagluar portions of A
L = tril(A,-1) + eye(m);
U = triu(A);
end
