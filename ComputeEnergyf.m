function Energyf=ComputeEnergyf(Ex,high_clouds)
[~,m]=size(Ex);
[~,n]=size(high_clouds);
Energyf = zeros(m,n);
for i=1:n
    highcloud=high_clouds(:,i);
    Energyf(:,i)=-log(X_cloud(highcloud(1),highcloud(2),highcloud(3),Ex));
end