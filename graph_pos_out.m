% Run the simulation
rcs_sim = sim("PendulumRCSPlant", 'SimulationMode', 'normal', 'StopTime', '10');

t = rcs_sim.Xe.Time;

% Graph the resulting position of the pendulum bob
figure(5);
plot3(rcs_sim.Xe.Data(:,1), rcs_sim.Xe.Data(:,2), rcs_sim.Xe.Data(:,3));
