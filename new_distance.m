function distance=new_distance(clouds,highcloud)
Ex=clouds(1,:);
A=abs(Ex-highcloud(1));
IDX=find(A==0);
[~,itry]=size(IDX);
if itry==0
    distance=A;
else
    distance=A;
    close_clouds=clouds(:,IDX);
    distance(IDX)=sigma(close_clouds,highcloud);
end