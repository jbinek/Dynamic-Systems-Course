%Joanna Binek

G1 = tf(1,[1 1 2]);

G2 = tf([1 0],[1 -0.1 1]);

figure
nyquist(G1)
grid on
title('System nr 1')

figure
nyquist(G2)
grid on
title('System nr 2')

