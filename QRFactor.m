function [Q R] = QRSolve(A)
    [m,n] = size(A);
    R = A;
    Q = eye(m);
    for i = 1:m-1
        x = R(:,i)
        c = norm(x(i:m),1)
        y = [x(1:i-1)' c zeros(1,m-i)]'
        n=norm(x-y,1)
        if(norm(x-y) == 0)
            w = zeros(1,m)'
        else
            w = (x-y)/norm(x-y,1)         
        end
        Q = Q - (Q * (2 * w)) * w'         
        R = R - (2 * w) * (w' * R) 
    end
    Q
    R
    Q*R
    
    
    %x=R\Q'*b;   %O(m^2)w
end

