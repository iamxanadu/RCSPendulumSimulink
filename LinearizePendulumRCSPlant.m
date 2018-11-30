clc;
GenPendulumParams

% These just need to exist. They are not used for this process.
i = 1;
Fx = 0;
Fy = 0;
Delayx = 1;
Delayy = 1;

% Get linearized parameters
mdl = "ModelLinearizePendulumRCSPlant";
io = getlinio(mdl);
linsyspendulum = linearize(mdl, io);

% Calculate gain for full-state feedback using pole-placement
% poles = [-3 + 3i; -3 - 3i; -3 + 3i; -3 - 3i];
% K = place(linsyspendulum.A, linsyspendulum.B, poles)
% 
% % Check placements
% eig(linsyspendulum.A - linsyspendulum.B*K)
% 
%  nss = ss(linsyspendulum.A - linsyspendulum.B*K, zeros(size(linsyspendulum.B)), linsyspendulum.C, linsyspendulum.D);
%  damp(nss)

 % Calculate gain using lqr
 
 % Max state values
 xmax = [pi/4, pi/4, 1, 1]; % [rad, rad, rad/s, rad/s]
 
 % Max control inputs
 umax = [80, 80, 1]; % [N, N, N]
 
 % State weights
 alpha = [0.5, 0.5, 5, 5];
 
 % Input weights
 beta = [1, 1, 0.01];
 
 % normalize weights
 alpha = alpha./norm(alpha);
 beta = beta./norm(beta);
 
 % Overal weight
 rho = 0.5;
 
 % construct bryson's Q and R
 Q = diag( (alpha.*alpha)./(xmax.*xmax) );
 R = rho * diag( (beta.*beta)./(umax.*umax) );
 
 K_lqr = lqr(linsyspendulum.A, linsyspendulum.B, Q, R);
 
 K = K_lqr;
 
 