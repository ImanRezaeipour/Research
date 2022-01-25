function [pop,emp]=CreateInitialPopulation(data)

npop=data.npop;
nvar=data.nvar;
CnMax = data.CnMax;

emp.x=[];
emp.fit=inf;
pop=repmat(emp,npop,1);



for i=1:npop
    % pop(i).x=randperm(nvar);
    temp = randperm(CnMax);
    Cn = temp(1,1);
    pop(i).x(1,1) = Cn;
    pop(i).x(1,2:nvar) = unidrnd(Cn, 1,nvar-1);
    pop(i)=fitness(pop(i),data);
end


end