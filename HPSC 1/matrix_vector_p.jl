using LinearAlgebra, BenchmarkTools

n = 100
A = rand(n, n)
x = rand(n)

function mv_product_loop(A, x)
    n = size(A, 1)
    b = zeros(n)
    for i in 1:n
        for j in 1:n
            b[i] += A[i,j] * x[j]
        end
    end
    return b
end

timeloop = @elapsed b = mv_product_loop(A, x)

function mv_product_row_wise(A, x)
    n = size(A, 1)
    bb = zeros(n)
    for i in 1:n
        bb[i] = dot(A[i,:], x)
    end
    return bb
end

timeloopvec = @elapsed bb = mv_product_row_wise(A, x)

timevec = @elapsed bbb = A * x

println("Difference (b vs bb): ", norm(b - bb))
println("Difference (b vs bbb): ", norm(b - bbb))

println("Speedup (loop vs row-wise): ", timeloop / timeloopvec)
println("Speedup (loop vs built-in): ", timeloop / timevec)
println("Speedup (row-wise vs built-in): ", timeloopvec / timevec)
