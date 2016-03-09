function [varargout]=Euclid(varargin)
if nargin==1
    N=varargin{1};
% Взаимно-простые числа
varargout{1}=find(gcd(1:(N-1),N)==1);
else
    N=varargin{2};
    a=varargin{1};
    
    X=[0;1;N];
    Y=[1;0;a];
    count=1;
    while X(3)~=1
        q=floor(X(3)/Y(3));
    Z=X-q*Y;
    X=Y;
    Y=Z;
    if count>500
    break;
    else
    count=count+1;
    end
    end
    varargout{1}=X(1);
    
end

