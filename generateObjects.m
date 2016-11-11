function [regions,regions_gray] = generateObjects(num,labels,gray)
regions_gray = cell(1,num);
regions = cell(1,num);
for i=1:num
    regions{i}=find(labels==(i));
    m=regions{i};
    A=zeros(size(m));
    for j=1:size(m)
        A(j)=gray(m(j));
    end
    regions_gray{i}=A;
end