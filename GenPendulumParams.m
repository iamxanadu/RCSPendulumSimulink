%Generate parameters for a cylinder on a spherical pendulum

% Mass M
M = 1.79; % kg

% Pendulum string length L
L = 3; % m

% Torsional Pendulum Mode Params
k_tor = 1; % spring constant
rho_tor = 0.5; % damping
w0 = [0;0;0.05]; % rad/s

% Cylinder dimensions
% TODO Fill this in if needed. For now use measurements given.

% Moments of inertia for a cylinder about principle axes
Ixx = 0.014825125; % kg*m^2
Iyy = 0.014825125;
Izz = 0.002232841;

% Parralell axis calc for pendulum
Ixxp = Ixx + M*L^2;
Iyyp = Iyy + M*L^2;

% Inertia tensor
I = [Ixxp 0 0; 0 Iyyp 0; 0 0 Izz];

h = 0.05; % s
d = 80; % N
tau = 0.3;




