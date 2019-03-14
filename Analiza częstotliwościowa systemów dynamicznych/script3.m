%Joanna Binek

%filtr dolnoprzepustowy 
gd1 = [1];
gd2 = [4 1];
Gd = tf(gd1,gd2);

%filtr g�rnoprzepustowy
gg1 = [0.4 0];
gg2 = [0.4 1];
Gg = tf(gg1,gg2);

%filtr pasmoprzepustowy
gp1 = [1 0];
gp2 = [1 2 1];
Gp = tf(gp1,gp2);

%filtr drugiego rz�du
g21 = [1];
g22 = [1 0.1 1];
G2 = tf(g21,g22);

%parametry z zadania
phi = [1 5 2 1 0];
omega = [0.001 1 30 0.01 5];
amp = [2 3 1 2 4];

%charakterystki filtr�w
figure
bode(Gd);
title('Filtr dolnoprzepustowy');
figure
bode(Gg);
title('Filtr g�rnoprzepustowy');
figure
bode(Gp);
title('Filtr pasmoprzepustowy');
figure
bode(G2);
title('Filtr drugiego rz�du');



open('model3part1_lab4_Joanna_Binek');
for i = 1:5
    A=amp(i);
    PHI = phi(i);
    om = omega(i);
    sim('model3part1_lab4_Joanna_Binek');
    figure
    hold on 
    plot(tout,input_signal); %wykres sygna�u wej�ciowego
    plot(tout,out);    %wykres sygna�u przefiltorwanego przez filtr dolnoprzepustowy
    plot(tout,out2);    %wykres sygna�u przefiltorwanego przez filtr g�rnoprzepustowy
    plot(tout,out3);    %wykres sygna�u przefiltorwanego przez filtr pasmoprzepustowy
    plot(tout,out4);    %wykres sygna��w przefiltorwanego przez filtr drugiego rz�du
    grid on
    legend('sygna� wej�ciowy','filtr Gd','filtr Gg','filtr Gp','filtr G2')
    title (strcat('Wykres przefiltrowanego sygna�u A= ',num2str(a), ' {\omega}= ',num2str(om), ' {\phi}= ',num2str(PHI)))
    hold off
end

%wykresy przefiltorwanych sum podanych sygna��w


open('model3part2_lab4_Joanna_Binek');
%filtr Gd
sim('model3part2_lab4_Joanna_Binek');
figure
hold on
plot(tout,input_signal);
plot(tout,out);
plot(tout,out2,'--');
title('Suma sygna��w  sinusoidalnych przefiltrowanych przez filtr Gd')
legend('sygna� wej�ciowy','suma wej�cia','suma wyj�cia')
hold off

%filtr Gg
gd1=gg1;
gd2=gg2;
sim('model3part2_lab4_Joanna_Binek');
figure
hold on
plot(tout,input_signal);
plot(tout,out);
plot(tout,out2,'--');
title('Suma sygna��w  sinusoidalnych przefiltrowanych przez filtr Gg')
legend('sygna� wej�ciowy','suma wej�cia','suma wyj�cia')
hold off

%filtr Gp
gd1=gp1;
gd2=gp2;
sim('model3part2_lab4_Joanna_Binek');
figure
hold on
plot(tout,input_signal);
plot(tout,out);
plot(tout,out2,'--');
title('Suma sygna��w  sinusoidalnych przefiltrowanych przez filtr Gp')
legend('sygna� wej�ciowy','suma wej�cia','suma wyj�cia')
hold off


%filtr G2
gd1=g21;
gd2=g22;
sim('model3part2_lab4_Joanna_Binek');
figure
hold on
plot(tout,input_signal);
plot(tout,out);
plot(tout,out2, '--');
title('Suma sygna��w  sinusoidalnych przefiltrowanych przez filtr G2')
legend('sygna� wej�ciowy','suma wej�cia','suma wyj�cia')
hold off
