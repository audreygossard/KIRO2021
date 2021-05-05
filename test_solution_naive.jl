include("parser.jl")
include("solution.jl")
include("naive_function.jl")


path = joinpath(".", "instances/instance_S.IN")
path_write_sol = joinpath(".", "solution_naive/sol_S.txt")

instance = read_instance(path)





write_solution(sol, path_write_sol)
