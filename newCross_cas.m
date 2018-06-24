function [update_plaza,flag] = newCross_cas(plaza,cross_point)

update_plaza = plaza;
flag = 0;
for i=2:7
    if plaza(cross_point,i) == 1 %|| plaza(cross_point,i) == -2 ||plaza(cross_point,i) == -3 || plaza(cross_point,i) == -4 || plaza(cross_point,i) == -5
        flag = flag+1;
    end
end