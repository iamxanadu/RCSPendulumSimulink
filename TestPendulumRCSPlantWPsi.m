% This script implements a unit test for the PendulumRCSPlant model. Three
% animated graphs should be produced, each for a different combinations of
% forces exerted on the pendulum.

clc;
close all;
GenPendulumParams

% Forces to excite pendulum with
F_scale = 3; % Force scaling factor for larger responses
Fe = F_scale*M*[1 1 1; 0 1 1]; % N

% Delay times for the forces
Delay = [0 0 0; 0 0 0.5];

for i = 1:length(Fe)
    Fx = Fe(1, i);
    Fy = Fe(2, i);
    Delayx = Delay(1, i);
    Delayy = Delay(2, i);
    
    rcs_sim = sim("PendulumRCSPlantWPsi", 'SimulationMode', 'normal', 'StopTime', '10');
    figure(i);
    curve = animatedline('LineWidth', 2);
    set(gca, 'XLim', [-L, L], 'YLim', [-L, L], 'ZLim', [-L, L]);
    view(45, 45);
    hold on
    Xe = rcs_sim.Xe.Data;
    T = gradient(rcs_sim.Xe.Time);
    for j = 1:length(Xe)
        addpoints(curve, Xe(j,1), Xe(j,2), Xe(j,3));
        head = scatter3(Xe(j,1), Xe(j,2), Xe(j,3), 'filled', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'r');
        drawnow;
        %pause( T(j) )
        
        delete(head);
    end
    hold off
end



