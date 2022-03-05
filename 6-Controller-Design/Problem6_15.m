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

%% P6.15: Repeat P6.14 with m_2 = 800 kg.
m2 = 800;                           % kg

% Coefficients of our ODE
a = (J1 + J2 + r^2*(m1 + m2));      % kgm^2
b = (b1 + b2);                      % kgm^2/s
w = g*r*(m1 - m2);                  % kgm^2/s


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
title('Pole-zero plot of open-loop system in Problem 6.15', 'interpreter', 'latex');
subtitle('$G(s) = \frac{\frac{r}{a}}{s(s+\frac{b}{a})}$', 'interpreter', 'latex');
subtitle('$r = 1m, m_1 = 1000kg, m_2 = 800kg, b_1 = b_2 = 120 kgm^2/s, J_1 = J_2 = 20 kgm^2, g = 10 m/s^2$', 'interpreter', 'latex');
Kp = 10;                    % A.S. when Kp > 0
K = Kp;                     % The proportional gain controller
sys = G*K;                  % L(s)
% Plotting the root locus of the closed-loop system (no A.D.R.)
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
xlim([-0.15 0.15]);
title('Root locus of closed-loop system in Problem 6.15', 'interpreter', 'latex');
subtitle('$K(s) = K_p, G(s) = \frac{\frac{r}{a}}{s(s+\frac{b}{a})}$', 'interpreter', 'latex');
legend('$K_p = 10$', 'interpreter', 'latex');

% Plotting the pole-zero map of the open-loop system
figure;
subplot(2, 1, 1);
pzplot(G);
axis equal;
xlim([-0.15 0.15]);
title('Pole-zero plot of open-loop system in Problem 6.15', 'interpreter', 'latex');
subtitle('$G(s) = \frac{\frac{r}{a}}{s(s+\frac{b}{a})}$', 'interpreter', 'latex');
subtitle('$r = 1m, m_1 = 1000kg, m_2 = 800kg, b_1 = b_2 = 120 kgm^2/s, J_1 = J_2 = 20 kgm^2, g = 10 m/s^2$', 'interpreter', 'latex');
% Plotting the root locus of the closed-loop system (with A.D.R.)
Kp = 10;                        % A.S. when Kp > 0
z1 = -b/a*0.5;                  % A.D.R. when centroid < 0
K = Kp*(s-z1) / s;              % The PI controller  
sys = K*G;
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
xlim([-0.15 0.15]);
title('Root locus of closed-loop system in Problem 6.15', 'interpreter', 'latex');
subtitle('$K(s) = K_p\frac{(s-z_1)}{s}, G(s) = \frac{\frac{r}{a}}{s(s+\frac{b}{a})}$', 'interpreter', 'latex');
legend('$K_p = 10, z_1 = -\frac{b}{a} + 1$', 'interpreter', 'latex');


%% Testing the proportional gain controller against the PI controller
% Simulate the response of the system to input disturbance
figure;
t_final = 500;                  % Simulation time
n_steps = t_final*2;            % Number of samples
t = linspace(0, t_final, n_steps);
u = heaviside(t);               % The unit impulse input signal
w = w*heaviside(t-1);           % The input disturbance as a step function
r = u + w;                      % The input plus disturbance
D = feedback(K, G);             % D(s), from \omega to e
S = feedback(K*G, 1);           % S(s), from \bar{x} to e
H = feedback(1, K*G);           % H(s), from \bar{x} to x       
lsim(S, r, t);
% Load the transfer function as Simulink-compatible variables
[G_num, G_den] = tfdata(G);
G_num = cell2mat(G_num);
G_den = cell2mat(G_den);
% Load the dynamic feedback controller as Simulink-compatible variables
[K_num, K_den] = tfdata(K);
K_num = cell2mat(K_num);
K_den = cell2mat(K_den);
load_system('Problem6_15_BlockDiagram');
out = sim('Problem6_15_BlockDiagram');
% Plot the response of the system to input disturbance
figure;
plot(out.tout, out.simout);
grid on;
title('Response of system in P6.15 to input disturbance', 'interpreter', 'latex');
subtitle('$G(s) = \frac{\frac{r}{a}}{s(s+\frac{b}{a})}$', 'interpreter', 'latex');
legend('$K(s) = K_p = 10$', '$K(s) = K_p\frac{(s-z_1)}{s}, K_p = 10, z_1 = -\frac{1}{2}\frac{b}{a}$', 'interpreter', 'latex');
xlabel('$Time (s)$', 'interpreter', 'latex');
ylabel('$\textrm{Vertical position} (m)$', 'interpreter', 'latex');