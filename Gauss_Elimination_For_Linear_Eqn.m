%This code solves system of linear algebric equations using gauss
%elimination method
function gauss_elimination
clc;
clear;
[a,c]=readeqn;
showmatrix(a);
[a,c]=pivote(a,c);
showmatrix(a);
[a,c]=uppertriangular(a,c);
showmatrix(a);
[x]=back(a,c);
showmatrix(x);
end
function [a,c]=readeqn
n=input('No of eqn');
for i=1:n
    for j=1:n
        fprintf('\n a(%d %d)',i,j);
        a(i,j)=input('');
    end
    fprintf('\n c(%d)',i);
    c(i)=input('');
end
end
function[a,c]=pivote(a,c)
n=length(c);
for i=1:n-1
    for k=i+1:n
        if abs(a(k,i))>abs(a(i,i))
            for j=1:n
                temp=a(i,j);
                a(i,j)=a(k,j);
                a(k,j)=temp;
            end
            temp=c(i);
            c(i)=c(k);
            c(k)=temp;
        end
    end
end
end
function[a,c]=uppertriangular(a,c)
n=length(c);
for i=1:n-1
    for k=i+1:n
        temp=a(k,i)/a(i,i);
        for j=1:n
            a(k,j)=a(k,j)-temp*a(i,j);
        end
        c(k)=c(k)-temp*c(i);
    end
end
end
function[x]= back(a,c)
n=length(c);
for i=n:-1:1
    temp=c(i);
    for j=i+1:n
        temp=temp-x(j)*a(i,j);
    end
    x(i)=temp/a(i,i);
end
end
function showmatrix(a)
a
end