% Load data given in P4.24
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
v0_1 = 0;                           % m/s
v_1_bar = 3;                        % m/s

% Time interval
t = linspace(0, 60, 200);

% Particular solution for K = 500
K = 500;                            % K > -(b/r)
v_tilde = (r/a)*(K*v_1_bar + g*r*(m1 - m2))*(1/((b/a) + (r/a)*K));
% Complete solution for K = 500
lambda = -1*((b/a) + (r/a)*K);
v_t1 = v_tilde .* (1-exp(lambda*t)) + v0_1*exp(lambda*t);

% Particular solution for K = 2000
K = 2000;                           % K > -(b/r)
v_tilde = (r/a)*(K*v_1_bar + g*r*(m1 - m2))*(1/((b/a) + (r/a)*K));
% Complete solution for K = 500
lambda = -1*((b/a) + (r/a)*K);
v_t2 = v_tilde .* (1-exp(lambda*t)) + v0_1*exp(lambda*t);

% Plotting the response of the system in P4.24
figure;
plot(t, v_1_bar*heaviside(t));
hold on;
plot(t, v_t1);
hold on;
plot(t, v_t2);
grid on;
title('Response of system in Problem 4.24 when $m_2 = 800kg$', 'interpreter', 'latex');
legend('$\bar{v_1} = 3 m/s$', '$K = 500$', '$K = 2000$', 'interpreter', 'latex');
xlabel('$t(s)$', 'interpreter', 'latex');
ylabel('$v(t) m/s$', 'interpreter', 'latex');