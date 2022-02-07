% From P2.18, the ODE
% a*\dot{\omega}(t) + b*\omega(t) = \tau + w

% Load data given in P3.69
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

% The transfer function of the system
s = tf('s');
G = 1 / (a*s + b);

% The transfer function G_{\omega}
s = tf('s');
G_omega = G;

% The transfer function G_{\tau}
G_tau = G;

% Determine if system is asymptotically stable
p = pole(G)

% Since the roots of the characteristic equation of the TF have negative
% real parts, this system is said to be asymptotically stable.