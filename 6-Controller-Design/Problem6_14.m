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

% Transfer function of the open-loop system with output s*X(s) = V_1(s):
s = tf('s');
p1 = -b/a;
G = (r/a) / (s*(s - p1));

%% Experimentation with open-loop control
% With perfect knowledge of the system, assuming zero disturbances, we can
% implement a rudimentary 'controller' that stabilizes the system. However,
% these assumptions are infeasible in the practical setting and are
% sensitive to noise/disturbance and inputs.

% We form an analytical solution by creating a stable pole in denominator 
Kf = 10;                     % A.S. when Kf > 0
% Adding an open-loop control gain Kf to the system G(s)K(s)
sys = (r/a) / (s*(s-p1 + Kf));            
% Plotting the root locus of the open-loop system
figure;
subplot(2, 1, 1);
rlocusplot(sys);
axis equal;
title('Root locus of open-loop control of system in Problem 6.14', 'interpreter', 'latex');
subtitle('$G(s) = \frac{\frac{r}{a}}{s(s+\frac{b}{a} + K_f)}$', 'interpreter', 'latex');
legend('$K_f = 10$', 'interpreter', 'latex');

%% P6.14: Use the root locus method to design a dynamic feedback controller
% that uses \tau as control input and the elevator's load vertical position
% x_1(t) = x_1(0) + int_{0}^{t} v_1(\tau)d\tau as the measured output so
% that the closed-loop system is capable of asymptotically tracking a
% constant position reference\bar{x_1}(t) = \bar{x_1}, t \geq 0.

% We will now implement a closed-loop controller that can asymptotically
% track a constant reference. Proportional gain controller will work here,
% since our system G(s) already has a pole at zero (A.S.).
Kp = 10;                    % A.S. when Kp > 0
K = Kp;                     % The proportional gain controller
sys = G*K;                  % L(s)
% Plotting the root locus of the closed-loop system
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
xlim([-0.15 0.15]);
title('Root locus of closed-loop system in Problem 6.14', 'interpreter', 'latex');
subtitle('$K(s) = K_p, G(s) = \frac{\frac{r}{a}}{s(s+\frac{b}{a})}$', 'interpreter', 'latex');
legend('$K_p = 10$', 'interpreter', 'latex');