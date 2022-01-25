function data=InsertData()

adj=xlsread('karate.xls');

Pos = adj;

minpos=min(Pos,[],2);
maxpos=max(Pos,[],2);

minpos=minpos*0.8;
maxpos=maxpos*1.2;

N=size(Pos,2);
CnMax = floor(N/10);

Dis=zeros(N,N);

for i=1:N
    for j=i+1:N
        Dis(i,j)=norm(Pos(:,i)-Pos(:,j),2);
        Dis(j,i)=Dis(i,j);
    end
end


data.N=N;
data.Pos=Pos;
data.Dis=Dis;
data.minpos=minpos;
data.maxpos=maxpos;
data.nvar=N+1;
data.CnMax = CnMax;

 end