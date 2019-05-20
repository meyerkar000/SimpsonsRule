%Lab 10
%Kara Meyer
%5-5-2019
%Find the change in gravitational potential energy of a satellite raised
%from the surface of the Earth by finding the integral using Simpsons Rule

%ChangeU=Integral[mass*GravityFunction*dy] over the bounds y=0 to y=height

clear all;

%Define constants 
R=6371; %(km) Radius of Earth
g0=9.81; %(m/s^2) Gravity of Earth
m=500; %(kg) Mass of satellite
h=800; %(km) Height the satellite is raised

%Define your function of gravitational acceleration, g, with altitude, y
func=@(y) R^2/(R+y)^2*g0;

%Define your bounds and ask the user for the amount of sections
disp('How many area sections would you like to add?');
N=input('The more sections, the more accurate: ');
a=0; %Lower bound
b=h; %Upper bound

%Call the function and give your results
[area]= SimpsonsInt(func,N,a,b);
Uchange=m*area;
formatSpec =('The change in gravitational potential energy is %4.2f Joules.');
fprintf(formatSpec,Uchange)

function [area]= SimpsonsInt(func,N,a,b)

    width=(b-a)/N;
    areaSum1=0;
    areaSum2=0;

    for i=1:2:N-1
        areaSum1=areaSum1+func(a+i*width);
    end
    for j=2:2:N-2
        areaSum2=areaSum2+func(a+j*width);
    end
    
    area=(width/3)*(func(a)+func(b)+4*areaSum1+2*areaSum2);
    
end