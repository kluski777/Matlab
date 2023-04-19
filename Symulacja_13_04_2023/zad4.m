%% Zadanie 4
clear; clf;
V = @potencjal;
dx = 0.01;
dt = 0.1;
dokladnosc = 0.001;
time = 0:0.01:30;
ForceArray = [1 1];
x = zeros([1 length(time)]);
v = zeros([1 length(time)]);
ek = zeros([1 length(time)]);
pot = zeros([1 length(time)]);
x(1) = 2.8;
pot(1) = V(x(1));

% for i = 2:1:(30/0.01+1)
%     ForceArray = [1 1];
%     arb = [0 0;];
%     while(abs(ForceArray(1)) > dokladnosc || abs(ForceArray(2)) > dokladnosc)
%         ForceArray = [(arb(1)-x(i-1)-dt*arb(2)/2-dt*v(i-1)/2) (arb(2)-v(i-1)+dt*(((V(arb(1)+dx)-V(arb(1)-dx))/dx))/4+dt*(((V(x(i-1)+dx)-V(x(i-1)-dx))/dx))/4)];
%         arb = arb - ForceArray/[1 -dt/2;dt*((V(arb(1)+dx)+V(arb(1)-dx)-2*V(arb(1)))/dx^2)/2 1];
%     end
%     x(i) = arb(1);
%     v(i) = arb(2);
%     pot(i) = potencjal(x(i));
%     ek(i) = 0.5*v(i)^2;
% end
% 
% plot(time,x);
% title("Położenie od czasu, dla dt = 0.01s i alpha = 0");
% xlabel("Czas [s]")
% ylabel("Położenie [m]")
% figure,plot(time,v);
% title("Prędkość od czasu, dla dt = 0.01s i alpha = 0");
% xlabel("Czas [s]")
% ylabel("Prędkość [m/s]");
% figure, plot(time, ek+pot)
% title("Enegia od czasu, dla dt = 0.01s i alpha = 0");
% xlabel("Czas [s]")
% ylabel("Energia całkowita [J]");

for i = 2:1:(30/0.01+1)
    ForceArray = [1 1];
    arb = [0 0;];
    while(abs(ForceArray(1)) > dokladnosc || abs(ForceArray(2)) > dokladnosc)
        ForceArray = [arb(1)-x(i-1)-dt*arb(2)/2-dt*v(i-1)/2 arb(2)-v(i-1)+dt*((V(arb(1)+dx)-V(arb(1)-dx))/(2*dx)+201*arb(2))/2+dt*((V(x(i-1)+dx)-V(x(i-1)-dx))/(2*dx)/2+201*v(i-1))/2];
        arb = arb - ForceArray/[1 -dt/2;dt*((V(arb(1)+dx)+V(arb(1)-dx)-2*V(arb(1)))/dx^2)/2 1+dt*201/2];
    end
    x(i) = arb(1);
    v(i) = arb(2);
    pot(i) = potencjal(x(i));
    ek(i) = 0.5*v(i)^2;
end

plot(time,x);
title("Położenie od czasu, dla dt = 0.01s i alpha = 201");
xlabel("Czas [s]")
ylabel("Położenie [m]")
figure,plot(time,v);
title("Prędkość od czasu, dla dt = 0.01s i alpha = 201");
xlabel("Czas [s]")
ylabel("Prędkość [m/s]")
figure, plot(time, ek+pot)
title("Enegia od czasu, dla dt = 0.01s i alpha = 201");
xlabel("Czas [s]")
ylabel("Energia całkowita [J]");
figure, plot(time, ek)
title("Enegia potencjalna od czasu, dla dt = 0.01s i alpha = 201");
xlabel("Czas [s]")
ylabel("Energia potencjalna [J]");
figure, plot(time, ek+pot)
title("Enegia kinetyczna, dla dt = 0.01s i alpha = 201");
xlabel("Czas [s]")
ylabel("Energia kinetyczna [J]");

%% Funkcyjki
function res = potencjal(x)
    res = - exp(-x*x) - 1.2*exp(-(x-2)*(x-2));
end
