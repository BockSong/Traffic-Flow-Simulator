function [plaza,v,acone] = move_forward(plaza,v)
%ǰ������
%��Ϊ���δӳ�ǰ������ǰ��ɨ��ÿһ�������ֱ����շ�ͤǰ�棬�շ�ͤ���շ�ͤ����
%�����շ�ͤǰ���շ�ͤ��ĳ�������ó�ǰ��λ�ñ�һ����ռ�ã���ó�����Ϊ-2����ʾ����׼��
%���򣬸ó��Ը���Ϊprobǰ������ǰ���λ��
[L, W] = size(plaza); %get its dimensions
acone=0;
for i = (L-1):-1:1          
    for j = 1:W
        if i==L-1  %�߽��ٶȾ���
            v(i,j)=1;
        elseif i==L-2 && v(i,j)==3
            v(i,j)=2;
        end
        if plaza(i,j) == 1 
            if plaza(i+v(i,j), j) == 0     %������ʻ
                plaza(i,j) = 0;
                plaza(i+v(i,j), j) = 1;
                v(i+v(i,j), j) = v(i,j);
                v(i,j) = 0;
            else                          %����������
                if v(i,j)==1
                     plaza(i,j) = -2;               %ԭ�ز���������ж�
                elseif v(i,j)==2
                        if plaza(i+1, j)==0
                           v(i,j)=1;
                           plaza(i,j) = 0;
                           plaza(i+v(i,j), j) = 1;
                           v(i+v(i,j), j) = v(i,j);
                           v(i,j) = 0;
                        else
                            v(i,j)=1;
                            plaza(i,j) = -2;   %ԭ�ز���������ж�
                        end
                elseif v(i,j)==3
                        if plaza(i+2, j)==0
                           v(i,j)=2;
                           plaza(i,j) = 0;
                           plaza(i+v(i,j), j) = 1;
                           v(i+v(i,j), j) = v(i,j);
                           v(i,j) = 0;
                        elseif plaza(i+1, j)==0
                           v(i,j)=1;
                           plaza(i,j) = 0;
                           plaza(i+v(i,j), j) = 1;
                           v(i+v(i,j), j) = v(i,j);
                           v(i,j) = 0;
                           acone=acone+1;
                        else
                            v(i,j)=1;
                            plaza(i,j) = -2;   %ԭ�ز���������ж�
                            acone=acone+1;
                        end
                end
            end
        end
        end
end

for i = 1:L-5   %�������������
    for j = 2:4
        if plaza(i,j) == 1;
            plaza(i,j) = -3;
        end
    end
end

for i = 1:L-2   %road 5�������
        if plaza(i,5) == 1;
            plaza(i,5) = -4;
        end
end

for i = 1:L-2   %road 6�������
        if plaza(i,6) == 1;
            plaza(i,6) = -5;
        end
end