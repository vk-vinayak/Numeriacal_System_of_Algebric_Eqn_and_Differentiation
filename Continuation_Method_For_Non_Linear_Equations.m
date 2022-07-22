%This code solves sytem of non linear equations using continuation method
function continuation_method
x1=input('Enter intial gues for x1  ');
x2=input('Enter intial gues for x2  ');
x3=input('Enter intial gues for x3  ');
delta_x=[1,1,1];
x=[x1,x2,x3];
m=0;
theta=0.9;

while max(abs(delta_x))>10^-4 && theta>0.01
 
a(1,1)=3;
a(1,2)=x(3)*sin(x(3)*x(2));
a(1,3)=x(2)*sin(x(2)*x(3));
a(2,1)=2*x(1);
a(2,2)=-162*(x(2)+0.1);
a(2,3)=cos(x(3));
a(3,1)=x(2)*exp(-x(1)*x(2));
a(3,2)=x(1)*exp(-x(1)*x(2));
a(3,3)=20;

c(1)=0.5+cos(x(2)*x(3))-3*x(1);
c(2)=81*(x(2)+0.1).^2-sin(x(3))-1.06-x(1)^2;
c(3)=-exp(-x(1)*x(2))-20*x(3)+(3-10*pi)/3;
c=c-theta*c;
[delta_x]=gauss_elimination(a,c);
x=delta_x+x;
m=m+1;
theta=theta-0.02;
end
x
m


end
function [x]=gauss_elimination(a,c)
[a,c]=pivote(a,c);

[a,c]=uppertriangular(a,c);

[x]=back(a,c);

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
