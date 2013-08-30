function [ H ] = update_hip( V, H )
%updates the hipothesis H with the positive example V, making it more
%general
[~, k] = size(V);
for i = 1:k,
    if (H(i) == -1)
        H(i) = V(i);
    end
    if (H(i) ~= 0 && (H(i) ~= V(i)))
        H(i) = 0;
    end
end
end

