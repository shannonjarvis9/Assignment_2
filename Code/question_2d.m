%Question 2d
%============
%Investigating varying sigma of the box 

%Change sigma_inside and calculate the current
% The result is plotted 


%-------------------------------------------------------------------------- 
% Define the variables:
%--------------------------------------------------------------------------

L = 30;         %Initialize the length 
W = 20;         %Initialize the width

Wb = W/3;       % Initalize bottleneck width
Lb = L/3;       % Initialize bottleneck height 

sigma_inside  = linspace(0,5,100);  %Vector to vary sigma 
sigma_outside = 10e-2;

current = zeros(size(sigma_inside,2),1);    % Vector of calculated currents 
                         
                                
%--------------------------------------------------------------------------
%Calculate current changing sigma_inside, sigma_outside is constant (10e-2)
%--------------------------------------------------------------------------

idx = 1;                        %Index for loop itteration
for i= 1:size(sigma_inside,2)
    current(idx,1) = calculate_current(L,W, Lb, Wb, sigma_inside(i), 10e-2);
    idx = idx +1; 

end


%-------------------------------------------------------------------------- 
% Plot the current and concuctivity:
%-------------------------------------------------------------------------- 
figure('Name','Question 2c: Current versus conductivity of the bottleneck box');  %Optional
plot(sigma_inside, current, '*');
grid;
title('Current versus conductivity of the bottleneck box', 'FontSize',20);
xlabel('Conductivity inside the bottleneck','FontSize',13);
ylabel('Current (A)','FontSize',13);

