function Energys=ComputeEnergys(parent,num,neighbors,j,im)
centroids = im.PLcentroids;
m = neighbors(:,1);
n = neighbors(:,2);
clique_num = sum(n);
ImpactFactor=zeros(size(m));
for i = 1 : size(m)    
    a = j;
    b = m(i);
    clique_pixels = sum(num(m));
    %r =(centroids(a,1)-centroids(b,1))^2 + (centroids(a,2)-centroids(b,2))^2;    
    r = (n(i)/clique_num);
    c = r*num(b)/clique_pixels;
    if parent(a) == parent(b)
        ImpactFactor(i) = +1*c;
        %ImpactFactor(i) = +1;
    else
        s = abs(parent(a) - parent(b));
        ImpactFactor(i) = -1*s*c;
        %ImpactFactor(i) = -1;
    end
end
Energys=sum(ImpactFactor);
%Energys=exp(-Energys);