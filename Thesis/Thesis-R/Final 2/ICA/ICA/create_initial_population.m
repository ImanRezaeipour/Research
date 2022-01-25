

empty.pos=[];
empty.cost=[];

colony=repmat(empty,npop,1);


for i=1:npop 
   colony(i).pos=lb+rand(1,nvar).*(ub-lb);
   colony(i).cost=fitness(colony(i).pos);
end


[value,index]=sort([colony.cost]);
colony=colony(index);


imp=repmat(empty,nimp,1);

for i=1:nimp 
   imp(i).pos=colony(i).pos;
   imp(i).cost=colony(i).cost;
 
end

colony=colony(nimp+1:end);

ncolony=length(colony);

a=randperm(ncolony);

colony=colony(a);


i=0;
k=1;
for j=1:ncolony
i=i+1;    
    
  imp(i).colony(k)=colony(j);  
    

if i==nimp
    i=0;
    k=k+1;
end

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                   %
%                          www.matlabnet.ir                         %
%                   Free Download  matlab code and movie            %
%                          Shahab Poursafary                        %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



