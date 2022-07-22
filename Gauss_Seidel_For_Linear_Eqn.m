%This code solves system of linear algebric equations using Gauss-Seidel
%Method
function gauss_seidel_new
clc;
clear;
[a,c,n]=readeqn;
[x]=readguess(n);
[a,c]=pivote(a,c);
[x]=iterate(a,c,x);
x'
end
function[a,c,n]=readeqn
n=input('No of eqn');
for i=1:n
    for j=1:n
        fprintf('\n a(%d %d)',i,j);
        a(i,j)=input('');
    end
    fprintf('\n c(%d)=',i);
    c(i)=input('');
end
end

function[x]=readguess(n)
%n=input('No of eqn');
for i=1:n
    fprintf('\n Initial guess x%d',i);
    x(i)=input('');
end
end

function [a,c]=pivote(a,c)
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
function [x]=iterate(a,c,x)
w=1.28;
k=1;
y=0;
b=1;
n=length(c);
acc=input('Enter accuracy');
while b&&k<101
    fprintf('\n    %d   ',k);
    for i=1:n
        temp=c(i);
        for j=1:n
            %if(j~=i)
                temp=temp-a(i,j)*x(j);
            %end
            
        end
        e(i)=(temp)/x(i)*a(i,i);
        x(i)=x(i)+w*temp/a(i,i);
        fprintf('%f     %f',x(i),e(i));
    end
    for i=1:n
        q=0;
        b=q||abs(e(i))>acc;    
    end    
    k=k+1;
end
end
