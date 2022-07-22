%This code solves system of linear algebric equations using
%Thomas Algorithm.This algorithm is also known as Tri-Diagonal Matric
%Algorithm (TDMA)
function thomas_copy
clc;
clear;

[a,b,c,d]=readeqn;
[b,d]=tdma(a,b,c,d);
[x]=back(b,c,d);
x'
end
function [a,b,c,d]= readeqn
n=input('No of eqn');
fprintf('\n Note:b is the diagonal element')
for i=1:n
    if (i==1)
        fprintf('\n b(%d)= ',i)
        b(i)=input('');
        fprintf('\n c(%d)= ',i)
        c(i)=input('');
    
    elseif i==n
        fprintf('\n a(%d)= ',i)
        a(i)=input('');
        fprintf('\n b(%d)= ',i)
        b(i)=input('');
    else
        fprintf('\n a(%d)= ',i)
        a(i)=input('');
        fprintf('\n b(%d)= ',i)
        b(i)=input('');
        fprintf('\n c(%d)= ',i)
        c(i)=input('');
    
    end
        fprintf('\n d(%d)= ',i)
        d(i)=input('');
         
end

end
function [b,d]=tdma(a,b,c,d)
n=length(b);
for i=2:n
    m=a(i)/b(i-1);

    b(i)=b(i)-m*c(i-1);
    d(i)=d(i)-m*d(i-1);
end
end
function [x]=back(b,c,d)
n=length(b);
x(n)=d(n)/b(n);
for i=n-1:-1:1
    x(i)=(d(i)-c(i)*x(i+1))/b(i);
end
end