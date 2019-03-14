%Joanna Binek

W=@(x) x.^3-2.*x.^2-11.*x+12; %wielomian W z zadania
x0=6;  %warunek pocz¹tkowy podawany do funkcji NR_method
eps=0.0001; %dok³adnoœæ epsilon podawana jako warunek stopu do funkcji NR_method
max_iter=1000;  %maxymalna liczba iteracji podawana jako warunek stopu do funkcji NR_method
Wprim=@(x) 3.*x.^2-4.*x-11; %pierwsza pochodna wielomianu W
WprimPrim=@(x) 6.*x -4; %druga pochodna wielomianu W
%roots -3, 1, 4

figure()
hold on
fplot(W);  %pomocnicze wyrysowanie wielomianu W
fplot(Wprim); %pomocnicze wyrysowanie W'
fplot(WprimPrim); %pomocnicze wyrysowanie W''
xlabel("x");
ylabel("y");
xlim([-2 6]);
title("Wykres W, W', W'' z wyliczonym pierwiastkiem")
%ylim([0 10]);
grid on


a=2;  %rozpatrywany przedzia³ [a,b]
b=8;

root=NR_method(W,Wprim,x0,eps,max_iter,a,b) %wyliczenie pierwiastka za pomoc¹ NR_nethod
plot(root,W(root),"o"); %pomocnicze wyrysowanie wyliczonego pierwiastka
legend(["wielomian W","pierwsza pochodna wielomianu - W'","druga pochodna wielomianu - W''","znaleziony pierwiastek"])

hold off


%implementacja metody Newtona-Raphsona
function [X] = NR_method(W,Wprim,x0,eps,max_iter,a,b)
    if(W(a)*W(b)>0)
        X=x0;
        disp("te same znaki na koñcach przedzia³u");
        return;
    end
    for i=1:max_iter
        x1=x0;
        x0=x0-W(x1)/Wprim(x1);
        if(abs(x1-x0)<=eps || abs(W(x0))<=eps || a>x0 || b<x0)  
            X= x0;
           disp("koniec");
            return;
        end
    end
 end