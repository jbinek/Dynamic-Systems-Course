%Joanna Binek

open('JoannaBinekModelZad3');  %otwarcie modelu
n=30;  %liczba

K0=50000; %kapita� pocz�tkowy
r=0.03;  %oprocentowanie
m=2;    %okresy kapitalizacji w roku
A=(1+(r/m))^(m);  %macierz A do r�wnania np wzoru z konspektu

sim('JoannaBinekModelZad3');
figure();
plot((0:n)*(12/m),output,'p');
title("Oprocentowanie roczne 3% kapitalizacja co 6 miesi�cy")
xlabel("czas [miesi�c]");
ylabel("kapita�");

%r=0.3;
m=4;
A=(1+(r/m))^(m);
sim('JoannaBinekModelZad3');
figure();
plot((0:n)*(12/m),output,'p');
title("Oprocentowanie roczne 3% kapitalizacja co 3 miesi�ce")
xlabel("czas [miesi�c]");
ylabel("kapita�");

%r=0.04;
m=6;
A=(1+(r/m))^(m);
sim('JoannaBinekModelZad3');
figure();
plot((0:n)*(12/m),output,'p');
title("Oprocentowanie roczne 3% kapitalizacja co 2 miesi�ce")
xlabel("czas [miesi�c]");
ylabel("kapita�");


%r=0.6;
m=12;
A=(1+(r/m))^(m);
sim('JoannaBinekModelZad3');
figure();
plot((0:n)*(12/m),output,'p');
title("Oprocentowanie roczne 3% kapitalizacja co 1 miesi�c")
xlabel("czas [miesi�c]");
ylabel("kapita�");

m=24;
A=(1+(r/m))^(m);
sim('JoannaBinekModelZad3');
figure();
plot((0:n)*(12/m),output,'p');
title("Oprocentowanie roczne 3% kapitalizacja co 0.5 miesi�ca")
xlabel("czas [miesi�c]");
ylabel("kapita�");