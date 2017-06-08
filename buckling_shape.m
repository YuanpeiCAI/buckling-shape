clear; clc;

% buckling shape
 
% -----------------------------parameter-----------------------------------
% modulus of elasticity (Pa)
E=40*10^9;
% lenth/depth (m)
l=0.1;
% width (m)
b=0.005;
% height (m)
h=0.002;
% flexual rigidity (N*m^2)
EI=12*b*h^3/12*E;
% area (m^2)
A=b*h;
% displacement of end point (m)
a=0.005;
% counting number
i=1;
% spacing of end point displacment
spacing=0.001
% maximum distance to satisfy moderately large deflection
a_max=0.03;
format long;

% % estimate transcendental euqation by figure
% i=-pi:0.001:pi;
% plot(i,nxxf(i))
% hold on;
% plot(i,i)


figure(1)
% beta is solution of transcendental equation
beta=fsolve(@nxxf,2);
% lambda is sqrt(F_x/EI)
lambda=beta/(l-a);
% F_x is axis force at the end-point
F_x=lambda^2*EI;
% F_y is shear force at the end-point (assuming it points down)
F_y=-sqrt((a-F_x*l/(E*A))/(beta^2/(2*F_x^2*sin(beta)^2)...
    *(sin(beta)*cos(beta)/(2*lambda)+(l-a)/2)-(l-a)/(2*F_x^2)));
% C_1 and C_3 is shape parameter
C_1=F_y*(l-a)/(F_x*sin(beta));
C_3=-F_y/F_x;
% v(x)=C_1*sin(lambda*x)+C_3*x;
n=0:0.000001:(l-a);
plot(n,v(n,lambda,C_1,C_3))



figure(2)
a=0;
while(a<a_max)
    % beta is solution of transcendental equation
    beta=fsolve(@nxxf,2);
    % lambda is sqrt(F_x/EI)
    lambda=beta/(l-a);
    % F_x is axis force at the end-point
    F_x=lambda^2*EI;
    % F_y is shear force at the end-point (assuming it points down)
    F_y=-sqrt((a-F_x*l/(E*A))/(beta^2/(2*F_x^2*sin(beta)^2)...
        *(sin(beta)*cos(beta)/(2*lambda)+(l-a)/2)-(l-a)/(2*F_x^2)));
    % C_1 and C_3 is shape parameter 
    C_1=F_y*(l-a)/(F_x*sin(beta));
    C_3=-F_y/F_x;
    % v(x)=C_1*sin(lambda*x)+C_3*x;
    n=0:0.000001:(l-a);
    plot(n,v(n,lambda,C_1,C_3))
    hold on
    a=a+spacing;
end
axis equal




























