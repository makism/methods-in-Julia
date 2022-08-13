using DSP
using Plots

# Generate signal
fs = 128; # sampling frequency in Hz
dₜ = 1.0/fs; # seconds per sample
t = 0:dₜ:2.0-dₜ; # 2 seconds;
F = 60.0; # sine frequency in Hz
ω = 2 * π * F;

χ = sin.(ω * t)

# Plot
plot(χ, label="signal")
