import LinearAlgebra
function bqp(Q, c, optimizer)
	m = JuMP.Model(optimizer)
	@JuMP.variable(m, x[1:size(Q, 1)], Bin)
	@JuMP.objective(m, Min, LinearAlgebra.dot(x, Q * x) + LinearAlgebra.dot(c, x))
	JuMP.optimize!(m)
	return JuMP.value.(x), m
end
