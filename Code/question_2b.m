
%Question 2b
%============
%Obtaining the current for different mesh grids


%-------------------------------------------------------------------------- 
% Define the variables:
%--------------------------------------------------------------------------
meshsize = 1;

L = 30;         %Initialize the length 
W = 20;         %Initialize the width

nx = L/meshsize;
ny = W/meshsize;

% bottleneck width = meshsize*2, length = meshsize*2


sigma_inside  = 1;          %Initialize resistivity inside the bottleneck
sigma_outside = 10e-2;      %Initialize resistivity outside the bottleneck

current = zeros(5,1);         % Vector of calculated currents 

                               

%--------------------------------------------------------------------------
%Calculate current, changing the bottleneck dimensions
%--------------------------------------------------------------------------

meshsize = [1,2,3,4,5];
for i = 1:size(meshsize,2)
    nx = L*(meshsize(i));
    ny = W*(meshsize(i));
    current(i,1) = calculate_current(nx,ny, meshsize(i)*2, meshsize(i)*2, sigma_inside, sigma_outside);
end



%-------------------------------------------------------------------------- 
% Plot the current and area:
%-------------------------------------------------------------------------- 
figure('Name','Question 2b: Current versus Mesh Size');  %Optional
plot(meshsize, current, '*');
grid;
title('Current versus Mesh Size', 'FontSize',20);
xlabel('Mesh Size','FontSize',13);
ylabel('Current (A)','FontSize',13);


