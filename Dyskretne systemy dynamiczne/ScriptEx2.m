%Joanna Binek

I=6; %liczba liter w Joanna
N=5; %liczba liter w Binek

%dane z zadania dla modelu ci�g�ego
B= [0 ;1]; 
C=eye(2);  
A=[0 1 ;-I -N];  
D=[0 ;0];

h=0.4;  %okres pr�bkowania
s = sym('s');  %sta�a symboliczna s potrzebna do obliczenia ca�ki

WPC=[1;-1]; %warto�ci startowe

%dane dla modelu dyskretnego
Aprim=expm(h*A);
Bprim=double( int( expm( s*A )*B, s, 0, h ) );
Cprim=C;


open('JoannaBinekModelZad2');
sim('JoannaBinekModelZad2');
figure()
hold on
plot(tout,ukciagly); %wykres uk�adu ci�g�ego
plot(h*(0:length(ukdyskretny)-1),ukdyskretny,'o'); %wykres uk�adu dyskretnego
legend(["uk�ad ci�g�y x", "uk�ad ci�g�y y","uk�ad dyskretny x","uk�ad dyskretny y"])
xlabel('t');
ylabel('x,y');
grid on
title('Uk�ad ci�g�y (dla WPC=[1;-1]) i uk�ad dyskretny dla h=0.4');
hold off
