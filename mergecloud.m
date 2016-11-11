function highclouds=mergecloud(anticlouds,IDX,ntarget,oldhighclouds)
Ex=anticlouds(1,:);
En=anticlouds(2,:);
He=anticlouds(3,:);
num=anticlouds(4,:);
highclouds=zeros(4,ntarget);
for i = 1:ntarget
    A=find(IDX==i);
    [~,a]=size(A);
    if a ==0
        highclouds(:,i) = oldhighclouds(:,i);
        continue;
    end
    highcloud(1,:)=Ex(A);
    highcloud(2,:)=En(A);
    highcloud(3,:)=He(A);
    highcloud(4,:)=num(A);
    highclouds(:,i)=corpcloud(highcloud,1);
    highcloud=[];
end
[acsort,pt]=sort(highclouds(1,:));
highcloudscopy=highclouds;
highclouds(1,:)=acsort;
for ll=1:max(pt)
    highclouds(2:4,ll)=highcloudscopy(2:4,pt(ll));
end

