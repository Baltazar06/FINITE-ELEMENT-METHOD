%Matlab code
clc,
clear,
clear all
F=100;%N
L=102; %mm
a=10; %mm
E=200; %GPa
%Analytic Result
S=s(L,a,a,E,L,F);
%Ansys Results
S_PD=0.2751; %mm
S_3D=0.2734; %mm
S_2D=0.2737; %mm
S_1D=0.2752; %mm

%Error Calc
e_PD=e(S_PD,S);
e_3D=e(S_3D,S);
e_2D=e(S_2D,S);
e_1D=e(S_1D,S);
formatSpec = 'Error for Methods solid elements: %4.2f%%\n'
% shell elements: %4.2f%%\nError for 1D 3 noded beam elements: %4.2f%%\n';
fprintf(formatSpec,e_3D,e_2D,e_1D,e_PD);
%Analytical Calculation Function
function s=s(x,a,b,E,L,F)
Ix=(1/12)*a*(b^3); %mm4 - Inertia
s=(F*(x^2)/(6*(E*1000)*Ix))*(3*L-x); %E is multiplied by 1000 for GPaMPa unit transformation.
formatSpec = 'Deformation at the force-end of the beam by Analytical'
% solution: 8.8f mm\n';
fprintf(formatSpec,s);
end
%Error Function
function e=e(x,y)
e=abs(((x-y)/y))*100;
end 
