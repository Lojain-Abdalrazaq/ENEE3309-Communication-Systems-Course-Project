%% 1190707-Lojain Abdalrazaq-Sec 1
%% Question 1 + 2 
% Plotting the modualted signal s(𝑡) = 𝐴𝑐[1 + μ cos(2πfmt)]cos(2πfct)
% Plotting the demodulated signal y(t)
M=0.25;      % μ
Ac=1;        % Carrier Amplitude
Fm=1;        % The frequncy of the message signal--> m(t) 
Fc=25;       % The frequncy of the carrier signal-->c(t)
t=0:0.001:2; % 2 cycles
%----------------------*Message Signal*------------------------------------
axis([0 2 -2 2]);
subplot(4,1,1);
m=cos(2*pi*Fm*t);  % message signal m(t)
plot(t,m,'red');   % Plotting the message signal m(t)
title('Message Signal m(t)');
xlabel('Time (s)');
ylabel('m(t)');
%----------------------*Carrier Signal*------------------------------------
axis([0 2 -2 2]);
subplot(4,1,2);
c=cos(2*pi*Fc*t);  % carrier signal c(t)
plot(t,c,'blue');     % Plotting the carrier signal c(t)
title('Carrier Signal c(t)');
xlabel('Time (s)');
ylabel('c(t)');
%----------------------*Modulated Signal*----------------------------------
axis([0 2 -2 2]);
subplot(4,1,3);
s=Ac*(1+ M*m).*c;  % modualted signal s(t)
plot(t,s,'green');
title('Modulated Signal s(t)');
xlabel('Time (s)');
ylabel('s(t)');
%----------------------*Demodulated Signal*--------------------------------
axis([0 2 -2 2]);
subplot(4,1,4);
y=abs(Ac*(1+ M*cos(2*pi*Fm*t)));  % Demodulated signal
plot(t,y,'black');
title('Demodulated Signal y(t)');
xlabel('Time (s)');
ylabel('y(t)');
%--------------------------------------------------------------------------




