function x=Unique(x,j)

n=numel(x);
xj=x(j);
x(j)=0;
a=ismember(x,xj);
x(a)=0;
x(j)=xj;
c=setdiff(randperm(n),x);
x(x==0)=c;

end