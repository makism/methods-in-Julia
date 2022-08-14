using DSP, Plots

# Generate signal
Ts = 0.001;
fs = 10;
τ = range(0.0, 3.0, step=Ts) |> collect
ω = 2*π*fs;
χ = sin.(ω*τ) + sin.(1.2*ω*τ);
h = hilbert(χ)
α = abs.(h);
#ϕ = unwrap(angle.(h));
ϕ = angle.(h);


plot(χ, label="signal")
plot!(ϕ)
plot!(α, label="+ envelope")
plot!(-α, label="- envelope")
