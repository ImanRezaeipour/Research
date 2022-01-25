function  Z=fitness(x)

nvar=length(x);

Z=sum((x((1:2:nvar))-1).^2)+sum((x((2:2:nvar))).^2);


end