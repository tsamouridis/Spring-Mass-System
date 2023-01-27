function dxdt = odefun(t, x, system_parameters)
% Differential equation of the system without any control input
    k = system_parameters(1);
    m = system_parameters(2);
    mu = system_parameters(3);
    g = system_parameters(4);
    
    dxdt = [sqrt(k/m)*x(2); -sqrt(m/k)*mu*g*sign2(sqrt(k/m)*x(2), x(1))-sqrt(k/m)*x(1)];
end