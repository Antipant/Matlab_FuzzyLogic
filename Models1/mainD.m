clear all

x = 0;
y = 0; 
Teta =0; Omega = 0;  V =0;
N = 19000;
h=0.01;

af=readfis('Kurs.fis');
Xg = 200; Yg= 200; Teta0=atan(Yg/Xg);
% xo=100; yo=55;
xo=140; yo=150;
xo1=100;yo1=60;
i=0; Rg=100000;
while (Rg  > 0.5)

i=i+1;
    [xo,yo,Ro,Qo,Rg,Qg]=Points(3,x,y,Xg,Yg,xo,yo,xo1,yo1);

Qo = Qo -Teta; Qg=Qg - Teta;

if Rg > 30
    Rg = 30;
end
if abs(Qo) > 1.55
    Qo=1.55*sign(Qo);
end
if abs(Qg) > 3.15
    Qg=3.15*sign(Qg);
end
Out=evalfis([Ro, Rg, Qo, Qg],af);
Qc=Out(2);
Kvc =Out(1);

[x,y,V,Teta,Omega]=Dmodel(h,x,y,Qc,Kvc,V,Teta,Omega);
% if x >99
%     1;
% end
X(i)=x;
Y(i)=y;

if abs(x) > 240 || abs(y) > 240
    break
end
    end
  
 k =[1:N]*h;   
figure()
hold on
plot(X,Y)
figure(gcf)
plot(Xg,Yg,'*',xo,yo,'o',xo1,yo1,'o')
grid on
%k(end)/60