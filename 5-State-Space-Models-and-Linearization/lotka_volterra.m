%% P5.48: The Lotka-Volterra model
% A classical 2x2 first-order nonlinear system,
% with constants r, a, e, m such that
% dx_1/dt = rx_1 - ax_{1}x_{2},
% dx_2/dt = eax_{1}x_{2} - mx_{2},
% where x_1 is the population of the prey and x_2 the predator.
%
% Inputs:
%    t -     Time variable. Not used – equations are independent of time.
%    x -     Independent variable: the populations x_2 and y_2.
% Output:
%   dx -     Rate of range of the populations.
%
function dx = lotka_volterra(t, x, r, a, e, m)

% Define differential equations
dx = zeros(2, 1);
dx(1) = r * x(1) - a * x(1) * x(2);
dx(2) = e * a * x(1) * x(2) - m * x(2);