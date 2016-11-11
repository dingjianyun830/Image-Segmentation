function cbdry = CloudSegment(im, ntarget, filename)
err=0.00001;
fprintf('cloud_transform.....\n');
anticloud=cloud_transform(im,err,filename);
[acsort,pt]=sort(anticloud(1,:));
anticloudcopy=anticloud;
anticloud(1,:)=acsort;
for ll=1:max(pt)
    anticloud(2:4,ll)=anticloudcopy(2:4,pt(ll));
end
fprintf('corpcloud.....\n');
corpoffanticloud=corpcloud(anticloud,ntarget);
showclouds(corpoffanticloud,[filename 'cengci']);
clabel=cloudseg(im,corpoffanticloud);

%Êä³ö½á¹û
fprintf('\nOutput the Cloud segment method....\n');

cbdry = seg2bdry(clabel, 'imageSize');
cbdry1 = changecounter(cbdry);
imwrite(cbdry1,[filename '_CloudSegment.jpg'],'Quality',100);