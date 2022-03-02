%% The one-eighth-car model, shown in Fig 6.26(a), models the suspension 
% dynamics of a car. The ODE: m\ddot{x} + b\dot{x} + kx = b\dot{y} + ky,
% consititutes a simplified description of the motion of this model,
% where x is a displacement measured from equilibrium. The mass m
% represents 1/4 of the total mass of the car. The constants k and b are
% the stiffness and damping coefficients of the spring and shock absorber.

% Load data from P6.20
f_n = 2.5;                      % Natural frequency (Hz)
zeta = 0.08;                    % Damping ratio
m = 640;                        % kg

% From the second-order continuous transfer function
w_n = 2*pi*f_n;                 % Natural frequency (rad/s)
b = 2*zeta*w_n*m;               % Shock absorber damping coefficient
k = m*w_n^2;                    % Spring stiffness

%% P6.23: Show that m\ddot{z} = u - m\ddot{y}, u = -(kz + b\dot{z}),
% from which u can be interpreted as the output of the PD controller.
s = tf('s');
Z = -1 / s^2;           % The transfer function of the input Z(s) w.r.t
G = Z;                  % the disturbance D(s) given by \ddot{y}

%% Repeat the root locus method from P6.20:
% Plotting pole-zero map of the underdamped second-order open-loop system
figure;
subplot(2, 1, 1);
pzplot(G);
axis equal;
%xlim([-0.15 0.15]);
title('Pole-zero plot of underdamped second-order open-loop system in Problem 6.23', 'interpreter', 'latex');
subtitle('$m = 640kg, f_n = 2.5Hz, \zeta = 0.08$', 'interpreter', 'latex');

% Plotting root locus of the underdamped second-order closed-loop system
z1 = -k/b;
z2 = real(roots([1 zeta*w_n]));     % Real part of the roots
K_p = 1;                            % The proportional gain
K = K_p*(s-z1)*(s-z2);              % The dynamic feedback controller
sys = -K*G;
subplot(2, 1, 2);
rlocusplot(sys);
axis equal;
xlim([-150 20]);
title('Root locus of underdamped second-order closed-loop system in Problem 6.23', 'interpreter', 'latex');
subtitle('$G(s) = \frac{-1}{s^2}, K(s) = k(s-\frac{k}{b})(z-\Re\{2\zeta w_n\})$', 'interpreter', 'latex');
legend('$\frac{k}{b} = \frac{w_n}{2\zeta}, \frac{-1}{m} = \Re\{\zeta\omega_n\}$', 'interpreter', 'latex');