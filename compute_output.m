function count = compute_output(plaza)
%每辆车的平均费时，计算离开收费站的总车辆数
count = sum(plaza(end,:)>0);