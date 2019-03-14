%Joanna Binek

%skrypt docelowo wyœwietla wszystkie 9 portretów fazowych, ale umo¿lwia
%równie¿ wyœwietlenie dowolnej iloœci przez modyfikacjê zmiennej portrety w
%linii 36 która zawiera indeksy portretów do wyrysowania zgodnie z podan¹
%ni¿ej kolejnoœci¹:
%1.punkt
%2.proste poziome
%3.proste pionowe 
%4.wêze³
%5.wêze³ gwiaŸdzisty
%6.wêze³ zdegenerowany
%7.siod³o 
%8.centrum
%9.ognisko

%ustawienie macierzy przejœcia P na jednostkow¹ o wymiarze 2x2
P=eye(2);

%pomocnicza macierz P wykorzystana przy testowaniu wp³ywu wektorów w³asnych
%na portrety fazowe
%P=[ 50 10;-10 50 ];


%stworzenie listy macierzy Jordana zgodnie z kolejnoœci¹ jak na rysunku 1.10
JordanList(:,:,1)=[ 0  0;0  0];
JordanList(:,:,2)=[ 0  1;0  0];
JordanList(:,:,3)=[ 0  0;0 -1];
JordanList(:,:,4)=[-2  0;0 -1];
JordanList(:,:,5)=[-1  0;0 -1];
JordanList(:,:,6)=[-1  1;0 -1];
JordanList(:,:,7)=[-1  0;0  1];
JordanList(:,:,8)=[ 0 -1;1  0];
JordanList(:,:,9)=[-1 -1; 1 -1];

portrety=[1 2 3 4 5 6 7 8 9]; %indeksy rozwa¿anych portretów fazowych (potrzebne do pêtli)


%stworzenie listy tytu³ów dla odpowiednich portretów fazowych
titleList = {
    'punkt {\lambda_1}={\lambda_2}=0 z dzielnikiem liniowym'
    'proste poziome {\lambda_1}={\lambda_2}=0 z dzielnikiem nieliniowym'
    'proste pionowe {\lambda_1}=0 {\lambda_2}=-1'
    'wêze³ {\lambda_1}=-2 {\lambda_2}=-1'
    'wêze³ gwiaŸdzisty{\lambda_1}={\lambda_2}=-1 z dzielnikiem liniowym'
    'wêze³ zdegenerowany{\lambda_1}={\lambda_2}=-1 z dzielnikiem nieliniowym'
    'siod³o {\lambda_1}=-1 {\lambda_2}=1'
    'centrum {\lambda_1}=0 + i {\lambda_2}=0 - i'
    'ognisko {\lambda_1}= -1 + i {\lambda_2}= -1 - i'
};


i=1;  %licznik pomocniczy do wstawiania do listy z WPC
for x=-3*pi:3*pi %wybrany zakres
    for y=-3*pi:3*pi
    WPC_list(:,:,i)=[x;y];  %wstawienie do listy z WPC
    i=i+1;
    end
end

open('Joanna_Binek_model2')   %otwarcie modelu
for portrety=portrety
    figure()
    J=JordanList(:,:,portrety);  %wybranie odpowiedniej macierzy Jordana z listy w zale¿noœci od wybranej z menu opcji
    A=P*J*P^-1;  %reprezentacja macierzy A jako iloczyn macierzy P * macierz Jordana * odwrócona macierz P
    
    hold on;  % rysowanie w aktywnym oknie, bez tracenia poprzednich wykresów
    for k=1:i-1  %przejœcie przez listê WPC
        WPC=WPC_list(:,:,k);  %wybranie odpowiedniego WPC
        sim('Joanna_Binek_model2')  %przeprowadzenie symulacji
        x1 = x(:, 1); % wybieranie x1
        x2 = x(:, 2); % wybieranie x2
        plot(x1,x2,'k')  %narysowanie wykresu
    end
  

     %wykreœlenie prostych powi¹zanych z wektorami w³asnymi
    punkty=P(:,1).*linspace(-20,20);
    line(punkty(1,:),punkty(2,:),'Color','green','LineStyle','--')
    
    punkty=P(:,2).*linspace(-20,20);
    line(punkty(1,:),punkty(2,:),'Color','green','LineStyle','--')
  
%     u¿ywam funkcji plotv ¿eby zaznaczyæ na wykresie wektory w³asne z
%     macierzy P
      plotv(P(:,1),'-')  %wektor pierwszy
      plotv(P(:,2),'-')  %wektor drugi 
     
    
    hold off;  %wy³¹czenie opcji rysowania wielu wykresów w 1 oknie   
       
    title(strcat('Portret fazowy typu: ', titleList(portrety))); %nadanie tytu³u wykresu
    xlabel('x1'); %podpisanie osi
    ylabel('x2');
    xlim([-10 10]); % ustawienie zakresu na osiach
    ylim([-10 10]);
    grid on; % ustawienie siatki
    
    
end
