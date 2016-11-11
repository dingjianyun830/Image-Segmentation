function [b_Ex,b_En,b_He]=back_cloud(x)
b_Ex = mean(x);
b_En = mean(abs(x-b_Ex)) * sqrt(pi/2);
b_He = sqrt(var(x) - b_En^2);