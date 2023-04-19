%% zadanie 2
clear; clc;
dt = 0.01;
x = zeros(30/0.01+1);
v = zeros(30/0.01+1);
ek = zeros(30/0.01+1);
pot = zeros(30/0.01+1);
x(1) = 2.8;
v(1) = 0;
pot(1) = potencjal(x(1));
ek(1) = 0;
time = 0:0.01:30;
for i=2:1:(30/0.01+1)
    x(i) = location(x(i-1),v(i-1),dt);
    v(i) = vel(x(i-1),v(i-1),dt,.5);
    pot(i) = potencjal(x(i));
    ek(i) = 0.5*v(i)^2;
end
figure,plot(time,x);
title("Położenie od czasu, dla dt = 0.01s i alpha = 0.5");
figure,plot(time,v);
title("Prędkość od czasu, dla dt = 0.01s i alpha = 0.5");
figure,plot(time,ek);
title("Energia kinetyczna od czasu, dla dt = 0.01s i alpha = 0.5");
figure,plot(time,pot);
title("Potencjał od czasu, dla dt = 0.01s i alpha = 0.5");

for i=2:1:(30/0.01+1)
    x(i) = location(x(i-1),v(i-1),dt);
    v(i) = vel(x(i-1),v(i-1),dt,5);
    pot(i) = potencjal(x(i));
    ek(i) = 0.5*v(i)^2;
end
figure,plot(time,x);
title("Położenie od czasu, dla dt = 0.01s i alpha = 5");
figure,plot(time,v);
title("Prędkość od czasu, dla dt = 0.01s i alpha = 5");
figure,plot(time,ek);
title("Energia kinetyczna od czasu, dla dt = 0.01s i alpha = 5");
figure,plot(time,pot);
title("Potencjał od czasu, dla dt = 0.01s i alpha = 5");

for i=2:1:(30/0.01+1)
    x(i) = location(x(i-1),v(i-1),dt);
    v(i) = vel(x(i-1),v(i-1),dt,201);
    pot(i) = potencjal(x(i));
    ek(i) = 0.5*v(i)^2;
end
figure,plot(time,x);
title("Położenie od czasu, dla dt = 0.01s i alpha = 201");
figure,plot(time,v);
title("Prędkość od czasu, dla dt = 0.01s i alpha = 201");
figure,plot(time,ek);
title("Energia kinetyczna od czasu, dla dt = 0.01s i alpha = 201");
figure,plot(time,pot);
title("Potencjał od czasu, dla dt = 0.01s i alpha = 201");

%% Funkcyjki
function res = potencjal(x)
    res = - exp(-x*x) - 1.2*exp(-(x-2)*(x-2));
end
function result = vel(xn,vn,dt,alpha)
    result = vn - dt*0.5*(potencjal(xn+0.01)-potencjal(xn-0.01))/0.01-alpha*vn*dt;
end
function result = location(xn,vn,dt)
    result = xn + vn*dt;
end