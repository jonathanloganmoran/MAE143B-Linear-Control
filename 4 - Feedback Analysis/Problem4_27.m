% Load data given in P3.70
g = 10;             % m/s^2
r = 1;              % m
m1 = 1000;          % kg
m2 = 800;           % kg
b1 = 120;           % kgm^2/s
b2 = 120;           % kgm^2/s
J1 = 20;            % kgm^2
J2 = 20;            % kgm^2
T = 480;            % Nm = kgm^2/s^2

% Coefficients of our ODE
a = (J1 + J2 + r^2*(m1 + m2));
b = (b1 + b2);
w = g*r*(m1 - m2);

% Constants for P4.25;
K = 100;
w_d = 10*(r/a)^(1/2)*(1-(b/(20*a*(r/a)^(1/2)))^2)^(1/2);
lambda = -(1/2)*(b/a);
sigma = (b/(2*a))*(1/(10*(r/a)^(1/2)));
phi_d = atan(sigma/(1-sigma^2)^(1/2));

% Time interval 
t = linspace(0, 60, 500);

% For K = 100;
x = 10*(1-(1/(1-sigma^2)^(1/2))*exp(lambda*t).*sin(w_d*t + pi/2 - phi_d));

% Plotting the response of the system in P4.25
figure;
plot(t, x)
grid on;
title('Closed-loop response of system in Problem 4.25 for $m_2 = 800 kg$', 'Interpreter', 'latex');
xlabel('$t(s)$', 'interpreter', 'latex');
ylabel('$x(t) m$', 'interpreter', 'latex');