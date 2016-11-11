function distance = cloud_dist(clouds,highcloud)
Ex=clouds(1,:);
%He=clouds.He;
%num=clouds.num;
A=abs(Ex-highcloud(1));
IDX=find(A==0);
dist=sigma(clouds,highcloud);
[~,itry]=size(IDX);
if itry==0
    distance=A.*dist;
else 
    distance=A.*dist;
    dd=dist(IDX);
    distance(IDX)=dd;
end
% if clouds.Ex ~= high_clouds.Ex
%     sml = abs(clouds.Ex - high_clouds.Ex);
%     distance = sml * (1-sigma(clouds,high_clouds));
% else
%     distance = 1-sigma(clouds,high_clouds);
% end