% From P2.18, the ODE
% a*\dot{\omega}(t) + b*\omega(t) = \tau + w

% Load data given in P2.20
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

%% Calculate the (open-loop) motor torque \tau for the elevator model in
% P2.19 so that the vertical velocity of the mass m_1, v_1, converges to
% \bar{v_1} = 2 m/s as t gets large.

% Calculating the open-loop motor torque
v_bar = 2;                          % m/s

% Steady-state solution of the form v_bar = (r/b)*(tau_bar + w)
% solved in terms of tau_bar
tau_bar = b*v_bar - w;

%% Plot the response v_1(t) when v_1(0) = 0 m/s, 1 m/s, and -1 m/s
% Time interval
t = linspace(0, 60, 200);

% Particular solution in time-domain from P2.19
v_tilde = (r/b)*(tau_bar + g*r*(m1 - m2));
lambda = -1*(b/a);

% Plotting the response of the system in P2.19
figure;
for v0_1 = [0, 1, -1]
    % Complete solution in time-domain
    v_1t = v_tilde*(1-exp(lambda*t)) + v0_1*exp(lambda*t);
    plot(t, v_1t);
    grid on;
    hold on;
end
title('Linear velocity of elevator model (Problem 2.21)', 'interpreter', 'latex');
xlabel('$t(s)$', 'interpreter', 'latex');
ylabel('$v(t) m/s$', 'interpreter', 'latex');
legend('$v_1(0) = 0 m/s$', '$v_1(0) = 1 m/s$', '$v_1(0) = -1 m/s$',  'interpreter', 'latex', location='southeast');
subtitle('$m_2 = 1000 kg, \bar{\tau} = 480 Nm$', 'interpreter', 'latex');