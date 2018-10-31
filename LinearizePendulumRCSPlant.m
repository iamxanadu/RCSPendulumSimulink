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

% Calculate gain for full-state feedback
poles = [-3 + 3i; -3 - 3i; -3 + 3i; -3 - 3i];
K = place(linsyspendulum.A, linsyspendulum.B, poles)

% Check placements
eig(linsyspendulum.A - linsyspendulum.B*K)

 nss = ss(linsyspendulum.A - linsyspendulum.B*K, zeros(size(linsyspendulum.B)), linsyspendulum.C, linsyspendulum.D);
 damp(nss)
