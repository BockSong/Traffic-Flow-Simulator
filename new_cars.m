function [plaza,v]= new_cars(plaza,xx,v)
    new=[0,0,0,0,0,0];
    if mod(xx,5)==0
    for i=1:6
        if rand>0
            new(i)=1;
        end
    end
    end
    for i = 1:6%ȡ���Լӵĳ������������ĳ������ߵ���Сֵ
        if plaza(1,i+1)==0
        plaza(1,i+1) = new(i);
        v(1,i+1) = new(i);
        end
    end