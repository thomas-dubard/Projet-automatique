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

%kn2 = 10;
%k2 = mul*(-c*NBar*kn2)/(1 - c*hBar);
%kd2 = mul*k2/kn2;
kn2 = sqrt(6);
k2 = -(3 + 5*sqrt(6))/75;
kd2 = -(1 + 10*sqrt(6))/25;
kr2 = k2 + (kn2 * c * NBar) / (1 - c * hBar);


A2 = - 1 / (epsilon2 * Td2);
B2 = [ 1/(epsilon2 * Td2) 0 0];
C2 = kd2 / epsilon2;
D2 = [ -k2-kd2/epsilon kr2 -kn2];