%Joanna Binek

%filtr dolnoprzepustowy 
gd1 = [1];
gd2 = [4 1];
Gd = tf(gd1,gd2);

%filtr górnoprzepustowy
gg1 = [0.4 0];
gg2 = [0.4 1];
Gg = tf(gg1,gg2);

%filtr pasmoprzepustowy
gp1 = [1 0];
gp2 = [1 2 1];
Gp = tf(gp1,gp2);

%filtr drugiego rzêdu
g21 = [1];
g22 = [1 0.1 1];
G2 = tf(g21,g22);

%parametry z zadania
phi = [1 5 2 1 0];
omega = [0.001 1 30 0.01 5];
amp = [2 3 1 2 4];

%charakterystki filtrów
figure
bode(Gd);
title('Filtr dolnoprzepustowy');
figure
bode(Gg);
title('Filtr górnoprzepustowy');
figure
bode(Gp);
title('Filtr pasmoprzepustowy');
figure
bode(G2);
title('Filtr drugiego rzêdu');



open('model3part1_lab4_Joanna_Binek');
for i = 1:5
    A=amp(i);
    PHI = phi(i);
    om = omega(i);
    sim('model3part1_lab4_Joanna_Binek');
    figure
    hold on 
    plot(tout,input_signal); %wykres sygna³u wejœciowego
    plot(tout,out);    %wykres sygna³u przefiltorwanego przez filtr dolnoprzepustowy
    plot(tout,out2);    %wykres sygna³u przefiltorwanego przez filtr górnoprzepustowy
    plot(tout,out3);    %wykres sygna³u przefiltorwanego przez filtr pasmoprzepustowy
    plot(tout,out4);    %wykres sygna³ów przefiltorwanego przez filtr drugiego rzêdu
    grid on
    legend('sygna³ wejœciowy','filtr Gd','filtr Gg','filtr Gp','filtr G2')
    title (strcat('Wykres przefiltrowanego sygna³u A= ',num2str(a), ' {\omega}= ',num2str(om), ' {\phi}= ',num2str(PHI)))
    hold off
end

%wykresy przefiltorwanych sum podanych sygna³ów


open('model3part2_lab4_Joanna_Binek');
%filtr Gd
sim('model3part2_lab4_Joanna_Binek');
figure
hold on
plot(tout,input_signal);
plot(tout,out);
plot(tout,out2,'--');
title('Suma sygna³ów  sinusoidalnych przefiltrowanych przez filtr Gd')
legend('sygna³ wejœciowy','suma wejœcia','suma wyjœcia')
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
title('Suma sygna³ów  sinusoidalnych przefiltrowanych przez filtr Gg')
legend('sygna³ wejœciowy','suma wejœcia','suma wyjœcia')
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
title('Suma sygna³ów  sinusoidalnych przefiltrowanych przez filtr Gp')
legend('sygna³ wejœciowy','suma wejœcia','suma wyjœcia')
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
title('Suma sygna³ów  sinusoidalnych przefiltrowanych przez filtr G2')
legend('sygna³ wejœciowy','suma wejœcia','suma wyjœcia')
hold off
