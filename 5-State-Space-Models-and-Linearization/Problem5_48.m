%% The Lotka-Volterra predator-prey model
% \dot{x_1} = rx_1 - ax_{1}x_{2}, and
% \dot{x_2} = eax_{1}x_{2} - mx_{2},
% where r, a, e, and m are positive constants.
% x_1 represents the prey population, x_2  the predator population.

%% Load data from P5.48:
r = 0.05;                   % Natural growth rate of prey in absense of predators
a = 0.05;                   % Rate of prey loss due to predator/prey interaction
m = 0.2;                    % Growth of predators due to predator/prey interaction 
e = 0.2;                    % Rate of predator loss due to natural death or emigration
x_1_init = 9;               % Initial population of prey
x_2_init = 1;               % Initial population of predators
save('Problem5_48.mat');

%% P5.48: Calculate the equilibrium points for this model.
% The equilibrium points are:
% (p1, p2) = (0, 0), the extinction point, and
% (p1, p2) = (m/(e*a), r/a), the coexistence point.
% Proof:
syms x_1(t) x_2(t) t
syms r a e m
% State-space realization (with symbolic variables)
A = [r - a*x_2, -a*x_1; e*a*x_2, e*a*x_1 - m];
% Find the roots of the polynomial
lambda = det(A);

%% P5.48: Linearize about the equilibrium points.
% For equilibrium point at (0,0)
x_1 = subs(x_1, x_1, 0); 
x_2 = subs(x_2, x_2, 0);
A = [r - a*x_2, -a*x_1; e*a*x_2, e*a*x_1 - m];
roots = det(A);
% We obtain the roots (r, -m).

% For equilibrium point at (m/(a*e), r/a);
load('Problem5_48.mat');
x_1 = subs(x_1, x_1, m/(a*e));
x_2 = subs(x_2, x_2, r/a);
A = [r - a*x_2, -a*x_1; e*a*x_2, e*a*x_1 - m];
roots = det(A);
% We obtain the root (0.01).

%% P5.48: Classify the equilibria as asymptotically stable or unstable.
% For (0, 0): since there exists a positive real-valued root, this
% equilibrium point is unstable.
% For (m/(a*e), r/a): Since there exists a positive real-valued root, this
% equilibrium point is unstable.

%% P5.48: Represent the equations in block-diagram using integrators.
% Load the data from P5.48
load('Problem5_48.mat');
% Load the block-diagram of P5.48
load_system('Problem5_48_BlockDiagram');
% Simulate the model
out = sim('Problem5_48_BlockDiagram');
% Plot the output signals
plot(out);
% Store output signals in base workspace
latestRun = Simulink.sdi.Run.getLatest;
x_1_out = Simulink.sdi.getSignal(getSignalIDsByName(latestRun, 'x_1'));
x_2_out = Simulink.sdi.getSignal(getSignalIDsByName(latestRun, 'x_2'));

%% P5.48: Simulate the predator/prey populations for the following data:
% Define the simulation time
t = 1:1:400;
% For the data given in P5.48:
r = 0.05;                   % Natural growth rate of prey in absense of predators
a = 0.05;                   % Rate of prey loss due to predator/prey interaction
m = 0.2;                    % Growth of predators due to predator/prey interaction 
e = 0.2;                    % Rate of predator loss due to natural death or emigration
% Define the initial conditions (prey, predators)
y_0 = [0.9*(m/(e*a)); 1.1*(r/a)];
% Solve the nonlinear system
ode = @(t, x) lotka_volterra(t, x, r, a, e, m);
[t, x] = ode45(ode, t, y_0);
% Plotting the system
figure;
plot(t, x);
grid on;
title('Problem 5.48: Particular solution to Lotka-Volterra model', 'interpreter', 'latex');
subtitle('$r = 0.05, a = 0.05, m = 0.2, e = 0.2, x_1(0) = 18, x_2(0) = 1$', 'interpreter', 'latex');
legend('Prey', 'Predator', 'interpreter', 'latex');
xlabel('Time', 'interpreter', 'latex');
ylabel('Population size', 'interpreter', 'latex')

% Simulation run #2: Equal starting populations.
% Modified data given in P5.48
r = 1.0;                    % Natural growth rate of prey in absense of predators
a = 0.05;                   % Rate of prey loss due to predator/prey interaction
m = 0.2;                    % Growth of predators due to predator/prey interaction 
e = 0.5;                    % Rate of predator loss due to natural death or emigration
% Modified the initial conditions
y_0 = [1, 1];               % Initial population of prey, predators
% Solve the nonlinear system
ode = @(t, x) lotka_volterra(t, x, r, a, e, m);
[t, x] = ode45(ode, t, y_0);
% Plotting the system
figure;
plot(t, x);
grid on;
title('Problem 5.48: Particular solution to Lotka-Volterra model', 'interpreter', 'latex');
subtitle('$r = 1.0, a = 0.05, m = 0.2, e = 0.5, x_1(0) = 1, x_2(0) = 1$', 'interpreter', 'latex');
legend('Prey', 'Predator', 'interpreter', 'latex');
xlabel('Time', 'interpreter', 'latex');
ylabel('Population size', 'interpreter', 'latex')

%% Resources:
% https://matlabgeeks.com/tips-tutorials/modeling-with-odes-in-matlab-part-3/
% http://b.web.umkc.edu/baygentsg/Lotka-Volterra%20Analysis.pdf
% http://www.math.ualberta.ca/~xinweiyu/334.1.10f/DE_1st_order_linear_system.pdf