%ustawienie parametrów
WPC=4;  %ustawienie warunku początkowego-x(0)=4,początkowe napięcie na kondensatorze [V]
R=10;   %ustawieniew wartości oporu na oporniku [Om]
C=0.1;   %ustawienie pojemności kondensatora  [F]
K=1/(R*C); %wyliczenie stałej do równania różniczkowego

open('model0JBinek'); %otwarcie modelu simulinkwego
sim('model0JBinek'); %przeprowadzenie symulacji

figure
plot(tout,x,tout,y); %narysowanie wykresu przedstawiającego stan i sterowanie gdzie y-wartości trajektorii sterowania w danych chwilach czasu, x-wartościo trajektorii stanu w danych chwilach czasu,tout-czas
xlabel('czas [s]');  %nazwanie osi OX
ylabel('napięcie [V]');  %nazwanie osi OY
title('Wykres zależności napięcia od czasu w obwodzie RC'); %tytuł wykresu
grid();  %dodanie siatki do wykresu
legend("x(t)","u(t)");  %dodanie legendy do wykresu