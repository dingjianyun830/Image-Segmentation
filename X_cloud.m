function miu=X_cloud(Ex,En,He,x)
Enn = randn(1)*He + En;
miu = exp(-(x-Ex).^2/(2*Enn^2));