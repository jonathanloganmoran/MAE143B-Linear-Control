% Load data given in P4.28
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

% Particular solution
K = 500;                            % K > 0
z = (1/2)*(b/a);                    % 0 < z < (b/a)
v_0 = 0;                            % m/s
x_1_bar = 10;                       % m/s

% Transfer function of the system
s = tf('s');
G_s = (r/a)*(K*s*x_1_bar + s*w + K*z*x_1_bar)*(1/(s^3 + (b/a)*s^2 + (r/a)*K*s + (r/a)*K*z));
G = tf(G_s);

% Time interval
t = linspace(0, 180, 800);

% Plot of the response of the system in P4.28 with unit step input
figure;
plot(t, x_1_bar*heaviside(t));
hold on;
u = heaviside(t);
lsim(G, u, t);
grid on;
title('Response of system in Problem 4.28 for ${\bar{x_1} = 10 m}$', 'interpreter', 'latex');
subtitle('$m_2 = 800 kg$', 'interpreter', 'latex');
legend('$\bar{x_1} = 10 m$', '$K = 500, z = \frac{1}{2}\cdot\frac{b}{a}$', 'interpreter', 'latex');
xlabel('$t(s)$', 'interpreter', 'latex');
ylabel('$x(t) m$', 'interpreter', 'latex');