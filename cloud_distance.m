function distance=cloud_distance(anticlouds,highclouds)
Ex=anticlouds(1,:);
[~,m]=size(Ex);
[~,n]=size(highclouds);
distance = zeros(m,n);
for j=1:n
    highcloud = highclouds(:,j);
    %distance(:,j) = cloud_dist(anticlouds,highcloud);
    distance(:,j) = new_distance(anticlouds,highcloud);
end
