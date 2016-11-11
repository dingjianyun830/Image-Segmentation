function [highclouds,IDX]=EMcloud(anticloud,ntarget,filename,maxgray)
A = (1:ntarget) * maxgray / (ntarget + 1);
highclouds=zeros(4,ntarget);
highclouds(1,:) = A;
highclouds(2,:) = ones(1,ntarget) ;
highclouds(3,:) = 0;
highclouds(4,:) = 0;
itry = 1;
old_distance = cloud_distance(anticloud, highclouds);
[MCdistance ,IDX] = max(old_distance');
old_dis = sum(MCdistance);
loglik = log(old_dis);
%loglik = old_dis;
while itry < 20
    distance = cloud_distance(anticloud, highclouds);
    [MCdistance ,IDX] = min(distance');
    nhighclouds = mergecloud(anticloud,IDX,ntarget,highclouds);
    new_dis = sum(MCdistance);
    nloglik = log(new_dis);
    %nloglik = new_dis;
    detla = abs(loglik - nloglik);
    a(itry) = itry; 
    b(itry) = detla;
    if(detla < 0.00000001)
        break;
    else
        loglik = nloglik;
        highclouds = nhighclouds;
    end;
    itry=itry+1;
end
clf
set(gcf,'visible','off');
plot(a,b);
path = [filename,'_',num2str(ntarget)];
saveas(gcf,[path '_EM_qushi.png']);
delete(gcf)