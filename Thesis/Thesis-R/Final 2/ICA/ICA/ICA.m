clc
clear
close all
format shortG
%% parameters setting

nvar=10; % number of variable

lb=-10*ones(1,nvar);% lower bound
ub=10*ones(1,nvar); % upper bound


npop=100; % number population

nimp=10; % number imperialist

maxdecades=10000;% max of decades

beta=2;

Prevolve=0.1;

zeta=0.1;

%% initialization
tic

create_initial_population;

[value,index]=min([imp.cost]);

gimp=imp(index); % global imp

%% main loop

best=zeros(maxdecades,1);

for decade=1:maxdecades
    
   imp=assimilate(imp,lb,ub,beta,nvar); 
   
   imp=revolution(imp,lb,ub,Prevolve,nvar); 
   
   imp=exchange(imp);
   
   imp=calculated_total_cost(imp,zeta);
   
   imp=imperialistic_competative(imp);
   
   [value,index]=min([imp.cost]);
   
   if value<gimp.cost
       gimp=imp(index);
   end
   
    
   best(decade)=gimp.cost;
   
   
   disp([ ' decade = '  num2str(decade)  ' BEST = '  num2str(best(decade))      '  Nimp =  '  num2str(length(imp))]);   
    
    
    
end




%% results


disp('===============================================')
disp([ ' BEST solution = '  num2str(gimp.pos)])
disp([ ' BEST fitness = '  num2str(gimp.cost)])
disp([ ' Time = '  num2str(toc)])

figure(1)
plot(best(1:decade),'r','LineWidth',2);


xlabel('decade')
ylabel(' fitness')

legend(' BEST')

title('ICA')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                   %
%                          www.matlabnet.ir                         %
%                   Free Download  matlab code and movie            %
%                          Shahab Poursafary                        %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%