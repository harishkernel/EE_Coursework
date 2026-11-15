clc;
clear all;
busdata=[1 1 1.06 0 0 0 0 0 0 0
    2 3 1 0 0 0 0.5 0.2 0 0
    3 3 1 0 0 0 0.4 0.3 0 0
    4 3 1 0 0 0 0.3 0.1 0 0];
linedata=[1 2 2 -8
    1 3 1 -4
    2 3 0.666 -2.664
    2 4 1 -4
    3 4 2 -8];
fb=linedata(:,1);
tb=linedata(:,2);
r=linedata(:,3);
x=linedata(:,4);
y=r+i*x;
nbus=max(max(fb),max(tb));
nbranch=length(fb);
ybus=zeros(nbus,nbus);
for i=1:nbranch
    m=fb(i);
    n=tb(i);
    ybus(m,m)=ybus(m,m)+y(i);
    ybus(n,n)=ybus(n,n)+y(i);
    ybus(m,n)=-y(i);
    ybus(n,m)=ybus(m,n);
end
ybus
bus=busdata(:,1);
type=busdata(:,2);
v=busdata(:,3);
th=busdata(:,4);
genmw=busdata(:,5);
genmvar=busdata(:,6);
loadmw=busdata(:,7);
loadmvar=busdata(:,8);
qmin=busdata(:,9);
qmax=busdata(:,10);
p=genmw-loadmw;
q=genmvar-loadmvar;
vprev=v;
toler=1;
iteration=1;
while(toler>0.00001)
    for i=2:nbus
        sumyv=0;
        for k=1:nbus
            if i~=k
                sumyv=sumyv+ybus(i,k)*v(k);
            end
        end
        if type(i)==2
            q(i)=-imag(conj(v(i)))*(sumyv+ybus(i,i)*v(i));
            if (q(i)>qmax(i)||q(i)<qmin(i))
                if q(i)<qmin(i)
                    q(i)=qmin(i);
                else
                    q(i)=qmax(i);
                end
                type(i)=3;
            end
        end
        v(i)=(1/ybus(i,i))*((p(i)-j*q(i))/conj(v(i))-sumyv);
    end
    iteration=iteration+1;
    toler=max(abs(abs(v)-abs(vprev)));
    vprev=v;
end
iteration
v
vmag=abs(v)
ang=180/pi*angle(v)
