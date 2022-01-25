function NewSol=CreateNeighbor(Sol,data)

x=Sol.x;
n=numel(x);


% t = rand;
% if t>0.5 && t<0.75
%     temp = randperm(data.CnMax);
%     x(1) = temp(1);
% elseif t> 0.75 && x(1)>1
%     x(1) = x(1) - 1;
% end

Cn = x(1);

i=randsample(n-1,2)+1;
i1=i(1);
i2=i(2);

x([i1 i2])=x([i2 i1]);

if Cn ~= x(1)
    a = find(x>Cn);
    temp = randsample(Cn,length(a));
    x(a) = temp;
end

NewSol.x=x;
NewSol=fitness(NewSol,data);
end


