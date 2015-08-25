% PowerMethod
% Finds the dominant eigenvalue and its coorspending eigenvector of a
% matrix within a certain a range of error using the Power Method 
%
% Input: 
% A - square matrix assumed to have one dominant eigenvalue
% err - desired range of error          
%
% Output:    
% l - the eigenvalue
% v - the normalized eigenvector
function [l, v] = PowerMethod(A, err)
%calculate the order of A
m = length(A(1,:));

%start with v0 as a random vector
vk = rand(m,1);

%calculate v1
vkplus1 = A*vk;

%calculate the first estimate of lambda
l = dot(vk,vkplus1)/dot(vk,vk);

%calculate the error of this estimate
e = norm(vkplus1-l*vk)/norm(vkplus1);

%while the error is too large
while e > err
    %update vk
    vk = vkplus1;
    
    %calculate the new vk+1
    vkplus1 = A*vk;
    
    %update the estimation lambda
    l = dot(vk,vkplus1)/dot(vk,vk);
    
    %update the error
    e = norm(vkplus1-l*vk)/norm(vkplus1);
end
%return a normalized eigenvector
v = vkplus1/norm(vkplus1);
end

