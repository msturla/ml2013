function [ H ] = update_hip( V, H )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[~, k] = size(V);
b = 1;
for i = 1:k,
    if (H(i) == -1)
        H(i) = V(i);
    end
    if (H(i) ~= 0 && (H(i) ~= V(i)))
        H(i) = 0;
    end
end
end

