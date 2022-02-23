%% ODEs from P2.32 - Mass-spring-damper system in Fig. 2.20(b)
% m_{1}\ddot{x_{1]}} + (b_{1} + b_{2})\dot{x_{1}} + (k_{1} + k_{2})x_{1} -
% b_{2}\dot{x_{2}} - k_{2}x_{2} = 0, and
% m_{2}\ddot{x_{2}} + b_{2}(\dot{x_{2}} - \dot{x_{1}}) +
% k_{2}(x_{2} - x_{1}) = f_{2}.
% where x_{1} and x_{2} are displacements and f_{2} is a force applied on
% the mass m_{2}. Let the force, f_{2}, be the input and let the
% displacement, x_{2}, be the ouput.

%% P5.26: Rewrite the differential equations in state-space form.
% For state variables z = [z_1; z_2; z_3; z_4] = [x_1; dx_1; x_2; dx_2]
A = [0, 1, 0, 0; -(k_1 + k_2)/m_1, -(b_1 + b_2)/m_1, k_2/m_1, b_2/m_1; 0, 0, 0, 1; k_2/m_2, b_2/m_2, -k_2/m_2, -b_2/m_2];
B = [0; 0; 0; 1/m_2];
C = [0, 0, 1, 0];
D = [0];

%% P5.26: Represent this system in a block-diagram using only integrators.
% Load the Simulink block-diagram
load_system('Problem5_26_BlockDiagram');
% Simulate the model
out = sim('Problem5_26_BlockDiagram');