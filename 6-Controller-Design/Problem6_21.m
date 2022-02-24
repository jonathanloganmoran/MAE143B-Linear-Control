%% The one-eighth-car model, shown in Fig 6.26(a), models the suspension 
% dynamics of a car. The ODE: m\ddot{x} + b\dot{x} + kx = b\dot{y} + ky,
% consititutes a simplified description of the motion of this model,
% where x is a displacement measured from equilibrium. The mass m
% represents 1/4 of the total mass of the car. The constants k and b are
% the stiffness and damping coefficients of the spring and shock absorber.

%% P6.21: Plot the response of the car suspension with data from P6.20
% Load data from P6.20
f_n = 2.5;                      % Natural frequency (Hz)
zeta = 0.08;                    % Damping ratio
m = 640;                        % Mass of car (kg)
w_n = 2*pi*f_n;                 % Natural frequency (rad/s)
b = 2*zeta*w_n*m;               % Shock absorber damping coefficient
k = m*w_n^2;                    % Spring stiffness
% Load data from P6.21
w = 1;                          % Pothole width (m)
d = 5*10^-2;                    % Pothole depth (cm -> m)
v_0 = 10*10^3/(60*60);          % Velocity of car (km/h -> m/s)

% Plotting the single pulse input signal of pothole
t_run = 5;                      % Duration of simulation (s)
t = linspace(0, t_run, 500);    % Time interval (s)
t_p = w / v_0;                  % Duration of time car is in pothole (s)
t_start = 1;                    % Time car enters pothole (s)
t_end = t_start + t_p;          % Time car leaves pothole (s)
figure;
square_wave = rectangularPulse(t_start, t_end, t);
plot(t, d*square_wave);
grid on;
title('Problem 6.21: Pulse input of pothole for one-eighth-car model', 'interpreter', 'latex')
xlabel('Time (s)', 'interpreter', 'latex');
ylabel('$y(t) m$', 'interpreter', 'latex');
labels = {'$t_0$', '$t_p = \frac{w}{v}$', '$t_f = t_0 + t_p$'};
xs = [t_start - 0.01, (t_start + t_p/2) + 0.01, t_end + 0.03];
ys = [0, d, 0];
text(xs, ys, labels, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'interpreter', 'latex');
subtitle('$v = 2.78 m/s, w = 1 m, d = 0.05 m$', 'interpreter', 'latex');
ylim([0, 0.1]);
xlim([0.5 1.5]);
% The single pulse input signal can also be represented as the 
% difference of two step functions:
s1 = d*heaviside(t - t_start);
s2 = d*heaviside(t- t_end);
y = s1 - s2;

% Transfer function of the suspension system from P6.20
s = tf('s');
G = -1*s^2 / (s^2 + (b/m)*s + (k/m));
% Transfer function of the car displacement from P6.19
G2 = (b*s + k) / (m*s^2 + b*s + k);

% Simulate response of systems to single pulse input for v = 1 km/h
figure;
subplot(2, 1, 1);
lsim(G, y, t);                  % Car suspension system response
hold on;
plot(t, d*square_wave, 'k');
grid on;
ylim([-0.05 0.09]);
title('Problem 6.21: Response of one-eighth-car model to single pulse input', 'interpreter', 'latex');
subtitle('$w = 1 m, d = 5 cm, v_0 = 10 km/h, \omega_{n} = 5\pi rad/s, b = 512\pi, k = 16000\pi^2, \zeta = 0.08, m = 640kg$', 'interpreter', 'latex');
xlabel('Time', 'interpreter', 'latex');
ylabel('Output (m)', 'interpreter', 'latex');
legend('$\textrm{Car suspension}: z = x - y$', '$\textrm{Pulse input}: t_0 = 1s$', 'interpreter', 'latex')
subplot(2, 1, 2);
lsim(G2, y, t);                 % Car displacement response
hold on;
plot(t, d*square_wave, 'k');
grid on;
ylim([-0.05 0.09]);
title('Problem 6.21: Response of one-eighth-car model to single pulse input', 'interpreter', 'latex');
subtitle('$w = 1 m, d = 5 cm, v_0 = 10 km/h, \omega_{n} = 5\pi rad/s, b = 512\pi, k = 16000\pi^2, \zeta = 0.08, m = 640kg$', 'interpreter', 'latex');
xlabel('Time', 'interpreter', 'latex');
ylabel('Output (m)', 'interpreter', 'latex');
legend('$\textrm{Car displacement}: x$', '$\textrm{Pulse input}: t_0 = 1s$', 'interpreter', 'latex')

% Repeating for v = 100 km/h
v_0 = 100*10^3/(60*60);         % Velocity of car (km/h -> m/s)
t_p = w / v_0;                  % Duration of time car is in pothole (s)
t_start = 1;                    % Time car enters pothole (s)
t_end = t_start + t_p;          % Time car leaves pothole (s)
% Single pulse input to model the pothole
square_wave = rectangularPulse(t_start, t_end, t);
% which is equivalent to:
y = d*(heaviside(t - t_start) - heaviside(t- t_end));
figure;
subplot(2, 1, 1);
lsim(G, y, t);                  % Car suspension system response
hold on;
plot(t, d*square_wave, 'k');
grid on;
ylim([-0.05 0.09]);
title('Problem 6.21: Response of one-eighth-car model to single pulse input', 'interpreter', 'latex');
subtitle('$w = 1 m, d = 5 cm, v_0 = 100 km/h, \omega_{n} = 5\pi rad/s, b = 512\pi, k = 16000\pi^2, \zeta = 0.08, m = 640kg$', 'interpreter', 'latex');
xlabel('Time', 'interpreter', 'latex');
ylabel('Output (m)', 'interpreter', 'latex');
legend('$\textrm{Car suspension}: z = x - y$', '$\textrm{Pulse input}: t_0 = 1s$', 'interpreter', 'latex')
subplot(2, 1, 2);
lsim(G2, y, t);                 % Car displacement system response
hold on;
plot(t, d*square_wave, 'k');
grid on;
ylim([-0.05 0.09]);
title('Problem 6.21: Response of one-eighth-car model to single pulse input', 'interpreter', 'latex');
subtitle('$w = 1 m, d = 5 cm, v_0 = 100 km/h, \omega_{n} = 5\pi rad/s, b = 512\pi, k = 16000\pi^2, \zeta = 0.08, m = 640kg$', 'interpreter', 'latex');
xlabel('Time', 'interpreter', 'latex');
ylabel('Output (m)', 'interpreter', 'latex');
legend('$\textrm{Car displacement}: x$', '$\textrm{Pulse input}: t_0 = 1s$', 'interpreter', 'latex')



% Repeating for v = 1 km/h
t_run = 10;                     % Duration of simulation (s)
t = linspace(0, t_run, 500);    % Time interval (s)
v_0 = 1*10^3/(60*60);           % Velocity of car (km/h -> m/s)
t_p = w / v_0;                  % Duration of time car is in pothole (s)
t_start = 1;                    % Time car enters pothole (s)
t_end = t_start + t_p;          % Time car leaves pothole (s)
% Single pulse input to model the pothole
square_wave = rectangularPulse(t_start, t_end, t);
% which is equivalent to:
y = d*(heaviside(t - t_start) - heaviside(t- t_end));
figure;
subplot(2, 1, 1);
lsim(G, y, t);                  % Car suspension system response
hold on;
plot(t, d*square_wave, 'k');
grid on;
ylim([-0.05 0.09]);
title('Problem 6.21: Response of one-eighth-car model to single pulse input', 'interpreter', 'latex');
subtitle('$w = 1 m, d = 5 cm, v_0 = 1 km/h, \omega_{n} = 5\pi rad/s, b = 512\pi, k = 16000\pi^2, \zeta = 0.08, m = 640kg$', 'interpreter', 'latex');
xlabel('Time', 'interpreter', 'latex');
ylabel('Output (m)', 'interpreter', 'latex');
legend('$\textrm{Car suspension}: z = x - y$', '$\textrm{Pulse input}: t_0 = 1s$', 'interpreter', 'latex')
subplot(2, 1, 2);
lsim(G2, y, t);                 % Car displacement system response
hold on;
plot(t, d*square_wave, 'k');
grid on;
ylim([-0.05 0.09]);
title('Problem 6.21: Response of one-eighth-car model to single pulse input', 'interpreter', 'latex');
subtitle('$w = 1 m, d = 5 cm, v_0 = 1 km/h, \omega_{n} = 5\pi rad/s, b = 512\pi, k = 16000\pi^2, \zeta = 0.08, m = 640kg$', 'interpreter', 'latex');
xlabel('Time', 'interpreter', 'latex');
ylabel('Output (m)', 'interpreter', 'latex');
legend('$\textrm{Car displacement}: x$', '$\textrm{Pulse input}: t_0 = 1s$', 'interpreter', 'latex')