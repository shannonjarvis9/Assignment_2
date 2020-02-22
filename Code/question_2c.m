
%Question 2c
%============
%Obtaining the current for different bottleneck sizes


%-------------------------------------------------------------------------- 
% Define the variables:
%--------------------------------------------------------------------------

L = 30;         %Initialize the length 
W = 20;         %Initialize the width

Wb = linspace(0.1,W/2,10);     % Initalize bottleneck width
Lb = linspace(0.1,L,10);       % Initialize bottleneck height 

sigma_inside  = 1;          %Initialize resistivity inside the bottleneck
sigma_outside = 10e-2;      %Initialize resistivity outside the bottleneck

current = zeros(size(Wb,2)*size(Lb,2),1);         % Vector of calculated currents 
bottleneck_area = zeros(size(Wb,2)*size(Lb,2),1); % Area of bottlenect
                               

%--------------------------------------------------------------------------
%Calculate current, changing the bottleneck dimensions
%--------------------------------------------------------------------------

idx = 1;                        %Index for loop itteration
for i= 1:size(Lb,2)
    for j=1:size(Wb,2)
        bottleneck_area(idx,1) = Lb(i)*Wb(j);
        current(idx,1) = calculate_current(L,W, Lb(i), Wb(j), sigma_inside, sigma_outside);
        idx = idx +1; 
    end
end



%-------------------------------------------------------------------------- 
% Plot the current and area:
%-------------------------------------------------------------------------- 
figure('Name','Question 2c: Current versus Bottleneck Area');  %Optional
plot(bottleneck_area, current, '*');
grid;
title('Current versus Bottleneck Area', 'FontSize',20);
xlabel('Bottleneck Area (distance^2)','FontSize',13);
ylabel('Current (A)','FontSize',13);



%--------------------------------------------------------------------------
%Calculate current, changing just the bottleneck width
%--------------------------------------------------------------------------
current_w = zeros(size(Wb,2),1);  

idx = 1;                        %Index for loop itteration
for j=1:size(Wb,2)
        current_w(idx,1) = calculate_current(L,W, Lb(5), Wb(j), sigma_inside, sigma_outside);
        idx = idx +1; 
end



%-------------------------------------------------------------------------- 
% Plot the current and area:
%-------------------------------------------------------------------------- 
figure('Name','Question 2c: Current versus Bottleneck Width');  %Optional
plot(Wb, current_w, '*');
grid;
title('Current versus Bottleneck Width', 'FontSize',20);
xlabel('Bottleneck Width (distance)','FontSize',13);
ylabel('Current (A)','FontSize',13);
