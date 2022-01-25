function imp=exchange(imp)

nimp=length(imp);



for i=1:nimp
    
   [value,index]=min([imp(i).colony.cost]);
   
   
   
   
   if value<imp(i).cost
       
       bestcolony=imp(i).colony(index);
       
       imp(i).colony(index).pos=imp(i).pos;
       imp(i).colony(index).cost=imp(i).cost;
       
       
       imp(i).pos=bestcolony.pos;
       imp(i).cost=bestcolony.cost;
       
       
       
       
       
   end
    
    
    
    
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                   %
%                          www.matlabnet.ir                         %
%                   Free Download  matlab code and movie            %
%                          Shahab Poursafary                        %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%