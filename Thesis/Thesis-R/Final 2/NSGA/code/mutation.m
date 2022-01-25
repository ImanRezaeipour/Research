function mutpop=mutation(mutpop,pop,nmut,lb,ub,nvar,data)
% mutpop=mutation(mutpop,pop,data)

npop=length(pop);


for n=1:nmut
    
    i1=randi([1 npop]);
    mutpop(n).x=Swap(pop(i1).pos);
    mutpop(n)=fitness(mutpop(n));
    
end


end





function y=Swap(x)

n=numel(x);

i=randsample(n,2);
i1=i(1);
i2=i(2);

y=x;
y([i1 i2])=x([i2 i1]);

end


