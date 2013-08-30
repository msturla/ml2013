% counts the number of zeros in M
function k = count_zeros(M)
    k = 0;
    for i = 1:3,
        for j = 1:3,
            if (M(i,j) == 0)
                k = k + 1;
            end
        end
    end
end