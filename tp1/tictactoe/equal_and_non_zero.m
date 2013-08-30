function b = equal_and_non_zero(v1, v2, v3)
    b = v1 == v2 & v2 == v3 & v1 ~= 0;
end