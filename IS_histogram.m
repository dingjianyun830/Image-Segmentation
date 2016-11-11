function ntarget=IS_histogram(ima,filename)

% check image
ima=double(ima);
ima=ima(:);         % vectorize ima
mi=min(ima);        % deal with negative 
ima=ima-mi+1;       % and zero values

% create image histogram

h=histogram(ima);
x=find(h);
h=h(x);
x=x(:);
h=h(:);
% [pks,locs]=findpeaks(h);
% ntarget = length(pks);
[pks,locs]=findpeaks(h,'MINPEAKDISTANCE',20,'THRESHOLD',0.000015);
n = length(pks);
if n ==1
    ntarget = 2;
else
    c = locs(2:n)-locs(1:n-1);
    ind = find(c>=200);
    ntarget = n + length(ind);
end
clf
set(gcf,'visible','off');
plot(x,h);
hold on
plot(x(locs),pks,'k^','markerfacecolor',[1 0 0]);
xlabel('The Value of Pixels','FontName','Times New Roman','FontSize',10);
ylabel('The Frequency','FontName','Times New Roman','FontSize',10,'Rotation',90);
print('-dtiff','-r600',filename);




function[h]=histogram(datos)
datos=datos(:);
ind=find(isnan(datos)==1);
datos(ind)=0;
ind=find(isinf(datos)==1);
datos(ind)=0;
tam=length(datos);
m=ceil(max(datos))+1;
h=zeros(1,m);
for i=1:tam,
    f=floor(datos(i));    
    if(f>0 && f<(m-1))        
        a2=datos(i)-f;
        a1=1-a2;
        h(f)  =h(f)  + a1;      
        h(f+1)=h(f+1)+ a2;                          
    end;
end;
h=conv(h,[1,2,3,2,1]);
h=h(3:(length(h)-2));
h=h/sum(h);






