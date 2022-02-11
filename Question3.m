%% 1190707-Lojain Abdalrazaq-Sec 1
%% Q3:
M=0.25;       % μ
Ac=1;         % Carrier Amplitude
Fm=1;         % The frequncy of the message signal--> m(t) 
Fc=25;        % The frequncy of the carrier signal-->c(t)
T = 10 ;      
MinVal = 1/Fc;               % 1/25=0.04  --> Lower bound of tau
MaxVal = 1/Fm;               % 1/1=1      --> Upper bound of tau
tau = MinVal:0.001:MaxVal;   % MinVal << tau << MaxVal
num_tau=length(tau);         % Return the length of the array of tau
Ts=MinVal/100;               % Sampling time
t=0: Ts :2*MaxVal;          % time 
% Ideal Envelope equation:                    
ideal_envelope  =Ac*(1 + M*cos(2*pi*Fm*t)); 
% Modulated signal s(t) equation:
S = ideal_envelope.*cos(2*pi*Fc*t);  %s(t)--> modulated signal
%--------------------------------------------------------------------------
% At the 1st time,the Actual Envelope will be the same as Modulated signal
for i=1:num_tau 
    % In this for loop, we will get over all the values of the tau 
    actual_envelope(1,1)=1+M;
    for n=1:length(t)-1
           if actual_envelope(1,n) < S(1,n)
            % When the modualted signal more then the exponential, then 
            % The Actual Envelope will be the same as S(t)
            % The capacitor is charging
            % The diode is ON
           actual_envelope(1,n+1)= S(1,n); 
           else
            % As long as the modulated signal s(t) less than the product of 
            % the value of previous Actual Envelope and the exponential
            % e^-t/ta, the capacitor is discharging
            % The diode is OFF
            actual_envelope(1,n+1)=actual_envelope(1,n)*exp(-Ts/tau(1,i));
        end
    end
    % Calculating the mean square error Cal_MSE
    % The norm function returns the sum of the diffrence between the ideal
    % envelupe detector and the practical envelop detector divided by the
    % the length of the time
    Cal_MSE(1,i)=(sum((actual_envelope-ideal_envelope).^2))/length(t);
end
 [~,T]=min(Cal_MSE); 
 actual_envelope(1,1)=1+M;
 for n=1:length(t)-1
     if actual_envelope(1,n) < S(1,n)
         actual_envelope(1,n+1)=S(1,n+1);
     else
        actual_envelope(1,n+1)=actual_envelope(1,n)*exp(-Ts/tau(1,T));
     end
 end
%-----------------------------*Plotting MSE*-------------------------------
plot(tau,Cal_MSE,'green');
grid;
xlabel('tau (s)');
ylabel('MSE');
title('Mean Square Function');
figure;
%------------------------*Plotting Actual Envelope*------------------------
% Modulated signal and output signal for optimum value of Tau
plot(t,actual_envelope,'black','linewidth',2.0);
title('AM waveform and envelope detector')
xlabel('Time (s)');
ylabel('Amplitude');
figure;
%----------------*Plotting Actual Envelope and Modulated Signal*-----------
plot(t,S,'Blue');
hold on 
plot(t,actual_envelope,'m','linewidth',1.5);
title('AM waveform and envelope detector')
xlabel('Time (s)');
ylabel('Amplitude');


