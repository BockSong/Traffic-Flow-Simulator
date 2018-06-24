function entry = create_entry(T,L)
%生成车辆到来数的向量，entry_vertor(n)表示第n个时间步长达到的车辆数
% k = linspace(0,T,T.*60.*24);%生成一个向量，长度为T*60*24，初始值为0，终止值为T,步长为T/(T*60*24)
% a0 = 41.68;%交通流傅里叶展开式中系数
% entry = a0.*ones(size(k));
% a = [-16.38, -18.59, 3.572, 7.876, -.5048, -2.97, 0.2518, 0.5785];%交通流傅里叶展开式中系数
% b = [12.53, 0.6307, -13.67, 0.4378, 6.93, 0.4869, -1.554, -0.5871];%交通流傅里叶展开式中系数
% omega = 0.2513;
% for n = 1:8
%     entry = entry + a(n).*cos(n.*k.*omega) + b(n).*sin(n.*k.*omega);%交通流的傅里叶展开
% end
% k = k.*1440;
% entry = entry./24;%entry(n)表示第n个时间步长到达的车辆数
% entry = round(entry);
%%% FOR RUSH HOUR SIMULATION %%%
% k = linspace(0,T,T.*60.*24);
% entry = zeros(size(k));
% entry(1:2:length(k)) = L;

k = linspace(0,T,T.*60.*24);%生成一个向量，长度为T*60*24，初始值为0，终止值为T,步长为T/(T*60*24)
a0 = 41.68;%交通流傅里叶展开式中系数
entry = a0.*ones(size(k));
a = [-16.38, -18.59, 3.572, 7.876, -.5048, -2.97, 0.2518, 0.5785];%交通流傅里叶展开式中系数
b = [12.53, 0.6307, -13.67, 0.4378, 6.93, 0.4869, -1.554, -0.5871];%交通流傅里叶展开式中系数
omega = 0.2513;
for n = 1:8
    entry = entry + a(n).*cos(n.*k.*omega) + b(n).*sin(n.*k.*omega);%交通流的傅里叶展开
end
k = k.*1440;
entry = entry./24;%entry(n)表示第n个时间步长到达的车辆数
entry = round(entry);
