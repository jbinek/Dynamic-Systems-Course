%Joanna Binek

%----------------------------------------------------

%podpunkt 1
%funkcja f(x)=-x+ex^2
%poniewa¿ równanie f(x)=-x+ex^2 posiada dwa pierwiasti x=0 i x=1/e 
%to bêdê rozpatrywaæ te dwa przypadki


eps = 1;
funkcja_1 = @(t,x)  -x + eps*x^2; %deklaracja funkcji przy pomocy lambdy
figure
hold on;

%przypadek 1, xr=0
for wpc = -0.45:0.04:0.45  %start:step:stop
    sol = ode45(funkcja_1, [0 1], wpc); %metoda Dormanda-Prince
    plot1= plot(sol.x,  sol.y,  'b'); %rysowanie wykresu
    grid on
   plot2= plot(0, 0, 'o'); %zaznaczenie analizowanego punktu równowagi
end

%przypadek 2, xr=1/eps
for wpc = 0.8:0.05:1.2   %start:step:stop
    sol = ode45(funkcja_1, [0 1], wpc);
    plot3=plot(sol.x,  sol.y,  'y');
    plot4=plot(0, 1/eps, 'x');   %zaznaczenie sprawdzanego punktu
end
legend([plot1,plot2,plot3,plot4],["otoczenie xr=(0,0)","punkt xr=(0,0)","otoczenie xr=(0,1/eps)","punkt xr=(0,1/eps)"]);
title("Wykres ilustruj¹cy stabilnoœæ punktu równowagi w dziedzinie czasu" + newline +" dla funckji f(x)=-x+eps*x^2");
hold off
grid on
xlabel('t');
ylabel('x');

%-----------------------------------------------

%funkcja z przyk³adu nr 2 f(x) = -x(1);-x(2)^2

f2 = @(t, x)([-x(1); -x(2)^2]); 
figure  %wykres
hold on;
for wpc = -1:1
        for j = -0.1:0.01:0.2
            rozw = ode45(f2, [0, 5], [wpc j]); % metoda Dormanda-Prince
            plot(rozw.y(1, :), rozw.y(2, :), 'c'); %rysowanie portretu fazowego
            plot5=plot(0, 0, 'x');
        end
end
legend([plot5],["punkt xr=(0,0)"])
hold off;
grid on
title("Portret fazowy ilustruj¹cy stabilnoœæ punktu równowagi w dziedzinie czasu" + newline +" dla funckji f(x) = -x(1);-x(2)^2");
xlabel('t');
ylabel('x');

%funckja z przyk³adu nr 3: f(x)=[x(2);-2*x(1)-3x(1)^2-x(2)]

f3 = @(t,x)([x(2); -2*x(1)-3*x(1)^2-x(2)]); 
figure %wykres
hold on;
 for wpc = -1:0.05:1
    for j = -0.5:0.15:0.5
        rozw = ode45(f3, [0,0.6], [wpc j]); %metoda Dormanda-Prince
        plot(rozw.y(1,:), rozw.y(2,:), 'y'); %rysowanie portertu fazowego
       plot6= plot(0, 0, 'o');
       plot7= plot(-2/3, 0, 'x');
    end
 end
 legend([plot6,plot7],["punkt xr=(0,0)","punkt xr=(-2/3,0)"])
hold off;
grid on
title("Portret fazowy ilustruj¹cy stabilnoœæ punktu równowagi w dziedzinie czasu" + newline +" dla funckji f(x)=[x(2);-2*x(1)-3x(1)^2-x(2)]");
xlabel('t');
ylabel('x');

%podpunkt 2 

eps=0.05;
f = @(t,x)  -x + eps*x^2; 
xr0 = @(t,x) -x;  %linearyzacja dla xr=(0,0)
xr1 = @(t,x) x - 1/eps;  %linearyzacja dla xr=(0,1/eps)
figure
hold on;
for wpc = -4:0.5:2
    sol = ode45(f, [0 1], wpc);%metoda Dormanda-Prince
    plot(sol.x, sol.y, 'c');
    sol = ode45(xr0, [0 1], wpc);
    plot(sol.x, sol.y, 'm');
    sol = ode45(xr1, [0 1],wpc);
    plot(sol.x, sol.y, 'y');
end
legend("nieliniowa funckja f(x)","linearyzacja dla xr=0","linearyzacja dla xr=1/eps")
hold off;
grid on
title(strcat("Porównanie systemów nieliniowego i zlinearyzowanych"+newline+ "w zale¿noœci od wartoœci eps dla funkcji f(x)=-x + eps*x^2 i przy eps= "+num2str(eps)));%opis
xlabel('t');
ylabel('x');


%--

eps=0.25;
f = @(t,x)  -x + eps*x^2; 
xr0 = @(t,x) -x;
xr1 = @(t,x) x - 1/eps;
figure
hold on;
for wpc = -4:0.5:2
    sol = ode45(f, [0 1], wpc);%metoda Dormanda-Prince
    plot(sol.x, sol.y, 'c');
    sol = ode45(xr0, [0 1], wpc);
    plot(sol.x, sol.y, 'm');
    sol = ode45(xr1, [0 1],wpc);
    plot(sol.x, sol.y, 'y');
end
legend("nieliniowa funckja f(x)","linearyzacja dla xr=0","linearyzacja dla xr=1/eps")
hold off;
grid on
title(strcat("Porównanie systemów nieliniowego i zlinearyzowanych"+newline+ "w zale¿noœci od wartoœci eps dla funkcji f(x)=-x + eps*x^2 i przy eps= "+num2str(eps)));%opis
xlabel('t');
ylabel('x');

%--

eps=0.1;
f = @(t,x)  -x + eps*x^2; 
xr0 = @(t,x) -x;
xr1 = @(t,x) x - 1/eps;
figure
hold on;
for wpc = -4:0.5:2
    sol = ode45(f, [0 1], wpc);%metoda Dormanda-Prince
    plot(sol.x, sol.y, 'c');
    sol = ode45(xr0, [0 1], wpc);
    plot(sol.x, sol.y, 'm');
    sol = ode45(xr1, [0 1],wpc);
    plot(sol.x, sol.y, 'y');
end
legend("nieliniowa funckja f(x)","linearyzacja dla xr=0","linearyzacja dla xr=1/eps")
hold off;
grid on
title(strcat("Porównanie systemów nieliniowego i zlinearyzowanych"+newline+ "w zale¿noœci od wartoœci eps dla funkcji f(x)=-x + eps*x^2 i przy eps= "+num2str(eps)));%opis
xlabel('t');
ylabel('x');

%--

eps=0.35;
f = @(t,x)  -x + eps*x^2; 
xr0 = @(t,x) -x;
xr1 = @(t,x) x - 1/eps;
figure
hold on;
for wpc = -4:0.5:2
    sol = ode45(f, [0 1], wpc);%metoda Dormanda-Prince
    plot(sol.x, sol.y, 'c');
    sol = ode45(xr0, [0 1], wpc);
    plot(sol.x, sol.y, 'm');
    sol = ode45(xr1, [0 1],wpc);
    plot(sol.x, sol.y, 'y');
end
legend("nieliniowa funckja f(x)","linearyzacja dla xr=0","linearyzacja dla xr=1/eps")
hold off;
grid on
title(strcat("Porównanie systemów nieliniowego i zlinearyzowanych"+newline+ "w zale¿noœci od wartoœci eps dla funkcji f(x)=-x + eps*x^2 i przy eps= "+num2str(eps)));%opis
xlabel('t');
ylabel('x');

%--

eps=0.44;
f = @(t,x)  -x + eps*x^2;
xr0 = @(t,x) -x;
xr1 = @(t,x) x - 1/eps;
figure
hold on;
for wpc = -4:0.5:2
    sol = ode45(f, [0 1], wpc);%metoda Dormanda-Prince
    plot(sol.x, sol.y, 'c');
    sol = ode45(xr0, [0 1], wpc);
    plot(sol.x, sol.y, 'm');
    sol = ode45(xr1, [0 1],wpc);
    plot(sol.x, sol.y, 'y');
end
legend("nieliniowa funckja f(x)","linearyzacja dla xr=0","linearyzacja dla xr=1/eps")
hold off;
grid on
title(strcat("Porównanie systemów nieliniowego i zlinearyzowanych"+newline+ "w zale¿noœci od wartoœci eps dla funkcji f(x)=-x + eps*x^2 i przy eps= "+num2str(eps)));%opis
xlabel('t');
ylabel('x');

%--

eps=0.5;
f = @(t,x)  -x + eps*x^2; 
xr0 = @(t,x) -x;
xr1 = @(t,x) x - 1/eps;
figure
hold on;
for wpc = -4:0.5:2
    sol = ode45(f, [0 1], wpc);%metoda Dormanda-Prince
    plot(sol.x, sol.y, 'c');
    sol = ode45(xr0, [0 1], wpc);
    plot(sol.x, sol.y, 'm');
    sol = ode45(xr1, [0 1],wpc);
    plot(sol.x, sol.y, 'y');
end
legend("nieliniowa funckja f(x)","linearyzacja dla xr=0","linearyzacja dla xr=1/eps")
hold off;
grid on
title(strcat("Porównanie systemów nieliniowego i zlinearyzowanych"+newline+ "w zale¿noœci od wartoœci eps dla funkcji f(x)=-x + eps*x^2 i przy eps= "+num2str(eps)));%opis
xlabel('t');
ylabel('x');


%--

eps=0.7;
f = @(t,x)  -x + eps*x^2; 
xr0 = @(t,x) -x;
xr1 = @(t,x) x - 1/eps;
figure
hold on;
for wpc = -4:0.5:2
    sol = ode45(f, [0 1], wpc);%metoda Dormand-Prince
    plot(sol.x, sol.y, 'c');
    sol = ode45(xr0, [0 1], wpc);
    plot(sol.x, sol.y, 'm');
    sol = ode45(xr1, [0 1],wpc);
    plot(sol.x, sol.y, 'y');
end
legend("nieliniowa funckja f(x)","linearyzacja dla xr=0","linearyzacja dla xr=1/eps")
hold off;
grid on
title(strcat("Porównanie systemów nieliniowego i zlinearyzowanych"+newline+ "w zale¿noœci od wartoœci eps dla funkcji f(x)=-x + eps*x^2 i przy eps= "+num2str(eps)));%opis
xlabel('t');
ylabel('x');



%podpunkt 4
f =  @(t,x)([x(2); -2*x(1)-3*x(1)^2-x(2)]); 
xr0 = @(t,x) [0 1;-2 -1]*x;  %linearyzacja dla xr=(0,0)
xr1 =  @(t,x) [0 1;-2 -1]*(x - [-2/3;0]);  %linearyzacja dla xr=(-2/3,0)

figure
hold on;
 for wpc = -1:0.05:1
 for wpc1 = -0.5:0.15:0.5  
    sol = ode45(f, [0 0.6], [wpc wpc1]);%metoda Dormand-Prince
   plotX= plot(sol.y(1,:), sol.y(2,:), 'b');
    sol = ode45(xr0, [0 0.6], [wpc wpc1]);
   plot10= plot(sol.y(1,:), sol.y(2,:), 'y');
    sol = ode45(xr1, [0 0.6],[wpc wpc1]);
    plot11=plot(sol.y(1,:), sol.y(2,:), 'r');
    plot12= plot(0, 0, 'o');
    plot13= plot(-2/3, 0, 'x');
end
end
legend([plotX,plot10,plot11,plot12,plot13],["nieliniowa funckja f(x)","linearyzacja dla xr=(0,0)","linearyzacja dla xr=(-2/3,0)","punkt xr=(0,0)","punkt xr=(-2/3,0)"])
hold off;
grid on
title("Porównanie systemów nieliniowego i zlinearyzowanych"+newline+ "dla funkcji f(x)=([x(2); -2*x(1)-3*x(1)^2-x(2)]) ");
xlabel('t');
ylabel('x');