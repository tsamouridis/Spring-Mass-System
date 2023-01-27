function dxdt = odefun_sliding_case2(t, x, system_parameters)
% differential equation of the system using sliding method control for
% known absolute upper bound of function f
    m = system_parameters(2);
    mu = system_parameters(3);
    g = system_parameters(4);
    
    m_hat = 5/4;
    mu_hat = 5/8;
    
    lambda = 10;
    f_hat = 0;
    f = 5+0.6*exp(-0.045*t)*x(1)*(1+0.9*(x(1)^2));
    xd = 2+sin(2.5*t)+2*cos(1.25*t);
    xd_dot = 2.5* cos(2.5*t) - 2.5*sin(1.25*t);
    xd_ddot = -6.25* sin(2.5*t) - 3.125*cos(1.25*t);
    
    e = x(1)-xd;
    e_dot = x(2)-xd_dot;
    
    s = e_dot+lambda*e;
    rho = 22*norm(x(1))^3 + 2*g + 3/4*(xd_ddot-lambda*e_dot);
    
    u = f_hat+m_hat*mu_hat*g*sign2(x(2), x(1)) + m_hat*(xd_ddot-lambda*e_dot)-rho*sat(s);
    
    dxdt = [x(2); u/m-f/m-mu*g*sign2(x(2), x(1))];
end