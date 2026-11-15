clc;
clear;
close all;

%% Current Transformer Testing

fprintf('CURRENT TRANSFORMER TEST\n\n');

% Rated CT
Rated_CT = 100/5;      % 20:1

% Measured Values
Ip = [20 40 60 80 100];      % Primary Current (A)
Is = [1.01 2.01 3.00 4.01 5.00]; % Secondary Current (A)

Actual_CT = Ip./Is;

CT_Error = ((Rated_CT.*Is - Ip)./Ip)*100;

disp('CT Results');

T1 = table(Ip',Is',Actual_CT',CT_Error',...
    'VariableNames',{'Primary_Current','Secondary_Current',...
    'Actual_CT_Ratio','Percent_Error'})

figure;
plot(Ip,CT_Error,'-ob','LineWidth',2);
grid on;
xlabel('Primary Current (A)');
ylabel('Ratio Error (%)');
title('Current Transformer Test');

%% Potential Transformer Testing

fprintf('\nPOTENTIAL TRANSFORMER TEST\n\n');

Rated_PT = 11000/110;      %100:1

Vp = [2200 4400 6600 8800 11000];
Vs = [22.1 44.0 66.2 88.1 110];

Actual_PT = Vp./Vs;

PT_Error = ((Rated_PT.*Vs - Vp)./Vp)*100;

disp('PT Results');

T2 = table(Vp',Vs',Actual_PT',PT_Error',...
    'VariableNames',{'Primary_Voltage','Secondary_Voltage',...
    'Actual_PT_Ratio','Percent_Error'})

figure;
plot(Vp,PT_Error,'-sr','LineWidth',2);
grid on;
xlabel('Primary Voltage (V)');
ylabel('Ratio Error (%)');
title('Potential Transformer Test');
