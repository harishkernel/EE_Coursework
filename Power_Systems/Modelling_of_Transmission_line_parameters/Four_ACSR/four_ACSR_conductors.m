clc
clear all
D=input('Enter the diameter of conductor:');
d=input('Enter the spacing:');
r=D/2;
Dab=input('Enter spacing between a and b:');
Dbc=input('Enter spacing between b and c:');
Dca=input('Enter spacing between c and a:');
gmd=(Dab*Dbc*Dca)^(1/3);
Ds=0.7788*r;
gmrl=1.09*(Ds*d^(3))^(1/4);
gmrc=1.09*(r*d^(3))^(1/4);
L=0.2*log(gmd/gmrl);
C=0.0556/log(gmd/gmrc);
'The inductance in mh/km:',L
'The capacitance in microf/km:',C
