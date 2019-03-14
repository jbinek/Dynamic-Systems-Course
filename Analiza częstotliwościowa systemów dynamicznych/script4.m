%Joanna Binek
sqrt_z_imienia=sqrt(6);
nazwisko=5;

f_gr =sqrt_z_imienia+nazwisko/(2*pi); %  czêtotliwoœæ graniczna w Hz
%f = f_gr/64; 
tlumienie=20;


ile_filtrow=ceil(tlumienie./3); %ceil rounds a number to the next larger integer.
RC = 1/(2*pi*f_gr);
G = tf([1], [RC, 1]); %filtr poczatkowy
F=G^ile_filtrow;   %filtr koncowy


f_gr=f_gr*2*pi;
figure;
hold on;
bode(F,[f_gr],'x'); % zaznaczenie f_gr
bode(F);
grid on
hold off;


