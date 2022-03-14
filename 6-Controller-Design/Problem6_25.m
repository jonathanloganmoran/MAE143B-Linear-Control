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
k_u = 200000;                   % Tire stiffness (Nm)
b_u = 0;                        % Tire damping coefficient
m_s = 600;                      % 1/4 mass of car w/o wheels (kg)
m_u = 40;                       % Mass of a single wheel (kg)
f_n = 2.5;                      % Natural frequency (Hz)
w_n = 2*pi*f_n;                 % Natural frequency (rad/s)
zeta = 0.08;                    % Damping ratio
% Save the data in P6.25
save('Problem6_25');
%% P6.25: Select values of k_s and b_s
% Initialize model parameters
syms k_s b_s
% Substitute parameters with arbitrary values
k_s = 2.5*k_u;                  % Spring stiffness (Nm)
b_s = m_s*m_u;                  % Shock absorber damping coefficient (kg/s)

%% P6.25: Calculate the transfer function of the system
% from the road profile, y, to the relative displacement x + z
sys = compute_ss(k_s, b_s);
G = tf(sys);

%% P6.25: Select values of k_s and b_s
% Choosing the following parameters such that the poles of G(s) have the
% desired frequency w_n = 2*pi*f_n and damping ratio zeta = 0.08.
[w_n, zeta] = damp(G);          % Match the expected values below

% Choosing new values of parameters so the expected values match
k_s = 460300;                   % Spring stiffness (Nm)
b_s = 22100;                    % Shock absorber damping coefficient (kg/s)

% Recompute the transfer function of the system with new parameter values
sys = compute_ss(k_s, b_s);
G = tf(sys);

% Check if system has the desired poles
[w_n, zeta] = damp(G);          % Match the expected values below

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
axis equal;
a = findobj(gca, 'type', 'line')
for i = 1:length(a)
    set(a(i), 'markersize', 8)
    set(a(i), 'linewidth', 2)
end
title('Poles and zeros of the continuous second-order system in Problem 6.25', 'interpreter', 'latex');
subtitle('$\omega_{n} = 5\pi rad/s, b_s = 22,100 kg/s, k_s = 460,300 Nm, k_u = 200000 Nm, b_u = 0, m_u = 40kg, m_s = 600kg, f_n = 2.5 Hz, \zeta = 0.08$', 'interpreter', 'latex');

% Plotting root locus of the underdamped second-order closed-loop system
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
% Plotting the original zeta and w_n values
sgrid(0.08, 5*pi);
xlim([-600 800]);
ylim([-80 80]);
title('Root locus of underdamped second-order closed-loop system in Problem 6.25', 'interpreter', 'latex');
subtitle('$\omega_{n} = 5\pi rad/s, b_s = 22,100 kg/s, k_s = 460,300 Nm, k_u = 200000 Nm, b_u = 0, m_u = 40kg, m_s = 600kg, f_n = 2.5 Hz, \zeta = 0.08$', 'interpreter', 'latex');
