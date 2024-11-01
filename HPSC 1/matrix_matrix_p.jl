using LinearAlgebra, BenchmarkTools

n = 1000
A = rand(n, n)
B = rand(n, n)

function mm_product_loop(A, B)
    n = size(A, 1)
    C = zeros(n, n)
    for i in 1:n
        for j in 1:n
            for k in 1:n
                C[i,j] += A[i,k] * B[k,j]
            end
        end
    end
    return C
end

timeloop = @elapsed C = mm_product_loop(A, B)

function mm_product_col_wise(A, B)
    n = size(A, 1)
    CC = zeros(n, n)
    for j in 1:n
        CC[:,j] = A * B[:,j]
    end
    return CC
end

timeloopvec = @elapsed CC = mm_product_col_wise(A, B)
timevec = @elapsed CCC = A * B
println("Difference (C vs CC): ", norm(C - CC))
println("Difference (C vs CCC): ", norm(C - CCC))
println("Speedup (loop vs col-wise): ", timeloop / timeloopvec)
println("Speedup (loop vs built-in): ", timeloop / timevec)
println("Speedup (col-wise vs built-in): ", timeloopvec / timevec)
