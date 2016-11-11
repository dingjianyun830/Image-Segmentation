function DisplayCluster(centroids,IDX,Label,ntarget,savePath)
clf
set(0,'defaultfigurecolor','w');
% show image
imshow(Label,[]);
% regionbdry = seg2bdry(Label, 'imageSize');
% regionbdry1 = changecounter(regionbdry);
% imshow(regionbdry1,[]);

% show clusters
% set cluster style
style = {'b+', 'r*', 'mx', 'gs', 'yd', 'wp', 'kh', 'c.'};
for i = 1: ntarget
    hold on
    c_idx= find(IDX == i);  
    a = centroids(c_idx,1);
    b = centroids(c_idx,2);
    scatter(a,b,style{i});
end
legend('show','Location','SouthOutside','Orientation','horizontal');
print('-djpeg','-r600',[savePath '_clusters.jpg'])
delete(gcf)
