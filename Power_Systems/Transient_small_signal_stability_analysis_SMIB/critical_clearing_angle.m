clc;
clear all;
p=input('Enter power output:');
el=input('Enter the load voltage:');
vtot1=input('Enter total reactance between load and generator under prefault condition:');
vtot2=input('Enter net reactance during fault condition:');
vtot3=input('Enter  total reactance during post fault condition:');
h=input('Enter the value of kinetic energy of generator :');
f=input('Enter the frequency of the system:');
eg=1.17;
pmax1=(eg*el)/abs(vtot1);
pmax2=(eg*el)/abs(vtot2);
pmax3=(eg*el)/abs(vtot3);
K1=pmax2/pmax1;
K2=pmax3/pmax1;
pi=(22/7);
delo=(asin(p/pmax1));
Del_m=pi-asin(sin(delo)/K2);
del_cri=acos(((Del_m-delo)*sin(delo)+(K2*(cos(Del_m)))-(K1*cos(delo)))/(K2-K1));
del_cri_angle=del_cri*180/pi
cri_t=((2*h*(del_cri-delo))/(pi*f*p))^(1/2)
eacfault(p,eg,el,vtot1,vtot2,vtot3)
