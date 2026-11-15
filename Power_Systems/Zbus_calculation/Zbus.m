clc;
clear all;

zprimary=[
    1 1 0 0.25
    2 2 1 0.2
    3 3 1 0.1
    4 2 0 0.25
    5 2 3 0.1]
[elements columns]=size(zprimary)
zbus=[]
currentbusno=0
for count=1:elements
    [rows cols]=size(zbus)
    from=zprimary(count,2)
    to=zprimary(count,3)
    value=zprimary(count,4)
    newbus=max(from,to)
    ref=min(from,to)
    if newbus>currentbusno& ref==0
        zbus=[zbus zeros(rows,1)
            zeros(1,cols) value]
        currentbusno=newbus
        continue
    end
    if newbus>currentbusno& ref~=0
        zbus=[zbus zbus(:,ref)
            zbus(ref,:) value+zbus(ref,ref)]
        currentbusno=newbus
        continue
    end
    if newbus<=currentbusno& ref==0
        zbus=zbus-1/(zbus(newbus,newbus)+value)*zbus(:,newbus)*zbus(newbus,:)
        continue
    end
    if newbus<=currentbusno& ref~=0
        zbus=zbus-1/(value+zbus(from,from)+zbus(to,to)-2*zbus(from,to))*((zbus(:,from)-zbus(:,to))*((zbus(from,:)-zbus(to,:))))
        continue
    end
end
