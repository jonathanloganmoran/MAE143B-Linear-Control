% From P2.18, the ODE
% a*\dot{\omega}(t) + b*\omega(t) = \tau + w
% Rewritten in terms of v_1:
% \dot{v_1} + \frac{b}{a}v_1 = \frac{r}{a}(\tau + w)

% Load data given in P4.23
g = 10;                             % m/s^2
r = 1;                              % m
m1 = 1000;                          % kg
m2 = 1000;                          % kg
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
t = linspace(0, 80, 100);

% Particular solution for K = 500
K = 500;                            % K > -(b/r)
v_tilde = (r/a)*(K*v_1_bar + g*r*(m1 - m2))*(1/((b/a) + (r/a)*K));
% Complete solution for K = 500
lambda = -1*((b/a) + (r/a)*K);
v_1t_1 = v_tilde*(1-exp(lambda*t)) + v0_1*exp(lambda);

% Particular solution for K = 2000
K = 20000;                          % K > -(b/r)
v_tilde = (r/a)*(K*v_1_bar + g*r*(m1 - m2))*(1/((b/a) + (r/a)*K));
% Complete solution for K = 2000
lambda = -1*((b/a + (r/a)*K));
v_1t_2 = v_tilde*(1-exp(lambda*t)) + v0_1*exp(lambda);

% The transfer function of the system
s = tf('s');
G = (r/a) / (s + b/a);
% The sensitivity transfer function
S = (s + b/a) / (s + b/a + r*K/b);

% Plotting the response
figure;
plot(t, v_1_bar*heaviside(t));
hold on;
plot(t, v_1t_1);
hold on;
plot(t, v_1t_2);
grid on;
ylim([0 4]);
title('Response of system in Problem 4.23 when $m_2 = 1000kg$', 'interpreter', 'latex');
legend('$\bar{v_1} = 3 m/s$', '$K = 500$', '$K = 2000$', 'interpreter', 'latex');
xlabel('$t(s)$', 'interpreter', 'latex');
ylabel('$v(t) m/s$', 'interpreter', 'latex');