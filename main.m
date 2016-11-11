% Set Path
Path.Home = 'E:\Image segmentation';
Path.Database           = fullfile(Path.Home,'Database');
Path.Test.Home          = fullfile(Path.Database,'Test');
Path.Test.Image         = fullfile(Path.Test.Home,'Image');
Path.Test.Result        = fullfile(Path.Test.Home,'Result');
Path.Test.Refer         = fullfile(Path.Test.Home,'ImageRefer');
Path.Test.Output        = fullfile(Path.Test.Home,'ImageOutput');

% Read Image List
filelist = readImages(Path.Test.Image);
fprintf('Starting:');
FN  = length(filelist);
 
for n = 1 : FN
    clc
    fprintf('\nProcessing %s...\n',filelist(n).name);
    filesavepath = fullfile(Path.Test.Result,filelist(n).name(1:end-4));
    if ~isdir(filesavepath)
        mkdir(filesavepath);
    else
        continue;
    end
    filename = fullfile(Path.Test.Result,filelist(n).name(1:end-4),filelist(n).name(1:end-4));
    im.rgb = imread(fullfile(Path.Test.Image,filelist(n).name));
    datafilename = fullfile(Path.Test.Refer,filelist(n).name(1:end-4));
    Outputfile = fullfile(Path.Test.Output,filelist(n).name(1:end-4));
    
    % Read Image
    im.gray = double(rgb2gray(im.rgb)); 
    imwrite(rgb2gray(im.rgb),[filename '_gray.jpg'],'Quality',100);
    [im.length, im.width] = size(im.gray);
    im.pixels = im.length * im.width;
    
    % Set clustering centers
    nc = IS_histogram(im.gray,filename);
    if nc == 0
        nc = 2;
    end 
    
    % the proposed method
    cbdry = Proposedsegmentation(nc, im, filename);
  
    % Read Groundtruth
    refer = load([datafilename '.mat']);
    [~,n_refer] = size(refer.groundTruth);
    refer = load([datafilename '.mat']);
    REF = double(refer.groundTruth{1,1}.Boundaries);
    REF1 = changecounter(REF);
    imwrite(REF1,[REF_Path '_groundTruth.jpg'],'Quality',100);
    [RI,GCE,VI,TA] = seg_evluation(refer.groundTruth,cbdry);
end
