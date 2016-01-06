M = [3, 10, 50, 100];
result = [];
for index=1:4
    winning = 0;
    for i=1:1000
        if GAMESHOW(M(index)) == 1
            winning = winning + 1;
        end
    end
    winning
    result = [result winning/1000];
end
result
plot(M, result,'c');
title('Result');
xlabel('number of doors');
ylabel('probability of winning');
hold off;
