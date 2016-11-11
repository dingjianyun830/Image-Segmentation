function neighborhood=generateNeighbor(regions,num,im,labels)
pixels=im.pixels;
height=im.length;
width=im.width;
neighborhood = cell(1,num);
for i=1:num
    ind=regions{i};
    k=1;
    neighbor=[];
    for j=1:size(ind)
        if ind(j)==1
            %右
            if  labels(ind(j))~=labels(ind(j)+height)
                neighbor(k)=labels(ind(j)+height);
                k=k+1;
            end
            %右下
            if  labels(ind(j))~=labels(ind(j)+height+1)
                neighbor(k)=labels(ind(j)+height+1);
                k=k+1;
            end
            %下
            if  labels(ind(j))~=labels(ind(j)+1)
                neighbor(k)=labels(ind(j)+1);
                k=k+1;
            end
        elseif ind(j)==height
            %上
            if  labels(ind(j))~=labels(ind(j)-1)
                neighbor(k)=labels(ind(j)-1);
                k=k+1;
            end
            %右上
            if  labels(ind(j))~=labels(ind(j)+height-1)
                neighbor(k)=labels(ind(j)+height-1);
                k=k+1;
            end
            %右
            if  labels(ind(j))~=labels(ind(j)+height)
                neighbor(k)=labels(ind(j)+height);
                k=k+1;
            end
        elseif ind(j)==height*(width-1)+1
            %左
            if  labels(ind(j))~=labels(ind(j)-height)
                neighbor(k)=labels(ind(j)-height);
                k=k+1;
            end
            %左下
            if  labels(ind(j))~=labels(ind(j)-height+1)
                neighbor(k)=labels(ind(j)-height+1);
                k=k+1;
            end
            %下
            if  labels(ind(j))~=labels(ind(j)+1)
                neighbor(k)=labels(ind(j)+1);
                k=k+1;
            end
        elseif ind(j)==height*width
            %左上
            if  labels(ind(j))~=labels(ind(j)-height-1)
                neighbor(k)=labels(ind(j)-height-1);
                k=k+1;
            end
            %左
            if  labels(ind(j))~=labels(ind(j)-height)
                neighbor(k)=labels(ind(j)-height);
                k=k+1;
            end
            %上
            if  ind(j)-1<pixels&& labels(ind(j))~=labels(ind(j)-1)
                neighbor(k)=labels(ind(j)-1);
                k=k+1;
            end
        elseif ind(j)<height && ind(j)>1
            %上
            if  labels(ind(j))~=labels(ind(j)-1)
                neighbor(k)=labels(ind(j)-1);
                k=k+1;
            end
            %下
            if  labels(ind(j))~=labels(ind(j)+1)
                neighbor(k)=labels(ind(j)+1);
                k=k+1;
            end
            %右上
            if  labels(ind(j))~=labels(ind(j)+height-1)
                neighbor(k)=labels(ind(j)+height-1);
                k=k+1;
            end
            %右
            if  labels(ind(j))~=labels(ind(j)+height)
                neighbor(k)=labels(ind(j)+height);
                k=k+1;
            end
            %右下
            if  labels(ind(j))~=labels(ind(j)+height+1)
                neighbor(k)=labels(ind(j)+height+1);
                k=k+1;
            end
        elseif ind(j)<height*width && ind(j)>height*(width-1)
            %左上
            if  labels(ind(j))~=labels(ind(j)-height-1)
                neighbor(k)=labels(ind(j)-height-1);
                k=k+1;
            end
            %左
            if  labels(ind(j))~=labels(ind(j)-height)
                neighbor(k)=labels(ind(j)-height);
                k=k+1;
            end
            %左下
            if labels(ind(j))~=labels(ind(j)-height+1)
                neighbor(k)=labels(ind(j)-height+1);
                k=k+1;
            end
            %上
            if  labels(ind(j))~=labels(ind(j)-1)
                neighbor(k)=labels(ind(j)-1);
                k=k+1;
            end
            %下
            if labels(ind(j))~=labels(ind(j)+1)
                neighbor(k)=labels(ind(j)+1);
                k=k+1;
            end
        elseif mod(ind(j),height)==0
            %左上
            if  labels(ind(j))~=labels(ind(j)-height-1)
                neighbor(k)=labels(ind(j)-height-1);
                k=k+1;
            end
            %左
            if  labels(ind(j))~=labels(ind(j)-height)
                neighbor(k)=labels(ind(j)-height);
                k=k+1;
            end
            %上
            if  labels(ind(j))~=labels(ind(j)-1)
                neighbor(k)=labels(ind(j)-1);
                k=k+1;
            end
            %右上
            if  labels(ind(j))~=labels(ind(j)+height-1)
                neighbor(k)=labels(ind(j)+height-1);
                k=k+1;
            end
            %右
            if  labels(ind(j))~=labels(ind(j)+height)
                neighbor(k)=labels(ind(j)+height);
                k=k+1;
            end
        elseif mod(ind(j),height)==1
            %左
            if labels(ind(j))~=labels(ind(j)-height)
                neighbor(k)=labels(ind(j)-height);
                k=k+1;
            end
            %左下
            if labels(ind(j))~=labels(ind(j)-height+1)
                neighbor(k)=labels(ind(j)-height+1);
                k=k+1;
            end
            %下
            if  labels(ind(j))~=labels(ind(j)+1)
                neighbor(k)=labels(ind(j)+1);
                k=k+1;
            end
            %右
            if  labels(ind(j))~=labels(ind(j)+height)
                neighbor(k)=labels(ind(j)+height);
                k=k+1;
            end
            %右下
            if  labels(ind(j))~=labels(ind(j)+height+1)
                neighbor(k)=labels(ind(j)+height+1);
                k=k+1;
            end
        else
            %左上
            if  labels(ind(j))~=labels(ind(j)-height-1)
                neighbor(k)=labels(ind(j)-height-1);
                k=k+1;
            end
            %左
            if  labels(ind(j))~=labels(ind(j)-height)
                neighbor(k)=labels(ind(j)-height);
                k=k+1;
            end
            %左下
            if  labels(ind(j))~=labels(ind(j)-height+1)
                neighbor(k)=labels(ind(j)-height+1);
                k=k+1;
            end
            %上
            if  labels(ind(j))~=labels(ind(j)-1)
                neighbor(k)=labels(ind(j)-1);
                k=k+1;
            end
            %下
            if  labels(ind(j))~=labels(ind(j)+1)
                neighbor(k)=labels(ind(j)+1);
                k=k+1;
            end
            %右上
            if  labels(ind(j))~=labels(ind(j)+height-1)
                neighbor(k)=labels(ind(j)+height-1);
                k=k+1;
            end
            %右
            if  labels(ind(j))~=labels(ind(j)+height)
                neighbor(k)=labels(ind(j)+height);
                k=k+1;
            end
            %右下
            if  labels(ind(j))~=labels(ind(j)+height+1)
                neighbor(k)=labels(ind(j)+height+1);
                k=k+1;
            end
        end              
    end
    A=tabulate(neighbor);
    A(:,3)=[];
    a=find(A(:,2)==0);
    [NUM,~]=size(a);
    if NUM==0
        neighborhood{i}=A;
    else
        while(NUM~=0)
            A(a(NUM),:)=[];
            NUM=NUM-1;
        end
        neighborhood{i}=A;
    end   
end
    