function corpoffanticloud=corpcloud(anticloud,ntarget)
% anticloud(1,:)=anticlouds.Ex;
% anticloud(2,:)=anticlouds.En;
% anticloud(3,:)=anticlouds.He;
% anticloud(4,:)=anticlouds.num;
[acsort,pt]=sort(anticloud(1,:));
anticloudcopy=anticloud;
anticloud(1,:)=acsort;
for ll=1:max(pt)
    anticloud(2:4,ll)=anticloudcopy(2:4,pt(ll));
end
[~,nknown]=size(anticloud);
while nknown~=ntarget
    dis = zeros(nknown-1,1);
    for kk=1:nknown-1
        dis(kk)=abs(anticloud(1,kk)-anticloud(1,kk+1));
    end
    [dismin,posit]=min(dis);
    newcore=(anticloud(1,posit)*anticloud(2,posit+1)+anticloud(2,posit)* anticloud(1,posit+1))/(anticloud(2,posit)+anticloud(2,posit+1));
    newband=max(anticloud(2,posit)+(newcore-anticloud(1,posit))/3,anticloud(2,posit+1)+(anticloud(1,posit+1)-newcore)/3);
    newtop=anticloud(4,posit)+anticloud(4,posit+1);
    %dis
    %posit
    %[newcore,newband,newtop] = paraorg(anticloud(1,posit),anticloud(1,posit+1),anticloud(2,posit),anticloud(2,posit+1),anticloud(4,posit),anticloud(4,posit+1));
    newhe = (min(abs((anticloud(3,posit))^2),abs((anticloud(3,posit+1))^2)))^(1/2);
    anticloud = [anticloud(:,1:(posit-1)),anticloud(:,(posit+2):nknown),[newcore;newband;newhe;newtop]];
    [acsort,pt]=sort(anticloud(1,:));
    anticloudcopy=anticloud;
    anticloud(1,:)=acsort;
    for ll=1:max(pt)
        anticloud(2:4,ll)=anticloudcopy(2:4,pt(ll));
    end
    [~,nknown]=size(anticloud);
   % anticloud
end
corpoffanticloud=anticloud;

% filename=[filename,'merge'];
% showcloud(corpoff,filename);