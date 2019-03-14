%Joanna Binek

x0=1.5;  %wartoœæ startowa

WPC=[-1.5, -1, -0.7, 0, 0.1, 1, 1.5]; %wartoœci jakie przyjmuja kolejno labmdy w uk.dyskretnym, i alfa w uk³adzie ci¹g³ym
%L=labmda
open('JoannaBinekModelZad1');
alfa=WPC(i);

% analiza równania ró¿nicowego
for i=1:length(WPC)
    figure()
    %hold on
    L=WPC(i);
    sim('JoannaBinekModelZad1');
    plot(0:length(out)-1,out,'o');
    %plot(tout,out2);
    grid on;
    xlabel('k');
    ylabel('x(k)');
    title(['Uk³ad dyskretny, lambda = ' num2str(L)]);
    xlim([0 11]);
    ylim([-4 4]);
    %hold off
end

%analiza równania ró¿niczkowego
for i=1:length(WPC)
    figure()
    %hold on
    alfa=WPC(i);
    sim('JoannaBinekModelZad1');
    %plot(0:length(out)-1,out,'o');
    plot(tout,out2);
    grid on;
    xlabel('t');
    ylabel('x(t)');
    title(['Uk³ad ci¹g³y, alfa = ' num2str(alfa)]);
    xlim([0 11]);
    ylim([-4 4]);
    %hold off
end

    