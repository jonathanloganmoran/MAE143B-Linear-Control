clear all;
% From P2.18, the ODE
% a*\dot{\omega}(t) + b*\omega(t) = \tau + w

% Load data given in P3.69
g = 10;             % m/s^2
r = 1;              % m
m1 = 1000;          % kg
m2 = 1000;          % kg
b1 = 120;           % kgm^2/s
b2 = 120;           % kgm^2/s
J1 = 20;            % kgm^2
J2 = 20;            % kgm^2
tau_tilde = 480;    % Nm = kgm^2/s^2

% Coefficients of our ODE
a = (J1 + J2 + r^2*(m1 + m2));
b = (b1 + b2);
w = g*r*(m1 - m2);

% The transfer function of the system in P3.66
s = tf('s');
G = (r/a) / (s*(s + b/a));

% Calculate elevator's linear position x_1(t) in response to
% constant-torque input \tau(t) = \tilde{\tau}, t \geq 0 and
% constant gravitational torque \omega(t) = gr(m_1 - m_2), t \geq 0.

% Time interval
t = linspace(0, 100, 800);

% Constant-torque input
tau = tau_tilde;

% Constant gravitational torque input
W = w;

% Unit step reference input
u =  (tau + w).*heaviside(t);

% The response of the system in P3.66 to a unit step signal
figure;
lsim(G, u, t);
grid on;
title('\rm{Response of system in Problem 3.66 for constant-torque input}', 'interpreter', 'latex');
xlabel('$t(s)$', 'interpreter', 'latex');
ylabel('$x(t) m$', 'interpreter', 'latex');
legend('$\tau(t) = \tilde{\tau}$', 'interpreter', 'latex');
subtitle('$m_2 = 1000 kg$', 'interpreter', 'latex');