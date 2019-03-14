%Joanna Binek


freqTab = [2 29.5 29 35 70 120]; %testowane czêstotliwoœci
amp = [0.1 10 1000];   %testowane amplitudy



open('model1_lab4_Joanna_Binek');
for a = amp   %dla ka¿dej z trzech testowanych warotœci amplitud
    figure
    hold on
    for freq = freqTab 
        sim('model1_lab4_Joanna_Binek');
        plot(tout,output);  %rysuje wykres z testowanymi czêstotliwoœciami 
        legend('f=2 Hz','f=29.5 Hz','f=29 Hz','f=35 Hz','f=70 Hz','f=120 Hz');
    end
    xlabel('czas [s]');
   title(strcat('Wykres sygna³u wyjœciowego dla A=',num2str(a)));
    grid on
    ylabel('amplituda');
    hold off
end    





