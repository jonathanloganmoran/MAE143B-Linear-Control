% Load data given in P4.23
g = 10;                             % m/s^2
r = 1;                              % m
m1 = 1000;                          % kg
m2 = 800;                           % kg
b1 = 120;                           % kgm^2/s
b2 = 120;                           % kgm^2/s
J1 = 20;                            % kgm^2
J2 = 20;                            % kgm^2

% Coefficients of our ODE
a = (J1 + J2 + r^2*(m1 + m2));      % kgm^2
b = (b1 + b2);                      % kgm^2/s
w = g*r*(m1 - m2);                  % kgm^2/s

% Constants for P4.23
K = 500;                            % K > -(b/r)
v0_1 = 0;                           % m/s
v_1_bar = 3;                        % m/s

% Particular solution
v_tilde = (r/a)*(K*v_1_bar + g*r*(m1 - m2))*(1/((b/a) + (r/a)*K));

% Time interval 
t = linspace(0, 30, 100);

% Complete solution
lambda = -1*((b/a) + (r/a)*K);
v_1t = v_tilde*exp(lambda*t) + v0_1*exp(lambda);

% Plotting the response
figure;
plot(t, v_1t)
grid on;
title('Response of system in Problem 4.23 when $m_2 = 1000kg$', 'interpreter', 'latex');
xlabel('$t(s)$', 'interpreter', 'latex');
ylabel('$v(t) m/s$', 'interpreter', 'latex');