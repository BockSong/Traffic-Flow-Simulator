function [plaza,v,flag] = clear_boundary(plaza,v)
%��Ҫ�뿪ϵͳ�ĳ�������Ҫ��������ϵͳ���Ƴ�������Ԫ���ռ������һ�д���0 ����Ϊ0
[a,b] = size(plaza);
flag=0;
for i = 1:b
    if plaza(a,i) > 0
        plaza(a,i) = 0;
        v(a,i) = 0;
        flag=flag+1;
    end
end