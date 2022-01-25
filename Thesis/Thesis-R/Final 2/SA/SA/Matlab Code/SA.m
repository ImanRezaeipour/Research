clc
clear
close all
format  shortG


%% Insert Data

data=InsertData();


%% parameters setting

npop=50;     % number of population
Maxiter=1000; % Max Of Iteration

T0=900;      % Initial Temp
Tf=1;         % Final Temp

TRF=((T0-Tf)/Maxiter);        %Temp Reduction factor
NN=10;                        % Number Neighbors

data.npop=npop;

%% initial population 
tic

[pop,emp]=CreateInitialPopulation(data);

% Find Global pop
[value,index]=min([pop.fit]);
gpop=pop(index);


%% Main Loop 
T = T0;
BEST=zeros(Maxiter,1);
MEAN=zeros(Maxiter,1);

for iter=1:Maxiter
    
    for i=1:npop
        
        BestNewSol=emp;
        
        for j=1:NN
            
            % Create Neighbor
            NewSol=CreateNeighbor(pop(i),data);
            
            % Update BestNewSol
            if NewSol.fit<BestNewSol.fit   
                BestNewSol=NewSol;
            end
            
        end
        
        
        % Update Pop(i)
        if BestNewSol.fit<pop(i).fit
            pop(i)=BestNewSol;
            
        else
            
            % Calculated Probability Boltzmann
            E=(BestNewSol.fit-pop(i).fit)/pop(i).fit;
            Pr=exp(-E/T);
            
            if rand<Pr
                pop(i)=BestNewSol;
            end
            
            
        end
        
    end
    
    % Reduction Temp
    T=T-TRF;
    
    
    % Find Global Sol
    [value,index]=min([pop.fit]);
    if value<gpop.fit
        gpop=pop(index);
    end
    
    % Update BEST Matrix 
    BEST(iter)=gpop.fit;
    
    % Display Results Per Iteration
    disp([' Iter = ' num2str(iter)  ' BEST = ' num2str(BEST(iter))])
    
    % Plot Best Sol 
    PlotBestSol(gpop,data,iter)
    
end



%% Results 


disp([ ' Best x = '  num2str(gpop.x)])
disp([ ' Best Fitness = '  num2str(gpop.fit)])
disp([ ' Time = '  num2str(toc)])

figure
plot(BEST,'r')
xlabel('Iteration')
ylabel('Fitness')
legend('BEST')
title('SA')
















