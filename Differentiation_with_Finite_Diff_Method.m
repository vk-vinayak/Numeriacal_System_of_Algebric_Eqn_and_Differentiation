%This code performs first order and second order differentiation of a
%function using central, forward & backward finite difference method at
%x=0.5 & 1.5. It also outputs a graph which compares central & forward
%difference method's numeric error variation with step size h.
function a3q2
format long
clc;
clear;
fprintf('\n Enter x  ');
x=input('');
h=0.3;
i=1;
while h>=0.00001
if (x==0.5)
   yc1=-4.25;
   yc2=3;
elseif (x==1.5)
    yc1=1.75;
    yc2=9;
end
 fprintf('\n h        Method      first der      Error1      Second der      Err2');
%Forward
y1=del_f(x,h,0);
y2=del2_f(x,h,0);
err1=abs((y1-yc1)/yc1);
Ef(i)=err1;
err2=abs((y2-yc2)/yc2);
Ef2(i)=err2;
fprintf('\n %f   Forward: %f     %f    %f    %f',h,y1,err1,y2,err2);
fprintf('\n');
%Central
y1=del_f(x,h,1);
y2=del2_f(x,h,1);
err1=abs((y1-yc1)/yc1);
Ec(i)=err1;
err2=abs((y2-yc2)/yc2);
Ec2(i)=err2;
fprintf('\n %f    Central: %f     %f    %f    %f',h,y1,err1,y2,err2);
fprintf('\n');
%Backward
y1=del_f(x,h,2);
y2=del2_f(x,h,3);
err1=abs((y1-yc1)/yc1);
Eb(i)=err1;
err2=abs((y2-yc2)/yc2);
fprintf('\n %f   Backward: %f     %f    %f    %f',h,y1,err1,y2,err2);
fprintf('\n');
if h>0.1
    h=h-0.1;
else
    h=h/10;
end
i=i+1;
end
h=[0.3 0.2 0.1 0.01 0.001 0.0001];
%Plotting Graph of first derivative error
plot(h,Ef,'r:o',h,Ec,'k-x');
title('Variation of Error with h');
legend('forward-diff','central-diff');
xlabel('Step size(h)');
ylabel('Relative numeric error');
end
%Function to give first order derivative
function y1=del_f(x,h,s)
x=x-h*s;
y1= (1/h)*(f(x+h)-f(x)+(s-0.5)*(f(x+2*h)-2*f(x+h)+f(x)) );
end
%Function to give second order derivative
function y2=del2_f(x,h,s)
x=x-h*s;
y2=(1/(h^2))*(f(x+2*h)-2*f(x+h)+f(x)+(s-1)*(f(x+3*h)-3*f(x+2*h)+3*f(x+h)-f(x)));
end
function y=f(x)
y=x^3-5*x;
end