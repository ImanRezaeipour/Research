clc
clear
close all
format shortG

%% Load Data
adj=xlsread('karate.xls');
nodes = length(adj);
Com_Max = 10;
data.adj = adj;

%% parametres setting

nvar=nodes + 1;        %  number of variable
lb = ones(1,nvar); % lower bound
ub = ones(1,nvar)*Com_Max;     % upper bound

npop=10;     % number of population


pc=0.7;       % percent of crossover
ncross=2*floor(npop*pc/2);  % number of crossover offspring

pm=0.3;        %  percent of mutation
nmut=floor(npop*pm);  % number of mutation offspring


maxiter=50;


%% initialization
tic
emp.pos=[];
emp.cost=[];
emp.rank=[];      
emp.cdis=[];      % crowding distance


pop=repmat(emp,npop,1);

for i=1:npop
    pop(i).pos=[Com_Max, random('unid',lb:ub)];
    pop(i).cost=fitness(pop(i).pos);
end

[pop,F]=non_dominated_sorting(pop);
pop=crowding_distance(pop,F);
pop=sorting(pop);

%% main loop

for iter=1:maxiter

    % crossover
    crosspop=repmat(emp,ncross,1);
%     crosspop=crossover(crosspop,pop,ncross,nvar);
    crosspop=crossover(crosspop,pop,ncross,data);

     
     % mutation
     mutpop=repmat(emp,nmut,1);
     mutpop=mutation(mutpop,pop,nmut,lb,ub,nvar, data);
     
     [pop]=[pop;crosspop;mutpop];
    
     [pop,F]=non_dominated_sorting(pop);
      pop=crowding_distance(pop,F);
      pop=sorting(pop);
      
      pop=pop(1:npop);
      
      [pop,F]=non_dominated_sorting(pop);
      pop=crowding_distance(pop,F);
      pop=sorting(pop);
      
      
      C=[pop.cost]';
      
      figure(1)
      plotpareto(F,C)
      
      
      
      disp([ ' iter =   '  num2str(iter) ' N Pareto = '  num2str(length(F{1})) ]) 
    
    
    
    
    
end

%% results

pareto=pop(F{1},:);
toc


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                Shahab Poursafary                           %
%                  Matlabhome.ir                             %
%                  Matlabnet.ir                              %
%                Matlab_net@yahoo.com                        %
%                   09190090258                              %
%       Matlab Videos , Code , File , Project                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




