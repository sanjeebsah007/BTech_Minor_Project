function dx = STSMC_ELS2(t,x)
Jm = 0.000697; bm = 0.00018; N = 35;
Kg = 85000; f = 1;
thlr = 8*pi/(180*f)*sin(2*pi*f*t);
Tref = 2250*f*thlr/pi;
thlrd = 8*pi/(180*f)*2*pi*f*cos(2*pi*f*t);
thlrdd = -2*pi*f*8*pi/(180*f)*2*pi*f*sin(2*pi*f*t);
Trefd = 2250*f*thlrd/pi;
c = 45000; b = 990;
e1 = Tref-x(1);e2 = Trefd-x(2);
u = 8000000*e1 + 500*e2 + 2000*x(3);
k2 = bm/Jm;k3 = Kg/(N^2*Jm);k4 = Kg; k5 = Kg*bm/Jm;
Phi = -k2*x(2)-k3*x(1)-k4*thlrdd-k5*thlrd;
x1dot = x(2);
x2dot = u+Phi;
x3dot = e1;
dx = [x1dot;x2dot;x3dot];
end
