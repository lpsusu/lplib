using MathProgBase
using LPLib

# solve problem
c = Float64[-3, -5]
b = Float64[180, 150, 300]
A = Float64[1 0; 0 2; 3 2]
sense = ['<', '<', '<']
lower_bounds = -Inf
upper_bounds = Inf

sol = linprog(c, A, sense, b, lower_bounds, upper_bounds, LPSolver())

println(sol)

# testing equality
@test 1 == 1

# testing approximate equality
@test_approx_eq(1, 0.99999999999999)
@test_approx_eq_eps(1, 0.9, 0.1)

#testing throwing
function foo()
	error("error")
end

@test_throws ErrorException foo()
