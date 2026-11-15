clc;
clear;
close all;

%-----------------------------
% Over Current Relay Simulation
%-----------------------------

% Relay Settings
Ip = 100;        % Pickup Current (A)
TMS = 0.2;       % Time Multiplier Setting

% Fault Current Range
If = 100:25:1000;

% Operating Time Calculation
T = zeros(size(If));

for i = 1:length(If)

    M = If(i)/Ip;     % Plug Setting Multiplier

    if M <= 1
        T(i) = inf;   % Relay does not operate
    else
        T(i) = (0.14*TMS)/((M^0.02)-1);
    end

end

% Display Results
disp('----------------------------------------------');
disp(' Fault Current(A)    Operating Time(s)');
disp('----------------------------------------------');

for i=1:length(If)
    fprintf('%10.2f %20.4f\n',If(i),T(i));
end


figure;
plot(If,T,'b','LineWidth',2);
grid on;

xlabel('Fault Current (A)');
ylabel('Operating Time (s)');
title('IDMT Over Current Relay Characteristic');
