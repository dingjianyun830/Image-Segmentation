function [labels, regsize] = MeanShiftsgementation(im, filename)
rgb = im.rgb;
if im.width >=3000
    varargin.MinimumRegionArea=1500;
else
    if im.width >=1500
        varargin.MinimumRegionArea=1000;
    else
        varargin.MinimumRegionArea=200;
    end
end

varargin.steps=2;
varargin.synergistic=true;
varargin.SpatialBandWidth=3;
varargin.RangeBandWidth=2.5;
varargin.SpeedUp=2;
varargin.GradientWindowRadius=1;
varargin.MixtureParameter=0.3;
varargin.EdgeStrengthThreshold=0.1;
fprintf('\nMean-shift Processing....\n');
[fimage,labels,modes,regsize,grad,conf]=edison_wrapper(rgb,varargin);
%fimage = Luv2RGB(fimage);
%imwrite(fimage,[filename '_MeanShift.jpg'],'quality',100);
%save([filename '_MeanShift.mat'],'msbdry');

% clf
% figure
% imagesc(im);
% colormap(gray);
% hold on
% PlotLabels(msbdry);
% saveas(gcf,[filename '_MS.jpg']);
% close