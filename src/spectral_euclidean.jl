using LinearAlgebra
using Random

Random.seed!(0)

A = Symmetric(rand(5, 5))
B = Symmetric(rand(5, 5))

w = eigvals(A);
z = eigvals(B);

diff = (w - z) .^ 2.0;

d = diff |> sum |> sqrt
