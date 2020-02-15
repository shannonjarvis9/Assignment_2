clc
clear all;

%Question 1a
%============
%2-D Case 
% del^2 V = 0
% (Vxp - 2V + Vxm)/ delta_x^2 + (Vyp - 2V + Vym)/ delta_y^2= 0


%-------------------------------------------------------------------------- 
% Define the variables:
%--------------------------------------------------------------------------

L = 30;         %Initialize the length 
W = 20;         %Initialize the width

G = sparse(W*L,W*L);       %Initialize the G matrix 
F = sparse(W*L,1);         %Initialize the F matrix 
        
delta_x = 1;     % Define parameters for FD method 
delta_y = 1;
V0 = 5;          % Define boundary voltage value 



%-------------------------------------------------------------------------- 
% Fill the G matrix:
%--------------------------------------------------------------------------


for i=1:L
    for j=1:W
        
        %Map spatial to G matrix nodes 
        n = j + (i-1)*W;
        nxm = j + (i-2)*W;
        nxp = j + (i)*W;
        nym = (j-1) + (i-1)*W;
        nyp = (j+1) + (i-1)*W;
        
        %Boundary Conditions 
        if i == 1 || i == L 
            G(n,n) = 1;
            F(n,1) = V0;
        elseif j == 1 || j == W
            G(n,n) = 1;
            F(n,1) = 0;
        %Solutions to the 1D Finite Difference Equation 
        else
            G(n,n) =  -2/(delta_x)^2 + -2/(delta_y)^2;
            G(n,nxm) = 1/(delta_x)^2;
            G(n,nxp) = 1/(delta_x)^2;
            G(n,nym) = 1/(delta_y)^2;
            G(n,nyp) = 1/(delta_y)^2;
        end 
    end 
end


%-------------------------------------------------------------------------- 
% Solve for the node voltage and map back to spatial domain:
%--------------------------------------------------------------------------

V = G\F; 

V_solution = zeros(L,W);

for i=1:L
    for j=1:W
        n = j + (i-1)*W;
        
        V_solution(i,j) = V(n);
    end
end
    


%Indexing to plot the voltage 
[X,Y] = meshgrid(1:W,1:L);

%-------------------------------------------------------------------------- 
% Plot the node voltage:
%-------------------------------------------------------------------------- 
figure('Name','Question 1b: Simulated Solution');  %Optional
surf(X,Y,V_solution);
grid;
title('1b: 2-D Plot of Simulated V(x)', 'FontSize',20);
xlabel('y (distance)','FontSize',13);
ylabel('x (distance)','FontSize',13);




%-------------------------------------------------------------------------- 
% Compare to the analytical solution:
%--------------------------------------------------------------------------

% For the summation, if n > 200, a result of NaN is returned, thus a small
% number of itterations is used
num_itter = 80;      %Number of itterations ot calculate the sum
a = W;
b = L; 

%Initialize an ananymous function of the analytical solution sum componeents 
V_actual_sum = @(x,y,n) (1/n)*(cosh((n*pi*x)/a)* sin((n*pi*y)/a))/(cosh((n*pi*b)/a));


V_calc = zeros(L, W);

for x=-1:L
    for y=1:W
        for n = 1:2:2*num_itter
            V_calc(x,y) = V_calc(x,y) + V_actual_sum(x,y,n);
        end
    end
end


%Add the last component (4*V0/pi) to the analytical solution 
V_calc = V_calc*((4*V0)/pi);


%-------------------------------------------------------------------------- 
% To plot the analytical solution:
%-------------------------------------------------------------------------- 
figure('Name','Question 1b: Analytical Solution');  %Optional
surf(X,Y,V_calc);
grid;
title('1b: 2-D Plot of the analytical solution of V(x)', 'FontSize',20);
xlabel('y (distance)','FontSize',13);
ylabel('x (distance)','FontSize',13);





