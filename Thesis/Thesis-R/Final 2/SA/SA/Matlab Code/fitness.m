function sol=fitness(sol,data)

x=sol.x;
adj = data.Pos;
N=data.N;
Nc = x(1);
X = x(2:end);
m = sum(sum(adj))/2;
Q = 0;
for i = 1:Nc
    t = find(X == i);
    SubG(i).Adj = zeros(N,N);
    for j = 1:length(t)
        SubG(i).Adj(t(j),:) = adj(t(j),:);
        SubG(i).Adj(:,t(j)) = adj(:,t(j));
    end
    
    if size(SubG(i).Adj,1) < N
        SubG(i).Adj(N,:)=zeros(1,N);
    end
    ADJ = SubG(i).Adj;
    lc = sum(sum(ADJ))/2;
    dc = sum(sum(ADJ));
    
    Q = Q + lc/m - (dc/(2*m))^2;
end

Z = 1/Q;


sol.fit=Z;



end
