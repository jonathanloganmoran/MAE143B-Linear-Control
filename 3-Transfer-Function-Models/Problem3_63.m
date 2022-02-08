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

% The transfer function of the system
s = tf('s');
G = 1 / (a*s + b);

% The transfer function G_{\omega}
s = tf('s');
G_omega = G;

% The transfer function G_{\tau}
G_tau = G;

% Calculate elevator's linear velocity v_1(t) in response to
% constant-torque input \tau(t) = \tilde{\tau}, t \geq 0 and constant 
% gravitational torque \omega(t) = gr(m_1 - m_2), t \geq 0.

% Constant-torque input
T = tau_tilde*(1/s);

% Constant gravitational torque input
W = w*(1/s);

% U(s) input signal
U = T + W;

% Substituting \omega = v_1/r
V_1 = r*G*U;

% Time interval
t = linspace(0, 100, 800);

% Unit step reference input
u = heaviside(t);

% The response of the system in P3.63 to a unit step signal
figure;
lsim(V_1, u, t);
grid on;
title('Response of system in Problem 3.62 for $\tau(t) = \tilde{\tau}$ (Problem 3.63)', 'Interpreter', 'latex');
xlabel('$t(s)$', 'interpreter', 'latex');
ylabel('$v(t) m$', 'interpreter', 'latex');
legend('$\tau(t) = \tilde{\tau}$', 'interpreter', 'latex');
subtitle('$m_2 = 1000 kg$', 'interpreter', 'latex');