using DSP
using Plots

# Generate signal
Ts = 0.001;
fs = 10;
τ = range(0.0, 2.0, step=Ts) |> collect
ω = 2*π*fs;
x = cos.(2*ω*τ);

# Filter design
fs = 10.0;
f_lo = 1.0;
f_hi = 4.0;
responsetype = Bandpass(f_lo, f_hi, fs=fs);

order = 3;
designmethod = Butterworth(order);

filter = digitalfilter(responsetype, designmethod);
y = filt(filter, x);

# Plot
plot(x, label="x")
plot!(y, label="filtered")
