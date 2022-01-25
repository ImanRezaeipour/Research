function imp=revolution(imp,lb,ub,Prevolve,nvar)



nimp=length(imp);


for i=1:nimp
   ncolony=length(imp(i).colony);
   
   for j=1:ncolony
       
        if rand<Prevolve 
       
            k=randi([1 nvar]);
            
            imp(i).colony(j).pos(k)=lb(k)+rand*(ub(k)-lb(k));
            imp(i).colony(j).cost=fitness(imp(i).colony(j).pos);
    
    
        end
    
   end
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                   %
%                          www.matlabnet.ir                         %
%                   Free Download  matlab code and movie            %
%                          Shahab Poursafary                        %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%