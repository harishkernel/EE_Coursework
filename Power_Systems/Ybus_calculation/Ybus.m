clc;
clear all;
nb=input('Enter the number of buses')
nl=input('Enter the number of lines')
sb=[1 1 2 2 3 ]
eb=[2 3 3 4 4 ]
z=[0.02+0.08i     0.06+0.24i      0.04+0.16i      0.04+0.16i   0.01+0.04i]
b=[0.04i 0.04i 0.025i 0.025i 0.015i]
ybus=zeros(nb,nb)
for i=1:nl
m=sb(i);
n=eb(i);
ybus(m,m)=ybus(m,m)+(1/z(i))+b(i);
ybus(n,n)=ybus(n,n)+1/z(i)+b(i);
ybus(m,n)=-1/z(i);
ybus(n,m)=ybus(m,n);
end
ybus