function [sol]=fitness(sol,data)

x=sol.x;
sol.fit=sum(x.^2);

end