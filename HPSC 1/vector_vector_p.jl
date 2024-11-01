# Vector-Vector Product (Dot Product)
using LinearAlgebra, BenchmarkTools

n = 10000
a = rand(n)
b = rand(n)
function dot_product_loop(a, b)
    c = 0.0
    for i in 1:n
        c += a[i] * b[i]
    end
    return c
end
timeloop = @elapsed c = dot_product_loop(a, b)
timevec = @elapsed cc = dot(a, b)
println("Difference: ", norm(c - cc))
println("Speedup: ", timeloop / timevec)