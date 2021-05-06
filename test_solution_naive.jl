include("parser.jl")
#include("solution.jl")
#include("naive_function.jl")


path = joinpath(".", "instances/A.json")
#path_write_sol = joinpath(".", "solution_naive/sol_S.txt")

read_instance(path)



#write_solution(sol, path_write_sol)
