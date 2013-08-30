function [ V ] = gen_example( arch )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[~, k] = size(arch);
V = zeros(1,k);
for i = 1:k,
    V(i) = ceil(rand()*arch(i));
end
end

