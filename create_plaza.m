function plaza = create_plaza(B, L)
%���ɶ�ά���飬��ʾԪ���ռ��״̬����
global plazalength;%��·����
%plazalength = 17;
plaza = zeros(plazalength,B+2);%����Ŀ��Ϊ��·�Ŀ��+2

plaza(1:plazalength,[1,2+B]) = -888;%һ��ʼʱ����һ�к����һ����Ϊ���ɽ���
for i=plazalength-14:plazalength-10
plaza(i,:) = [-888,-888,0,0,0,0,0,-888];
end
for i=plazalength-9:plazalength-5
plaza(i,:) = [-888,-888,-888,0,0,0,0,-888];
end
for i=plazalength-4:plazalength
plaza(i,:) = [-888,-888,-888,-888,0,0,0,-888];
end
