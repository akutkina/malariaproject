function [ MalariaSys ] = malariafunc( t, y, YL )
 
 b = 0.5;        %probability of transmission mosquito<->human
 mu = 0.1;      %mosquito death rate
 F = 1000000;     %mosquito population
 H = 10000;      %human population
 epsilon = 0.05/H; %entomological inoculation rate 
 Tincub = 15;    %mosquito incubation time (same as Tinc)
 s = 0.9;        %probability that malaria is symptomatic
 r = 0.5;        %rate at which symptomatic people are treated
 c = 0.1;        %rate at which asymptomatic people clear from infection spontaneously
 
% %I didn't use these 
% BdelIns = YL(:, 2);%corresponds to lag Tins
% UdelInc = YL(:, 1);%corresponds to lag Tinc
% KdelInc = YL(:, 1);%corresponds to lag Tinc
% AdelInc = YL(:, 1);%corresponds to lag Tinc
% UdelFev = YL(:, 3);%corresponds to lag Tfev
 
MalariaSys = [ b * epsilon * sum(YL(3:5,1)) * F * exp( - mu * Tincub) - mu * y(1) + max(1-y(1),0) %M
               (H - sum(y(2:5))) * b * epsilon * y(1) - (H - sum(YL(2:5,3))) * b * epsilon * YL(1,3) %B
               (H - sum(YL(2:5,3))) * b * epsilon * YL(1,3) - (H - sum(YL(2:5,2))) * b * epsilon * YL(1,2) %U
                 s * (H - sum(YL(2:5,2))) * b * epsilon * YL(1,2) - r * y(4) %K
                 (1 - s) * (H - sum(YL(2:5,2))) * b * epsilon * YL(1,2) - c * y(5) %A
    ];
 
 
end