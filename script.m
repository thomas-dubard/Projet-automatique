clear, clc;

%% Variables
a = 1.0;
b = 2.5;
c = 0.1;

%% Linéarisation
hBar = 0;
qBar = 0;
NBar = a * (1 + c*hBar) / b;
stateBar = [ hBar; qBar; NBar ];
uBar = 0;

%% Correcteur PD
epsilon = 10;
Td = 1e-2;

kd = 1e-3;
k = -0.1;
kr = k;

A = - 1 / (epsilon * Td);
B = [ 1/(epsilon * Td) 0 ];
C = kd / epsilon;
D = [ -k-kd/epsilon kr ];

%% Correcteur PD2
epsilon2 = 10;
Td2 = 1e-2;
mul = 1.1;

d1amp = -0.02;
d2amp = 0.04;

a1 = 160;
a2 = 60;
a3 = -100;

kn2 = a1;
k2 = -(a1*b*b*NBar + a3)/(b*(1 - c*hBar));
kd2 = -(b*c*NBar + a2)/(b*(1 - c*hBar));
kr2 = k2 + (kn2 * c * NBar) / (1 - c * hBar);

if (kn2<0);
    disp(1);
end;
if (kd2*kn2>k2);
    disp(2);
end;
if (k2/kn2>-c*NBar/(1-c*hBar));
    disp(3)
end;

A2 = - 1 / (epsilon2 * Td2);
B2 = [ 1/(epsilon2 * Td2) 0 0];
C2 = kd2 / epsilon2;
D2 = [ -k2-kd2/epsilon kr2 -kn2];