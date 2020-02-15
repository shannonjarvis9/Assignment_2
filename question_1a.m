clc
clear all;

%Question 1a
%============
%1-D Case 
% del^2 V = 0
% (Vp - 2V + Vm)/ deltax^2 = 0


%-------------------------------------------------------------------------- 
% Define the variables:
%--------------------------------------------------------------------------

L = 30;         %Initialize the length 
W = 20;         %Initialize the width

G = zeros(L,L);       %Initialize the G matrix 
F = zeros(L,1);       %Initialize the F matrix 
        
delta_x = 1;     % Define parameter for FD method 
V0 = 5;          % Define boundary voltage value 
j=1;             % 1D problem


%-------------------------------------------------------------------------- 
% Fill the G matrix:
%--------------------------------------------------------------------------


for i=1:L
        
        %Map spatial to G matrix nodes (trivial for 1D case)
        n = i;
        nm = i-1;
        np = i+1;
        
        %Boundary Conditions 
        if i == 1 
            G(n,n) = 1;
            F(n,1) = V0;
        elseif i == L
            G(n,n) = 1;
            F(n,1) = 0;
        %Solutions to the 1D Finite Difference Equation 
        else 
           G(n,n) = -2/(delta_x)^2; 
           G(n, nm) = 1/(delta_x)^2;
           G(n,np) = 1/(delta_x)^2;
        end 

end


%-------------------------------------------------------------------------- 
% Solve for the node voltage:
%--------------------------------------------------------------------------

V = G\F; 

%Indexing to plot the voltage 
x= linspace(0,L,length(V));


%-------------------------------------------------------------------------- 
% To plot the node voltage:
%-------------------------------------------------------------------------- 
figure('Name','Question 1a');  %Optional
plot(x, V,'LineWidth',3);
grid;
title('1a: 1-D Plot of V(x)', 'FontSize',25);
xlabel('x (distance)','FontSize',20);
ylabel('Voltage  (Volts)','FontSize',20);









