clc
clear
close all
format shortG

%% parameters setting 

nvar=100;   % number of variable
lb=0*ones(1,nvar); % lower bound
ub=1*ones(1,nvar);  % upper bound


popsize=100; % population size
maxiter=500; % max of iteation


c1=1;
c2=1;

damp=0.99;


%% initial population algorithm

tic
emp.var=[];
emp.fit=[];
emp.vel=[];

par=repmat(emp,popsize,1);


for i=1:popsize

  par(i).vel=lb+rand(1,nvar).*(ub-lb);
  
  R=rand(1,nvar);
  
 par(i).var=R>(1./(1+exp(-par(i).vel)));

  par(i).fit=fitness(par(i).var);
 
end  
    

bpar=par;
[value,index]=min([par.fit]);
gpar=par(index);
    

%% main loop algorithm

BEST=zeros(maxiter,1);

for iter=1:maxiter

     for i=1:popsize

         par(i).vel=par(i).vel-...
                    c1*rand(1,nvar).*(bpar(i).var-par(i).var)-...
                    c2*rand(1,nvar).*(gpar.var-par(i).var);
         
        par(i).vel=par(i).vel*damp;        
         
        
        par(i).vel=min(par(i).vel,ub);
        par(i).vel=max(par(i).vel,lb);
        
        
        R=rand(1,nvar);
  
        par(i).var=R>(1./(1+exp(-par(i).vel)));
        

        
        par(i).fit=fitness(par(i).var);
        
        
        if par(i).fit<bpar(i).fit
            bpar(i)=par(i);
            
            if bpar(i).fit<gpar.fit
                gpar=bpar(i);
            end
        end

     end



BEST(iter)=gpar.fit;

disp([ ' Iter = '  num2str(iter)  ' BEST = '  num2str(BEST(iter)) ])


end

%% results algorithm

disp([ ' Best Solution = ' num2str(gpar.var) ])
disp([ ' Best Fitness = ' num2str(gpar.fit) ])
disp([ ' Time = ' num2str(toc) ])


figure(1)
plot(BEST,'r')
xlabel('Iteration ')
ylabel(' Fitness ')
legend('BEST')
title('PSO')



