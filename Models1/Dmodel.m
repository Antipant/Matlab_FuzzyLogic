function [x,y,v,Teta,Omega]=Dmodel(h,x,y,Qc,Kvc,v,Teta,Omega)
%
%h=0.01;
tauV1= 1/4;
tauQ1=1/0.4;
amax=3;
Tetamax=0.5236;
vmax=10;
vmin=3;
Omegamax=0.0457;
vc=Kvc*vmax;
    L = sqrt(x*x + y*y);
x = x +h* ( v *cos(Teta)  - L*Omega*sin(Teta));
y = y +h* ( v * sin(Teta) + L*Omega*cos(Teta));
%R=sqrt(x.^2+y.^2);
Teta = Teta + h*Omega;
Teta=Saturation(Teta,-Tetamax,Tetamax);
v = v + h*tauV1*AbsSatur((vc - v),amax);
v=Saturation(v,vmin,vmax);
Omega = tauQ1*AbsSatur((Qc-Teta),Omegamax);
 

%  end
end
function y = Saturation(x,xmin,xmax)
% minmax
y = x;
if x < xmin
    y=xmin;
    return
end
if x > xmax
    y = xmax;
end
end
function y = AbsSatur(x,xmax)
y = x;
if  abs(x)>xmax
    y=xmax*sign(x);
end
end
