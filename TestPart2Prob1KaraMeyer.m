%Part 2 Question 1: Heat Capacity
%Kara Meyer
%5-20-2019
%This program uses Simpson's rule to determine the area under the curve to
%solve for heat capacity of an aluminum sample

%Define our constants
k=1.38064852*10^-23; %(m^2*kg/(s^2*K)) Boltzmann's constant
V=.001; %(m^3) Volume of the solid
p=6.022*10^28; %(1/m^3) density of atoms
debye=428; %(K) Debye tempurature 
N=100; %Sample points
T=5:500; %(K) Tempurature of the solid

%Create blank matrices to put values into
Cv=zeros([1,length(T)]);

%Test every tempurature value from 5K to 500K
for t=5:500 %(K) Tempurature of the solid

    %Define what part of our equation we are integrating 
    integrate=@(x) x^4*exp(x)/((exp(x)-1)^2);

    %Define the upper and lower bounds
    lower=10^-10;
    upper=debye/t;

    %Call the Simpsons Rule function
    [area]= SimpsonsInt(integrate,N,lower,upper);

    %Find our heat capacity
    Cv(t-4)=9*V*p*k*(t/debye)^3*area; %(J/K) Heat capacity

end

%Plot the Data
figure();
plot(T,Cv,'.');
axis([5 500 0 2.5*10^3]);
ylabel('Heat Capacity (J/K)');
xlabel('Tempurature (K)');
title('Heat Capacity of Aluminum as Tempurature Increases');

%This fucntion finds the area under the curve using Simpson's Rule
function [area]= SimpsonsInt(func,N,a,b)

    %Define the width of each section
    width=(b-a)/N;

    %Define your sum variables and start them at zero
    areaSum1=0;
    areaSum2=0;

    %Calculate your areaSum1 which is a part of the total area equation
    for i=1:2:N-1
        areaSum1=areaSum1+func(a+i*width);
    end
    %Calculate your areaSum2 which is a part of the total area equation
    for j=2:2:N-2
        areaSum2=areaSum2+func(a+j*width);
    end
    
    %Use the sums calculated and the function to find the area under the
    %curve
    area=(width/3)*(func(a)+func(b)+4*areaSum1+2*areaSum2);
    
end