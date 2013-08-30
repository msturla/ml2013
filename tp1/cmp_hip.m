function [ b ] = cmp_hip( V,H )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[~, k] = size(V);
b = 1;
for i = 1:k,
    if (H(i) ~= V(i))
        b = 0;
        break;
    end
end
end

