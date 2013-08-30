function b = test_hip( V, T )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[~, k] = size(V);
b = 1;
for i = 1:k,
    if (T(i) ~= 0 && (T(i) ~= V(i)))
        b = 0;
        break;
    end
end
end

