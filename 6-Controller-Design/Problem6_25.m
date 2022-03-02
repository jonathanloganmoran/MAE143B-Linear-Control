%% The one-quarter-car model from P6.24, models the wheel-body dynamics of
% a car. The mass m_s represents 1/4 of the mass of the car without the
% wheels and m_u represents the mass of a single wheel. The constants k_s
% and b_s are the stiffness and damping coefficient of the spring and shock
% absorber. The constants k_u and b_u are the stiffness and damping
% coefficient of the tire. The ODEs:
% m_s\ddot{x_s} + b_s(\dot{x_s} - \dot{x_u}) + k_s(x_s - x_u) = 0,
% m_u\ddot{x_u} + (b_u + b_s)\dot{x_u} + (k_u + k_s)x_u - b_s\dot{x_s}
% - k_s*x_s = k_u*y +b_u*\dot{y}
% constitutes a simplified description of the motion of the one-quarter-car
% model, where x_s and x_u are displacements measured from equilibrium.

%% Load the data in P6.25:
k_u = 200000;                   % Tire stiffness (N/m)
b_u = 0;                        % Tire damping coefficient
m_s = 600;                      % 1/4 mass of car w/o wheels (kg)
m_u = 40;                       % Mass of a single wheel (kg)
f_n = 2.5;                      % Natural frequency (Hz)
w_n = 2*pi*f_n;                 % Natural frequency (rad/s)
zeta = 0.08;                    % Damping ratio

%% P6.25: Select values of k_s and b_s
k_s = 2.5*k_u;                  % Spring stiffness (N/m)
b_s = m_s*m_u;                  % Shock absorber damping coefficient

%% P6.25: The state-space form of the ODEs
% The state matrix A
% For state variables x' = [x; \dot{x}; z; \dot{z}];
r1 = [0, 1, 0, 0];
r2 = [-k_s*(m_s + m_u)/(m_s*m_u) -b_s*(m_s + m_u)/(m_s*m_u) k_u/m_s b_u/m_u];
r3 = [0, 0, 0, 1];
r4 = [k_s/m_u, b_s/m_u, -k_u/m_u, -b_u/m_u];
A = [r1; r2; r3; r4];
% The input matrix B
% For input u = \ddot{y}
B = [0; 0; 0; -1];
% The output matrix C
% for output y = \ddot{x} + \ddot{z}
C = [0, -b_s/m_s, 0, -k_s/m_s];
% The transition matrix D
% For input u = \ddot{y}
D = [-1];

% The system formed by the state-space realization
sys = ss(A, B, C, D);

%% P6.25: Calculate the transfer function of the system
% from the road profile, y, to the relative displacement x + z
G = tf(sys);

% Obtain the natural frequency and damping ratio
[w_n, zeta] = damp(G);          % Should match expected values below

%% Load the data in P6.25:
k_u = 200000;                   % Tire stiffness (N/m)
b_u = 0;                        % Tire damping coefficient
m_s = 600;                      % 1/4 mass of car w/o wheels (kg)
m_u = 40;                       % Mass of a single wheel (kg)
f_n = 2.5;                      % Natural frequency (Hz)
w_n = 2*pi*f_n;                 % Natural frequency (rad/s)
zeta = 0.08;                    % Damping ratio

%% P6.25: Select values of k_s and b_s
% Choosing the following at random (no correlation)
k_s = 2.5*k_u;                  % Spring stiffness (N/m)
b_s = m_s*m_u;                  % Shock absorber damping coefficient

%% P6.25: Locate all roots in the complex plane
% Plotting the pole-zero map of the continuous second-order system
[p, z] = pzmap(G);
figure;
subplot(2, 1, 1);
pzplot(G)
print_labels = false;
print_values = false;
if print_labels
    text(real(z) + 40.5, imag(z) - 20.5, 'Zero')
    text(real(p) - 20.5, imag(p) + 20.5, 'Pole')
elseif print_values
    text(real(z(3)) + 20.5, imag(z(3)) - 20.5, sprintf('%g%+gi', real(z(3)), imag(z(3))));
    text(real(p(3)) + 40.5, imag(p(3)) - 20.5, sprintf('%g%+gi', real(p(3)), imag(p(3))));
end
axis equal
a = findobj(gca, 'type', 'line')
for i = 1:length(a)
    set(a(i), 'markersize', 8)
    set(a(i), 'linewidth', 2)
end
ylim([-200 200]);
title('Poles and zeros of the continuous second-order system in Problem 6.25', 'interpreter', 'latex');
subtitle('$\omega_{n} = 5\pi rad/s, b_s = m_s*m_u, k_s = f_n*k_u, k_u = 200000 N/m, b_u = 0, m_u = 40kg, m_s = 600kg, f_n = 2.5 Hz, \zeta = 0.08$', 'interpreter', 'latex');

% Plotting root locus of the underdamped second-order closed-loop system
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
xlim([-700 50]);
ylim([-80 80]);
title('Root locus of underdamped second-order closed-loop system in Problem 6.25', 'interpreter', 'latex');
subtitle('$\omega_{n} = 5\pi rad/s, b_s = m_s*m_u, k_s = f_n*k_u, k_u = 200000 N/m, b_u = 0, m_u = 40kg, m_s = 600kg, f_n = 2.5 Hz, \zeta = 0.08$', 'interpreter', 'latex');
