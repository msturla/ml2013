function [ b ] = cmp_hip( V,H )
%compares two hipothesis. returns true if they are equal.
[~, k] = size(V);
b = 1;
for i = 1:k,
    if (H(i) ~= V(i))
        b = 0;
        break;
    end
end
end

