function anticlouds=cloud_transform(yzi,err,filename)
anticlouds=[];
nEx=[];
nEn=[];
nHe=[];
nfd=[];
nnum=[];
n=0;
yzi=yzi(:);
table=tabulate(yzi);
for m=1:size(table,1)
    if table(m,2)~=0
        n=n+1;
        x(n)=table(m,1);
        y(n)=table(m,3)/100;
    end
end
% plot(x,y);
% saveas(gcf,[filename '_histogram1.png']);
while max(y)>=err
    z=y;
    [fengzhi,loca]=findpeaks(y);
    [~,itry]=size(fengzhi);
    if itry==1 || itry==0 || itry==2
        break;
    end
    Ex = zeros(1,itry);
    En = zeros(1,itry);
    He = zeros(1,itry);
    num = zeros(1,itry);
    for i=1:itry
        a=yzi;
        A=x(loca(i)-1:1:loca(i)+1);
        B=z(loca(i)-1:1:loca(i)+1);
        IDE=find(a<A(1));
        a(IDE)=[];
        IDE=find(a>A(3));
        a(IDE)=[];
        [aa,~]=size(a);
        num(i)=aa;
        [Ex(i),En(i),He(i)]=back_cloud(a);
        C=B-exp(-((A-Ex(i)).^2)/(2*En(i)^2));
        y(loca(i)-1:1:loca(i)+1)=C;
        IDE=find(y<0);
        y(IDE)=0;
        %y(loca(i)-3:1:loca(i)+3)=[];
    end
    nEx=[nEx,Ex];
    nEn=[nEn,En];
    nHe=[nHe,He];
    nfd=[nfd,fengzhi];
    nnum=[nnum,num];
    num=[];
    Ex=[];
    En=[];
    He=[];
end
anticlouds(1,:)=nEx;
anticlouds(2,:)=nEn;
anticlouds(3,:)=nHe;
anticlouds(4,:)=nnum;
% filename=[filename,'Transform'];
% showclouds(anticlouds,filename);
    
    
    