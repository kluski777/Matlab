% %% Zadanie 1
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
    v(i) = vel(x(i-1),v(i-1),dt,0);
    pot(i) = potencjal(x(i));
    ek(i) = 0.5*v(i)^2;
end
figure,plot(time,x);
title("Położenie od czasu, dla dt = 0.01s i alpha = 0");
xlabel("Czas[s]")
ylabel("Położenie [m]")
figure,plot(time,v);
title("Prędkość od czasu, dla dt = 0.01s i alpha = 0");
xlabel("Czas[s]")
ylabel("Prędkość [m/s]")
figure,plot(time,ek);
xlabel("Czas[s]")
ylabel("Energia kinetyczna")
title("Energia kinetyczna od czasu, dla dt = 0.01s i alpha = 0");
figure,plot(time,pot);
xlabel("Czas[s]")
ylabel("Potencjał [J]")
title("Potencjał od czasu, dla dt = 0.01s i alpha = 0");

%% Nareszcie zadanie 3
clear; clf;
dx = 0.01;
dt = 0.01;
dokladnosc = 0.00001;
ForceArray = [1 1];
container = zeros([2 2]);
xv = [2.8 0];
arb = [0 0;];
i = 1;
while(abs(ForceArray(1)) > dokladnosc || abs(ForceArray(2)) > dokladnosc)
    ForceArray = [(arb(end,1)-xv(end,1)-dt*arb(end,2)/2-dt*xv(end,2)/2) (arb(end,2)-xv(end,2)+dt*(((potencjal(arb(end,1)+dx)-potencjal(arb(end,1)-dx))/dx))/4+dt*(((potencjal(xv(end,1)+dx)-potencjal(xv(end,1)-dx))/dx))/4)];
    arb(end,:) = arb(end,:) - ForceArray/[1 -dt/2;dt*((potencjal(arb(1,end)+dx)+potencjal(arb(1,end)-dx)-2*potencjal(arb(1,end)))/dx^2)/2 1];
    disp("Dla iteracji "+i+" otrzymujemy położenie i prędkość:");
    disp(arb);
    i = i+1;
end

xv(:,end+1) = arb(:,end); % porównać z poprzednimi zadaniami

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