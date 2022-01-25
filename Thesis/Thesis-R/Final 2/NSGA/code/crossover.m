function  crosspop=crossover(crosspop,pop,ncross,data)


f=sum([pop.cost]);
f=1./f;
f=f./sum(f);
f=cumsum(f);

for n=1:2:ncross
    
    i1=find(rand<=f,1,'first');
    i2=find(rand<=f,1,'first');
    
    [crosspop(n).pos,crosspop(n+1).pos]=SinglePointCrossover(pop(i1).pos,pop(i2).pos);
    
    crosspop(n).cost =fitness(crosspop(n),data);
    crosspop(n+1).cost =fitness(crosspop(n+1),data);
    
    
    
end

end


function [y1,y2]=SinglePointCrossover(x1,x2)

nvar=numel(x1);

j=randi([1 nvar-1]);
y1=x1;
y2=x2;

y1(1:j)=x2(1:j);
y2(1:j)=x1(1:j);

end


















