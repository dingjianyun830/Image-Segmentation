function [cent1,band1,he1,peak1,i]=ybh(yzi,err)
zd=max(yzi);
zx=max(yzi);
erro=err;
i=1;
n=0;
table=tabulate(yzi);
for m=1:size(table,1)
    if table(m,2)~=0
        n=n+1;
        x(n)=table(m,1);
        y(n)=table(m,3)/100;
    end
end
plot(x,y);
hold on
varz=var(yzi);
%数据规整
while max(y)>=erro
    [my,I]=max(y);
    core=x(I);
    delta = x(I-5:1:I+5);
    delta=var(delta);
    %初始的delta可以设置
    z=y;
    while min(z)>=(erro+0.0000000000005)
        delta=delta+0.001;
        %步长可以设置
        z=y-my*exp(-((x-core).^2)/(2*delta));
    end
    delta=delta-0.01;
    y=y-my*exp(-((x-core).^2/(2*delta)));
    peak1(i)=my;
    cent1(i)=core;
    band1(i)=delta;
    i=i+1;
end
for k=1:(i-1)
    he1(k)=sqrt(varz-band1(k)^2);
    %he1(k)=sqrt(varz-band1(k)^2);
end
k0=i-1;
for gg=1:i-1
    for  jsx=cent1(gg)-4*band1(gg):0.001:cent1(gg)+4*band1(gg)
         y=peak1(gg)*exp(-((jsx-cent1(gg)).^2/(2*band1(gg)^2)));
        plot(jsx,y,'-');
        hold on;
    end
end