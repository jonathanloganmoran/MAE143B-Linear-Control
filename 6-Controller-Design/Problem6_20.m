%% The one-eighth-car model, shown in Fig 6.26(a), models the suspension 
% dynamics of a car. The ODE: m\ddot{x} + b\dot{x} + kx = b\dot{y} + ky,
% consititutes a simplified description of the motion of this model,
% where x is a displacement measured from equilibrium. The mass m
% represents 1/4 of the total mass of the car. The constants k and b are
% the stiffness and damping coefficients of the spring and shock absorber.

%% P6.20: Calculate the value of the spring stiffness, k, and shock
% absorber damping coefficient, b, for a car with 1/4 mass equal to
% 640kg to have a natural frequency f_n = 2.5Hz and damping ratio
% zeta = 0.08.

% Load data from P6.20
f_n = 2.5;                      % Natural frequency (Hz)
zeta = 0.08;                    % Damping ratio
m = 640;                        % kg

% From the second-order continuous transfer function
w_n = 2*pi*f_n;                 % Natural frequency (rad/s)
b = 2*zeta*w_n*m;               % Shock absorber damping coefficient
k = m*w_n^2;                    % Spring stiffness

%% P6.20: Calculate the transfer-function from the road profile, y, to the 
% mass relative displacement, z.
s = tf('s');
num = -1*s^2;
denom = s^2 + (b/m)*s + (k/m);
G = num / denom;
sys = tf(G);

%% P6.20: Locate the roots in the complex plane.
figure;
pzplot(sys)
text(real(roots([-1 0 0])) - 1.5, imag(roots([-1 0 0])) + 1.5, 'Zero')
text(real(roots([1 b/m k/m])) - 1.5, imag(roots([1 b/m k/m])) + 1.5, 'Pole')
axis equal
a = findobj(gca, 'type', 'line')
for i = 1:length(a)
    set(a(i), 'markersize', 8)
    set(a(i), 'linewidth', 2)
end
title('Problem 6.20: Poles and zeros of the continuous second-order system', 'interpreter', 'latex');
subtitle('$\omega_{n} = 5\pi rad/s, b = 512\pi, k = 16000\pi^2, \zeta = 0.08, m = 640kg$', 'interpreter', 'latex');