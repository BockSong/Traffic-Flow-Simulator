function time = compute_wait(plaza)
%花费的总时间，所有车经过整个收费站的时间总和，计算元胞空间中的车辆数
time = sum(sum(plaza>0));