using DifferentialEquations
using ParameterizedFunctions
using Plots

u₀ = [1.0; 0.0; 0.0]
tspan = (0.0, 30.0)
p = [10.0, 28.0, 8/3]

lorentz = @ode_def begin
    dx = σ * (y - x)
    dy = x * (ρ - z) - y
    dz = x * y - β * z
end σ ρ β

prob = ODEProblem(lorentz, u₀, tspan, p)

sol = solve(prob, Tsit5(), saveat = 0.01)

x, y, z = sol[1, :], sol[2, :], sol[3, :];

fig = Plots.plot(x, y, z, line_z=1:length(z), w=2, legend=false, xshowaxis=false, zshowaxis=false, yshowaxis=false, xgrid=false, ygrid=false, zgrid=false, xticks=false, yticks=false, zticks=false)

