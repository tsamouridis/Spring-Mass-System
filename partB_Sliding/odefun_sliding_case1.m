function dxdt = odefun_sliding_case1(t, x, system_parameters)
% differential equation of the system using sliding method control for
% unknown parameters of function f
    k = system_parameters(1);
    m = system_parameters(2);
    mu = system_parameters(3);
    g = system_parameters(4);
    
    m_hat = 5/4;
    mu_hat = 5/8;
    k_hat = 7;
    Dk_hat = 5/8;
    a_hat = 3/4;
    b_hat = 0.03;
    
    lambda = 10;
    
    f = 5+0.6*exp(-0.045*t)*x(1)*(1+0.9*(x(1)^2));
    xd = 2+sin(2.5*t)+2*cos(1.25*t);
    xd_dot = 2.5* cos(2.5*t) - 2.5*sin(1.25*t);
    xd_ddot = -6.25* sin(2.5*t) - 3.125*cos(1.25*t);
    
    e = x(1)-xd;
    e_dot = x(2)-xd_dot;
    
    s = e_dot+lambda*e;
    rho = 309/64*norm(x(1))+41/8*norm(x(1)^3)+2*g+3/4*norm(xd_ddot-lambda*e_dot);
    
    u = k_hat*x(1)+k_hat*a_hat*(x(1))^3+Dk_hat*x(1) + Dk_hat*(x(1))^3 - ...
        Dk_hat*exp(-b_hat*t)*x(1)- Dk_hat*a_hat*exp(-b_hat*t)*(x(1))^3 +...
        m_hat*mu_hat*g*sign2(x(2), x(1))+m_hat*(xd_ddot-lambda*e_dot)-rho*sat(s);
    
    dxdt = [x(2); u/m-f/m-mu*g*sign2(x(2), x(1))];
end