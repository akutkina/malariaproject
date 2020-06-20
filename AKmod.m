clc;
clear;
close all;
 
Tinc =  15;%incubation time of a vector outside (in mosquitos)
Tins =  8; %incubation time of a vector inside (in humans)
Tfev =  3; %have fever, don't suspect malaria
 
lags = [Tinc Tins+Tfev Tfev]; %because we have two lagging variables
tf = 10000;            %time end (days)
 
solution = dde23(@malariafunc, lags, @malhist, [0 tf]);
 
t = linspace(0, tf, 50);       %time 
y = deval(solution, t);        % solution as points

% %scale for plotting
% y(1,:)=y(1,:)/(10^5);
% y(2:5,:)=y(2:5,:)/(10^4);
 
figure;
plot(t, y);
legend('M', 'Hb', 'Hu', 'Hk', 'Ha')







