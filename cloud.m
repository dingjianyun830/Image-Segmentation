function drop=cloud(Ex,En,He,n)
x=zeros(n,1);
y=zeros(n,1);
z=zeros(n,1);
for i=1:n
    Enn = randn(1)*He + En;
    x(i)=randn(1)*Enn+Ex;
    y(i)=exp(-(x(i)-Ex).^2/(2*Enn^2));
    z(i)=exp(-(x(i)-Ex).^2/(2*En^2));
end 
drop.x=x;
drop.y=y;
drop.z=z;
h = scatter(drop.x,drop.y,'.');
hold on
%scatter(drop.x,drop.z)