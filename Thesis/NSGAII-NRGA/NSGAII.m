clc
clear
close all
format shortG

%% parametres setting

nvar=3;        %  number of variable
lb=[-4 -4 -4]; % lower bound
ub=[4 4 4];     % upper bound

npop=40;     % number of population


pc=0.7;       % percent of crossover
ncross=2*round(npop*pc/2);  % number of crossover offspring

pm=0.3;        %  percent of mutation
nmut=round(npop*pm);  % number of mutation offspring


maxiter=150;


%% initialization

empty.pos=[];
empty.cost=[];
empty.dcount=[];   % dominate count
empty.dset=[];     % dominate set
empty.rank=[];      
empty.cdis=[];      % crowding distance


pop=repmat(empty,npop,1);

for i=1:npop
    pop(i).pos=lb+rand(1,nvar).*(ub-lb);
    pop(i).cost=fitness(pop(i).pos);
end

[pop F]=non_dominated_sorting(pop);
pop=calculated_crowding_distance(pop,F);
pop=sorting(pop);

%% main loop

for iter=1:maxiter

    % crossover
    crosspop=repmat(empty,ncross,1);
     crosspop=crossover(crosspop,pop,ncross,F,nvar);
     
     % mutation
     mutpop=repmat(empty,nmut,1);
     mutpop=mutation(mutpop,pop,nmut,lb,ub,nvar);
     
     [pop]=[pop;crosspop;mutpop];
    
     [pop F]=non_dominated_sorting(pop);
      pop=calculated_crowding_distance(pop,F);
      pop=sorting(pop);
      
      pop=pop(1:npop);
      
      [pop F]=non_dominated_sorting(pop);
      pop=calculated_crowding_distance(pop,F);
      pop=sorting(pop);
      
      
      C=[pop.cost]';
      
      figure(1)
      plotpareto(F,C)
      
      
      
      disp([ ' iter =   '  num2str(iter) ' BEST F1 = ' num2str(min(C(:,1)))  ' BEST F2  = ' num2str(min(C(:,2))) ' NF1 = '  num2str(length(F{1})) ]) 
    
    
    
    
    
end

%% results

pareto=pop(F{1},:);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                   %
%                          www.matlabnet.ir                         %
%                   Free Download  matlab code and movie            %
%                          Shahab Poursafary                        %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

