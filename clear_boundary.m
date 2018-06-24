function [plaza,v,flag] = clear_boundary(plaza,v)
%将要离开系统的车辆，需要将车辆从系统中移除，即将元胞空间中最后一行大于0 的设为0
[a,b] = size(plaza);
flag=0;
for i = 1:b
    if plaza(a,i) > 0
        plaza(a,i) = 0;
        v(a,i) = 0;
        flag=flag+1;
    end
end