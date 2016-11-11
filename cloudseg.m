function rlabel=cloudseg(im,highclouds)
[h,w]=size(im);
im=im(:);
[m,~]=size(im);
[~,n]=size(highclouds);
Ex=highclouds(1,:);
En=highclouds(2,:);
He=highclouds(3,:);
miu=zeros(m,n);
for j=1:n
    miu(:,j)=X_cloud(Ex(j),En(j),He(j),im);
end
[~,IDX]=max(miu',[],1);
rlabel=reshape(IDX,h,w);
