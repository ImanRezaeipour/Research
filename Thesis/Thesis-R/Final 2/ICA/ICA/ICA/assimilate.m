function imp=assimilate(imp,lb,ub,beta,nvar)




nimp=length(imp);


for i=1:nimp
    
   ncolony=length(imp(i).colony);
   
   for j=1:ncolony
    
    
    d=imp(i).pos-imp(i).colony(j).pos;
    d=beta*rand(1,nvar).*d;
    
    imp(i).colony(j).pos=imp(i).colony(j).pos+d;
    
    imp(i).colony(j).pos=min(imp(i).colony(j).pos,ub);
    imp(i).colony(j).pos=max(imp(i).colony(j).pos,lb);
    
    imp(i).colony(j).cost=fitness(imp(i).colony(j).pos);
    

    
   end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                   %
%                          www.matlabnet.ir                         %
%                   Free Download  matlab code and movie            %
%                          Shahab Poursafary                        %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%