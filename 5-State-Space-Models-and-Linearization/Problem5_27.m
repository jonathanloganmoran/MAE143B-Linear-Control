%% ODEs from P2.32 - Mass-spring-damper system in Fig. 2.20(b)
% m_{1}\ddot{x_{1]}} + (b_{1} + b_{2})\dot{x_{1}} + (k_{1} + k_{2})x_{1} -
% b_{2}\dot{x_{2}} - k_{2}x_{2} = 0,and
% m_{2}\ddot{x_{2}} + b_{2}(\dot{x_{2}} - \dot{x_{1}}) +
% k_{2}(x_{2} - x_{1}) = f_{2}.
% where x_{1} and x_{2} are displacements and f_{2} is a force applied on
% the mass m_{2}. Let the force, f_{2}, be the input and let the
% displacement, x_{2}, be the ouput.

%% Loading data from P5.27
% Output signal parameters
m_1 = 1;                        % kg
m_2 = m_1;                      % kg
b_1 = 0.1;                      % kg/s
b_2 = b_1;                      % kg/s
k_1 = 1;                        % N/m
k_2 = 2;                        % N/m
% Input signal parameters
f_2 = 1;                        % N
t = linspace(1, 100, 500);
u = f_2 * heaviside(t);
% Assuming zero initial conditions
x_1_init = 0;
x_2_init = 0;
% Saving data to MAT-file
save('Problem5_27');

%% P5.26: Represent this system in a block-diagram using only integrators.
% Load the Simulink block-diagram
load_system('Problem5_27_BlockDiagram');
% Simulate the model with data from P5.27
out = sim('Problem5_27_BlockDiagram');
% Plot the output signals
figure;
plot(out.tout, out.x_1);
hold on;
plot(out.tout, out.x_2);
title('Problem 5.27: Response of mass-spring-damper system ', 'interpreter', 'latex');
subtitle('$m_1 = m_2 = 1 kg, b_1 = b_2 = 0.1 kg/s, k_1 = 1 N/m, k_2 = 2 N/m, f_2 = 1 N$', 'interpreter', 'latex');
xlabel('Time (seconds)', 'interpreter', 'latex');
ylabel('Output', 'interpreter', 'latex');
legend('$x_1$', '$x_2$', 'interpreter', 'latex');

%% P5.27: Compute the transfer-function from the force f_2 to the displacement x_2
% Using symbolic computations, reduce the system to first-order equations.
% Create symbolic variables and constants
syms x_1(t) x_2(t) u(t) t
syms b_1 b_2 k_1 k_2 f_2 m_1 m_2
% Define first- and second-order variables
dx_1 = diff(x_1);
d2x_1 = diff(x_1, 2);
dx_2 = diff(x_2);
d2x_2 = diff(x_2, 2);
% Defining the two differential equations
eq1 = d2x_1 + (1/m_1)*(b_1 + b_2)*dx_1 + (1/m_1)*(k_1 + k_2)*x_1 - (1/m_1)*b_2*dx_2 - (1/m_1)*k_2*x_2 == 0;
eq2 = d2x_2 + (1/m_2)*(b_2*(dx_2 - dx_1) + (1/m_2)*k_2*(x_2 - x_1)) == (1/m_2)*(f_2*u);
% Get the reduced first-order form and any substitutions used
[SS, sbs] = odeToVectorField(eq1, eq2)
% Make sense of the output to form the state-space realization

% Load data from P5.27
load('Problem5_27.mat');
% Rewrite in the following state-space form:
% \dot{x} = Ax + Bu, y = Cx + Du
% For state variables z = [z_1; z_2; z_3; z_4] = [x_1; dx_1; x_2; dx_2]
A = [0, 1, 0, 0; -(k_1 + k_2)/m_1, -(b_1 + b_2)/m_1, k_2/m_1, b_2/m_1; 0, 0, 0, 1; k_2/m_2, b_2/m_2, -k_2/m_2, -b_2/m_2];
B = [0; 0; 0; 1/m_2];
C = [0, 0, 1, 0];
D = [0];
% Forming the state-space model
sys = ss(A, B, C, D);
G = tf(sys);

%% P5.27: Is this system asymptotically stable?
% The system is stable if the poles of the transfer-function G(s) have
% negative real parts.
p = pole(G);
% All the poles of the system have negative real parts, thus the system is
% asymptotically stable.

%% P5.27: Simulate the system assuming zero initial conditions and a
% constant force f_2 = 1 N.
figure;
%lsim(G, u, t);
% Plotting the response of the system to step input signal
step(G);
title('Problem 5.27: Step response of system to input $f_2 = 1N$', 'interpreter', 'latex');
xlabel('Time', 'interpreter', 'latex');
ylabel('Output $x_2$', 'interpreter', 'latex');