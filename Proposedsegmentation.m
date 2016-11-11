function cbdry = Proposedsegmentation(nc, im, filename)
%-------------------------------------------------------------------------------%
% mean-shift algorithm oversegment
[labels, regsize] = MeanShiftsgementation(im, filename);
PL = labels + 1;
[~,reg_NUM] = size(regsize);
msbdry = seg2bdry(PL, 'imageSize');
msbdry1 = changecounter(msbdry);
imwrite(msbdry1,[filename '_MeanShift.jpg'],'Quality',100);

% %watershed algorithm oversegment
% [labels, wbdry] = Watershedsegmentation(im, filename);
% PL = labels;
% reg_NUM = max(PL(:));
% wbdry = seg2bdry(PL, 'imageSize');
% wbdry1 = changecounter(wbdry);
% imwrite(wbdry1,[filename '_Watershed.jpg'],'Quality',100);

% compute centroids
CC = regionprops(PL,'Centroid');
im.PLcentroids = cat(1,CC.Centroid);

% Generated objects and neighors
fprintf('processing objects_num %d ....\n',reg_NUM);
[im.ob_regions,im.ob_regions_gray] = generateObjects(reg_NUM,PL,im.gray);
fprintf('processing neighborhood....\n');
im.ob_neighborhood = generateNeighbor(im.ob_regions,reg_NUM,im,PL);
%-------------------------------------------------------------------------------%
% Generated cloud concepts
fprintf('\nCloud models Generating....\n');
[anticlouds, reg] = GeneratedAnticlouds(PL, im.gray, reg_NUM);
save([filename '_ac.mat'],'anticlouds');

% EM-clutsered
fprintf('\nCloud models Clustering....\n');
maxgray = max(im.gray(:));
[highclouds, IDX] = EMcloud(anticlouds, nc, filename, maxgray);
save([filename '_hc.mat'],'highclouds');

clf
emclabel = regions_label(reg, IDX, reg_NUM, im.pixels);
emclabel = reshape(emclabel, im.length, im.width);
fprintf('\nOutput the result EM-Method....\n');
emcbdry = seg2bdry(emclabel, 'imageSize');
emcbdry1 = changecounter(emcbdry);
imwrite(emcbdry1,[filename '_EM.jpg'],'Quality',100);
EMenergy = ComputeEnergy(IDX,highclouds,im,anticlouds);
fprintf(1, '  EM-Energy:   \t%g\n', EMenergy);
DisplayCluster(im.PLcentroids,IDX,PL,nc,[filename,'_EM']);
%-------------------------------------------------------------------------------%

%simulated annealing for optimization
fprintf('\nCloud concepts Discriminating....\n');
rIDX = SA3(filename, highclouds,IDX,anticlouds,nc,reg_NUM,im);
clf
clabel = regions_label(reg, rIDX, reg_NUM, im.pixels);
clabel = reshape(clabel, im.length, im.width);
DisplayCluster(im.PLcentroids,rIDX,PL,nc,[filename,'_SA']);

% Output
fprintf('\nOutput the result propsed method....\n');
cbdry = seg2bdry(clabel, 'imageSize');
cbdry1 = changecounter(cbdry);
imwrite(cbdry1,[filename '_SA3.jpg'],'Quality',100);
end