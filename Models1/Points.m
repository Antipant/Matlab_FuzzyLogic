function [xo,yo,Ro,Oo,Rg,Og]=Points(i,x,y,Xg,Yg,xo,yo,xo1,yo1)
% X=[ 1 2 3 4 5 6 7 8 9 10]*2;
% Y =[ 1 2 3 4 5 6 7 8 9 10]*2;
rs=50; i =1;rf=25;
% xo=X(i); yo=Y(i);
% xo=100; yo=50;

[Ro1,Oo1]=Distance(xo1,x,yo1,y);

[Ro,Oo] =Distance(xo,x,yo,y) ;
if Ro > rs
    Ro = 57;
end

if Ro1 > rs
    Ro1=57;
end

if Ro>Ro1
    A=Ro;
    Ro=Ro1;
    Ro1=A;
    A=Oo;
    Oo=Oo1;
    Oo1=A;
end
    
[Rg,Og]=Distance(Xg,x,Yg,y);
% figure
% plot(X,Y)
% end
end
function [R,angle]=Distance(x1,x2,y1,y2)
% distance between point 1 and 2
dx=x1-x2;
dy=y1-y2;
R = sqrt(dx*dx +dy*dy);
angle=atan(dy/dx);
end
