using LinearAlgebra
using Statistics
using Random

Random.seed!(0)

A = rand(5, 5);

sym_A = Symmetric(A);

bin_A = sym_A .>= 0.6;

degree = vec(sum(bin_A, dims=2));
D = Diagonal(degree);

L = D - bin_A;

w = eigvals(L);

avg_degree = mean(degree);

le = sum(abs.(w .- avg_degree))
