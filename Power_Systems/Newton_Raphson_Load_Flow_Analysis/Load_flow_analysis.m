clc;
basemva=100;
accuracy=0.001;
maxiter=100;
% Load          Generator 
% busno.buscode Mag. Degree MW MVAR  MW MVAR QminQmax MVAR
busdata=[1 1 1.05 0 0 0 0 0 0 0 0 
    2 0 1 0 400 250 0 0 0 0 0
    3 2 1.04 0 0 0 200 0 0 0 0];

%                                             Line code
%          Bus bus   R      X     1/2 B   = 1 for lines
%           nlnr  p.u.   p.u.p.u.> 1 or < 1 tr. tap at bus nl
linedata=[1 2 0.02 0.04 0 1
          1 3 0.01 0.03 0 1
          2 3 0.0125 0.025 0 1];
lfybus
lfnewton
busout
lineflow