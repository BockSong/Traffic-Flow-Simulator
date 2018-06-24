function entry_vector = create_temp_entry(num,greenTime,redTime)

total = num*greenTime;
entry = zeros(total,1);
entry_series = [30:10:90];
for i=1:num
    n = floor(entry_series(i)/greenTime);
    mod_n = mod(entry_series(i),greenTime);
    for j=1:greenTime
        entry((i-1)*greenTime+j) = n;
    end
    series = randperm(greenTime);
    temp = series(1:mod_n) + (i-1)*greenTime;
    entry(temp) = entry(temp) + 1;
%     entry((i-1)*30+1:(i-1)*30+30)
%     sum(entry((i-1)*30+1:(i-1)*30+30))
end
k = 1;
entry_vector = zeros((greenTime+redTime)*num,1);
for i=1:num
    entry_vector((i-1)*(greenTime+redTime)+1:(i-1)*(greenTime+redTime)+greenTime) = entry((k-1)*greenTime+1:(k-1)*greenTime+greenTime);
%     sum(entry_vector((i-1)*(greenTime+redTime)+1:(i-1)*(greenTime+redTime)+greenTime))
    k = k+1;
end