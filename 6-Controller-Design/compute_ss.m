%% P6.25: The state-space form of the ODEs
function sys = compute_ss(k_s, b_s)
% compute_ss Function to compute the state-space form of the ODEs given in
% P6.25.
% sys = compute_ss(k_s, b_s) returns the system formed by the state-space
% realization with specified input parameters k_s and b_s. These values are
% the spring stiffness (Nm) and shock absorber damping coefficient (kg/s).
    % Load the data in P6.25
    load('Problem6_25');
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
end