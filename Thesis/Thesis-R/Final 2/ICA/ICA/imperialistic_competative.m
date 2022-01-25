function imp=imperialistic_competative(imp)

nimp=length(imp);

if nimp>=2


[~,index]=max([imp.totalcost]);

weakestimp=imp(index);


[~,index2]=max([weakestimp.colony.cost]);

weakestcolony=weakestimp.colony(index2);


imp(index).colony=imp(index).colony([1:index2-1 index2+1:end]);

n2=length(imp(index).colony);

if n2==0
    
    
   imp=imp([1:index-1 index+1:end]); 
   P=[imp.totalcost];
   P=max(P)-P+eps;
   
   

       j=RouletWheel(P);
  

   n=length([imp(j).colony]);
   imp(j).colony(n+1).pos=weakestimp.pos; 
   imp(j).colony(n+1).cost=weakestimp.cost; 
    
    
end




P=[imp.totalcost];
P=max(P)-P+eps;



   j=RouletWheel(P);
  
    
    


n=length([imp(j).colony]);
imp(j).colony(n+1)=weakestcolony;
end

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                   %
%                          www.matlabnet.ir                         %
%                   Free Download  matlab code and movie            %
%                          Shahab Poursafary                        %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%