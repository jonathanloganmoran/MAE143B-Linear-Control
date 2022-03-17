% From P2.18, the ODE:
% a*\dot{\omega}(t) + b*\omega(t) = \tau + w
% is a simplified description of the motion of the elevator, where
% w is \omega is the angular velocity of the driving shaft and
% v1 is the elevator's load linear velocity.

% Load data given in P7.15
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

% Transfer function of the open-loop system with output s*X(s) = V_1(s)
s = tf('s');
p1 = -b/a;
G = (r/a) / (s*(s - p1));
% Since the input disturbance W(s) = 0, and given a transfer function G(s) 
% with a pole at the origin, we can achieve asymptotic tracking with a 
% proportional gain controller K(s) = K_p such that the closed-loop system
% is stable.
% Given the above, we define the system to be L(s) = G(s), \alpha = K_p.

%% P7.15: Use Bode plots and the Nyquist stability criterion to design a
% dynamic feedback controller that uses \tau as control input and the
% elevator's load vertical position x_1(t) = x_1(0) + int_{0}^{t}
% v_1(\tau)d\tau as measured output so that the closed loop is capable of
% asymptotically tracking a constant position reference \bar{x_1}(t) =
% \bar{x_1}, t \geq 0.
% Plotting the magnitude and phase of the open-loop system L(s) = G(s) with
% proportional gain \alpha = K_p
figure;
bodeplot(G);
grid on;
title('Magnitude and phase plot of open-loop system in P7.15', 'interpreter', 'latex');
subtitle('$G(s) = \frac{\frac{r}{a}}{s(s+\frac{b}{a})}$', 'interpreter', 'latex');
xlabel('$\textrm{Frequency}$', 'interpreter', 'latex');
ylabel('', 'interpreter', 'latex');
% Plotting the Nyquist plot of the open-loop system L(s) = G(s) with
% proportional gain \alpha = K_p
figure;
nyquistplot(G);
grid on;
title('Nyquist plot of the open-loop system in P7.15', 'interpreter', 'latex');
subtitle('$G(s) = \frac{\frac{r}{a}}{s(s+\frac{b}{a})}$', 'interpreter', 'latex');
xlabel('$\textrm{Real axis} \quad (\Re)$', 'interpreter', 'latex');
ylabel('$\textrm{Imaginary axis} \quad (\Im)$', 'interpreter', 'latex');
% From the Nyquist plot we see that there are zero encirclements around the
% point -1 + j0. The system is stable under negative unit feedback, i.e.,
% for a value \alpha = K_p = 1.
% Consider the Nyquist stability criterion where p is the number of poles
% of G(s) on the RHP and z is the number of zeros of G(s) on the RHP.
% Since p is zero, we look at z (the poles of the system G(s) under
% negative unit feedback).
p = pole(G)
% Upon inspection we find that there are zero zeros of the closed-loop 
% that exist on the RHP. Thus, z = 0 and the system is said to be stable.

%% P7.15: Calculate the corresponding gain and phase margins.
gm = allmargin(G).GainMargin
pm = allmargin(G).PhaseMargin
% Since the gain margin is inifinity, the closed-loop system is
% asymptotically stable for all values of K > 0. 
% When K = 1, the phase margin is 87.97 degrees.
