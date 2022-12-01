clc;close all;close all;
[t1,x1] = ode45(@STSMC_ELS3,[0 2],[0 0 0]);
[t2,x2] = ode45(@STSMC_ELS2,[0 2],[0 0 0]);
f = 1;
thlr = 8*pi/(180*f)*sin(2*pi*f*t1);
Tref = 2250*f*thlr/pi;
thlrd = 8*pi/(180*f)*2*pi*f*cos(2*pi*f*t1);
thlrdd = -2*pi*f*8*pi/(180*f)*2*pi*f*sin(2*pi*f*t1);
Trefd = 2250*f*thlrd/pi;
c = 45000; b = 990;
e11 = Tref-x1(:,1);e21 = Trefd-x1(:,2);
S = e21 + c*e11;
u1 = c*sqrt(abs(S).*sign(S)+x1(:,3));

thlr2 = 8*pi/(180*f)*sin(2*pi*f*t2);
Tref2 = 2250*f*thlr2/pi;
thlrd2 = 8*pi/(180*f)*2*pi*f*cos(2*pi*f*t2);
thlrdd2 = -2*pi*f*8*pi/(180*f)*2*pi*f*sin(2*pi*f*t2);
Trefd2 = 2250*f*thlrd2/pi;
e12 = Tref2-x2(:,1);e22 = Trefd2-x2(:,2);
u2 = 8000000*e12 + 500*e22 + 2000*x2(:,3);
figure(1)
subplot(211)
plot(t1,x1(:,1));
hold on
plot(t1,Tref,':r');
subplot(212)
plot(t2,x2(:,1));
hold on
plot(t2,Tref2,':r');
figure(2)
subplot(211)
plot(t1,e11);
hold on
plot(t2,e12,':r');
subplot(212)
plot(t1,e21);
hold on
plot(t2,e22,':r');
figure(3)
plot(t1,S);
figure(4)
plot(t1,u1);
hold on
plot(t2,u2,':r')


