% From P2.18, the ODE:
% a*\dot{\omega}(t) + b*\omega(t) = \tau + w
% is a simplified description of the motion of the elevator, where
% w is \omega is the angular velocity of the driving shaft and
% v1 is the elevator's load linear velocity.

% Load data given in P6.14
r = 1;                              % m
m1 = 1000;                          % kg
m2 = m1;                            % kg
b1 = 120;                           % kgm^2/s
b2 = b1;                            % kgm^2/s
J1 = 20;                            % kgm^2
J2 = J1;                            % kgm^2
g = 10;                             % m/s^2

% Coefficients of our ODE
a = (J1 + J2 + r^2*(m1 + m2));      % kgm^2
b = (b1 + b2);                      % kgm^2/s
w = g*r*(m1 - m2);                  % kgm^2/s

%% P6.15: Repeat P6.14 with m_2 = 800 kg.
m2 = 800;                           % kg

%% P6.14: Use the root locus method to design a dynamic feedback controller
% that uses \tau as control input and the elevator's load vertical position
% x_1(t) = x_1(0) + int_{0}^{t} v_1(\tau)d\tau as the measured output so
% that the closed-loop system is capable of asymptotically tracking a
% constant position reference\bar{x_1}(t) = \bar{x_1}, t \geq 0.

% Transfer function of the open-loop system with output s*X(s) = V_1(s)
s = tf('s');
G = (r/a) / (s*(s + b/a));

% Plotting the pole-zero map of the open-loop system
figure;
subplot(2, 1, 1);
pzplot(G);
axis equal;
xlim([-0.15 0.15]);
title('Pole-zero plot of open-loop system in Problem 6.15', 'interpreter', 'latex');
subtitle('$G(s) = \frac{\frac{r}{a}}{s(s+\frac{b}{a})}$', 'interpreter', 'latex');
subtitle('$r = 1m, m_1 = m_2 = 1000kg, b_1 = b_2 = 120 kgm^2/s, J_1 = J_2 = 20 kgm^2, g = 10 m/s^2$', 'interpreter', 'latex');

% Plotting the root locus of the closed-loop system
Kp = 1;                         % A.S. when Kp > 0
z1 = -b/a + 1;                  % A.D.R. when centroid < 0
K = Kp*(s-z1) / s;              % The PI controller  
sys = K * G;
subplot(2, 1, 2);
rlocusplot(sys);
% hold on;
% z1 = -b/a - 1;                  % Does not perform A.D.R.
% K = Kp*(s-z1) / s;              % The PI controller
% sys = K * G;
% rlocusplot(sys);
axis equal;
xlim([-0.15 0.15]);
title('Root locus of closed-loop system in Problem 6.15', 'interpreter', 'latex');
subtitle('$K(s) = K_p\frac{(s-z_1)}{s}, G(s) = \frac{\frac{r}{a}}{s(s+\frac{b}{a})}$', 'interpreter', 'latex');
legend('$K_p = 1, z_1 = -\frac{b}{a} + 1$', 'interpreter', 'latex');