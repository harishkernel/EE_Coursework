clc
clear all
disp('Single conductor');
D=input('Enter the diameter');
r=D/2;
d=input('Enter spacing');
Dab=input('Enter spacing between a and b');
Dbc=input('Enter spacing between b and c');
Dca=input('Enter spacing between c and a');
gmrl=input('Enter gmr for inductance:');
gmd=(Dab*Dbc*Dca)^(1/3);
gmrc=r;
L=0.2*(log(gmd/gmrl))
C=0.0556/(log(gmd/gmrc))
disp('three conductors');
D1=input('Enter the diameter');
r1=D1/2;
Dab1=input('Enter spacing between a and b');
Dbc1=input('Enter spacing between b and c');
Dca1=input('Enter spacing between c and a');
gmd1=(Dab1*Dbc1*Dca1)^(1/3);
Ds=0.7788*r1;
gmrl1=(Ds*(d^2))^(1/3);
gmrc1=(r1*(d^2))^(1/3);
L1=0.2*log(gmd1/gmrl1)
C1=0.0556/log(gmd1/gmrc1)
'Change in inductance in %=',((L-L1)/L)*100
'Change in capacitance in %=',((C-C1)/C)*100
