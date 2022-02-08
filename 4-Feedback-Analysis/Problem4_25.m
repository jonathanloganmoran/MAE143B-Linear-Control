% Load data given in P4.25
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

% Constants for P4.25
x_1_bar = 10;                       % m

% Time interval 
t = linspace(0, 120, 700);

% Complete solution for the second-order ODE (K = 100);
K = 100;                            % K > 0
w_d = 10*(r/a)^(1/2)*(1-(b/(20*a*(r/a)^(1/2)))^2)^(1/2);
lambda = -(1/2)*(b/a);
zeta = (b/(2*a))*(1/(10*(r/a)^(1/2)));
phi_d = atan(zeta/(1-zeta^2)^(1/2));
x_t = 10*(1-(1/(1-zeta^2)^(1/2))*exp(lambda*t).*sin(w_d*t + pi/2 - phi_d));

% Transfer function of the second-order ODE for various values of K
figure;
u = x_1_bar*heaviside(t);
s = tf('s');
% Plotting the magnitude of the closed-loop disturbance transfer function
for K = [10, 50, 200]
    D = (x_1_bar * K * (r/a) + w) / (s^2 + (b/a)*s + (r/a)*K);
    lsim(D, u, t);
    hold on;
    grid on;
end
title('$\textrm{Magnitude of response of transfer function in Problem 4.25}$', 'interpreter', 'latex');
subtitle('$m_2 = 1000 kg$', 'interpreter', 'latex');
legend('$K_{i} = 10$', '$ K_{i} = 50$', '$K_{i} = 200$', 'interpreter', 'latex');
xlabel('$t(s)$', 'interpreter', 'latex');
ylabel('$\vert D(s) \vert$', 'interpreter', 'latex');

% Plotting the response of the second-order system in P4.25
figure;
plot(t, x_1_bar*heaviside(t));
hold on;
plot(t, x_t1)
grid on;
title('Closed-loop response of system in Problem 4.25 for $m_2 = 1000 kg$', 'interpreter', 'latex');
legend('$\bar{x_1} = 10 m$', '$K = 100$', 'interpreter', 'latex');
xlabel('$t(s)$', 'interpreter', 'latex');
ylabel('$x(t) m$', 'interpreter', 'latex');