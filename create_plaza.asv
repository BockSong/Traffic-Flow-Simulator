function plaza = create_plaza(B, L)
%生成二维数组，表示元胞空间的状态矩阵
global plazalength;%道路长度
%plazalength = 17;
plaza = zeros(plazalength,B+2);%数组的宽度为道路的宽度+2

plaza(1:plazalength,[1,2+B]) = -888;%一开始时，第一列和最后一列设为不可进入
for i=plazalength-14:plazalength-10
plaza(i,:) = [-888,-888,0,0,0,0,0,-888];
end
for i=plazalength-9:plazalength-5
plaza(i,:) = [-888,-888,-888,0,0,0,0,-888];
end
for i=plazalength-4:plazalength
plaza(i,:) = [-888,-888,-888,-888,0,0,0,-888];
end
