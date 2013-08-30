function [ s, tot ] = learn_hip( T, arch )
% learns the hipothesis T with the architecture arch
% arch is a vector containing the cardinal of the attributes
% returns s(positive examples used) and tot (total examples used)
tot = 0;
s = 0;
[~, k] = size(T);
H = zeros(1,k);
for i = 1:k,
    H(i) = -1;
end
while(~cmp_hip(T, H))
    V = gen_example(arch);
    if (test_hip(V, T))
        H = update_hip(V, H);
        s = s + 1;
    end
    tot = tot + 1;
end
end