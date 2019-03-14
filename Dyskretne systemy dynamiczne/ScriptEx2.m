%Joanna Binek

I=6; %liczba liter w Joanna
N=5; %liczba liter w Binek

%dane z zadania dla modelu ci¹g³ego
B= [0 ;1]; 
C=eye(2);  
A=[0 1 ;-I -N];  
D=[0 ;0];

h=0.4;  %okres próbkowania
s = sym('s');  %sta³a symboliczna s potrzebna do obliczenia ca³ki

WPC=[1;-1]; %wartoœci startowe

%dane dla modelu dyskretnego
Aprim=expm(h*A);
Bprim=double( int( expm( s*A )*B, s, 0, h ) );
Cprim=C;


open('JoannaBinekModelZad2');
sim('JoannaBinekModelZad2');
figure()
hold on
plot(tout,ukciagly); %wykres uk³adu ci¹g³ego
plot(h*(0:length(ukdyskretny)-1),ukdyskretny,'o'); %wykres uk³adu dyskretnego
legend(["uk³ad ci¹g³y x", "uk³ad ci¹g³y y","uk³ad dyskretny x","uk³ad dyskretny y"])
xlabel('t');
ylabel('x,y');
grid on
title('Uk³ad ci¹g³y (dla WPC=[1;-1]) i uk³ad dyskretny dla h=0.4');
hold off
