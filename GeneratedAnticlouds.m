function [anticlouds, reg] = GeneratedAnticlouds(labels, gray, N)
%%%%%%%%%%%%%%%%
anticlouds = zeros(4,N);
reg = cell(1,N) ;
Ex = zeros(1,N);
En = zeros(1,N);
He = zeros(1,N);
num = zeros(1,N);
for i=1:N
    region = find(labels == (i));
    A = zeros(size(region));
    for j = 1 : size(region)
        A(j) = gray(region(j));
    end
    reg{i} = region;
    [Ex(i), En(i), He(i)] = back_cloud(A);
    [num(i),~] = size(A);
    A = [];
end
anticlouds(1,:) = Ex;
anticlouds(2,:) = En;
anticlouds(3,:) = He;
anticlouds(4,:) = num;
