% From P2.18, the ODE:
% a*\dot{\omega}(t) + b*\omega(t) = \tau + w
% is a simplified description of the motion of the elevator, where
% w is \omega is the angular velocity of the driving shaft and
% v1 is the elevator's load linear velocity.

% Load data given in P7.16
r = 1;                              % m
m1 = 1000;                          % kg
m2 = 800;                           % kg
b1 = 120;                           % kgm^2/s
b2 = b1;                            % kgm^2/s
J1 = 20;                            % kgm^2
J2 = J1;                            % kgm^2
g = 10;                             % m/s^2

% Coefficients of our ODE
a = (J1 + J2 + r^2*(m1 + m2));      % kgm^2
b = (b1 + b2);                      % kgm^2/s
w = g*r*(m1 - m2);                  % kgm^2/s

% Transfer function of the open-loop system with output s*X(s) = V_1(s)
s = tf('s');
p1 = -b/a;
G = (r/a) / (s*(s - p1));
% Plotting the root locus of the open-loop system with disturbance
figure;
subplot(2, 1, 1);
rlocusplot(G*(1/s));
axis equal;
title('Root locus of open-loop system with disturbance in Problem 7.16', 'interpreter', 'latex');
subtitle('$r = 1m, m_1 = 1000kg, m_2 = 800kg, b_1 = b_2 = 120 kgm^2/s, J_1 = J_2 = 20 kgm^2, g = 10 m/s^2$', 'interpreter', 'latex');
% Since the transfer function G(s) has a pole at the origin, it is not
% asymptotically stable.
% We also have a non-zero input disturbance W(s). To perform asymptotic
% tracking and asymptotic disturbance rejection, we need to introduce a PI
% controller K(s) = K(s+z1)/s.
% For the closed-loop system to be A.S., we need the centroid of the
% root-locus of the system to be on the LHP. Thus, a zero at the location
% 0 < |z1| < b/a satisfies the condition for |z1| = 0.5*(b/a).
z1 = -0.5*(b/a);                    % The zero of the controller K(s)
Kp = 10;                            % The proportional gain
K = Kp*(s-z1) / s;                  % The PI controller K(s)
% Forming the closed-loop system with PI controller K(s)
sys = G*K;
% Plotting the root locus of the closed-loop system
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
title('Root locus of closed-loop system in Problem 7.16', 'interpreter', 'latex');
subtitle('$K(s) = Kp\frac{s+0.5\frac{b}{a}}{s}, Kp = 10, r = 1m, m_1 = 1000kg, m_2 = 800kg, b_1 = b_2 = 120 kgm^2/s, J_1 = J_2 = 20 kgm^2, g = 10 m/s^2$', 'interpreter', 'latex');
% From the root locus diagram we see that there exist zero poles in the
% RHP. The asymptotes appear in the LHP when K > 0 and the zero of the
% controller |z1| < b/a. Therefore, the system is asymptotically stable and
% performs asymptotic disturbance rejection.

%% P7.15: Use Bode plots and the Nyquist stability criterion to design a
% dynamic feedback controller that uses \tau as control input and the
% elevator's load vertical position x_1(t) = x_1(0) + int_{0}^{t}
% v_1(\tau)d\tau as measured output so that the closed loop is capable of
% asymptotically tracking a constant position reference \bar{x_1}(t) =
% \bar{x_1}, t \geq 0.
% Plotting the magnitude and phase of the open-loop system with disturbance
figure;
subplot(2, 1, 1);
bodeplot(G*(w/s));
grid on;
title('Magnitude and phase plot of open-loop system with disturbance in P7.16', 'interpreter', 'latex');
subtitle('$G(s) = \frac{\frac{r}{a}}{s(s+\frac{b}{a})}, W(s) = \frac{\bar{w}}{s}$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('', 'interpreter', 'latex');
% Plotting the magnitude and phase of the closed-loop system with A.D.R.
subplot(2, 1, 2);
bodeplot(sys);
grid on;
title('Magnitude and phase plot of closed-loop system in P7.16', 'interpreter', 'latex');
subtitle('$K(s) = Kp\frac{s+\frac{b}{a}}{s}, G(s) = \frac{\frac{r}{a}}{s(s+\frac{b}{a})}, Kp = 10$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('', 'interpreter', 'latex');

% Plotting the Nyquist plot of the open-loop system with disturbance
figure;
subplot(2, 1, 1);
nyquistplot(G*(w/s));
grid on;
axis equal;
title('Nyquist plot of the open-loop system with disturbance in P7.16', 'interpreter', 'latex');
subtitle('$G(s) = \frac{\frac{r}{a}}{s(s+\frac{b}{a})}, W(s) = \frac{\bar{w}}{s}$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');
% The open-loop system G(s) exhibits unstable behaviour under a constant 
% input disturbance, as shown in the Nyquist plot as a clockwise 
% encirclement around the critical point -1 + 0j.
% Plotting the Nyquist plot of the closed-loop system with A.D.R.
subplot(2, 1, 2);
nyquistplot(sys);
grid on;
axis equal;
title('Nyquist plot of the closed-loop system in P7.16', 'interpreter', 'latex');
subtitle('$K(s) = Kp\frac{s+\frac{b}{a}}{s}, G(s) = \frac{\frac{r}{a}}{s(s+\frac{b}{a})}, Kp = 10$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');
% From the Nyquist plot of the closed-loop system with stabilizing PI
% controller K(s), we see that there exists one counter-clockwise 
% encirclement around the critical point -1 + j0. Given that the open-loop
% transfer function G(s) was unstable, the closed-loop system must have one
% counter-clockwise encirclement for each pole of G(s) in the RHP.
% Consider the Nyquist stability criterion where p is the number of poles
% of G(s) on the RHP and z is the number of zeros of G(s) on the RHP.
% Since p is zero, we look at z (the poles of the system G(s) under
% negative unit feedback).
p = pole(G)
% Upon inspection we see that there exists a single pole of G(s) in the RHP
% i.e., the pole at the origin. Therefore, from the Nyquist plot above, the
% single counter-clockwise encirclement indicates that this system is
% stable under constant input disturbance with a controller K(s).

%% P7.15: Calculate the corresponding gain and phase margins.
gm = allmargin(G).GainMargin
pm = allmargin(G).PhaseMargin
% Since the gain margin is inifinity, the closed-loop system is
% asymptotically stable for all values of K > 0. 
% When K = 10, the phase margin is 88.17 degrees.