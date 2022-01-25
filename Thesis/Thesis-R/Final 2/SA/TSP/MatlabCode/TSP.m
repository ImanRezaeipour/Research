clc
clear
close all
format shortG

%% Insert Data

data=InsertData();



%% Parameters Definiterion


nvar=data.N;                                % Number of  Variables










%% Create Random Solution


   sol.x=randperm(nvar);
   sol=fitness(sol,data);

  iter=0;    
  
 % Plot Best Solution
 PlotBestSol(sol,data,iter)
    
 