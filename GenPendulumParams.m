%Generate parameters for a cylinder on a spherical pendulum

% Mass M
M = 1.79; % kg

% Pendulum string length L
L = 3; % m

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

h = 0.1; % s
d = 80; % N
tau = 0.101;




