using Pkg
Pkg.activate("..")
Pkg.instantiate()
using JPEC, Plots


# Make sine and cosine spline
xs = range(0.0, stop=2*pi, length=20)
xs = collect(xs)
#fs = sin.(xs)
#fc = cos.(xs)
fs = 2.0 .* xs
fc = -2.0 .* xs
# Make a vector of vectors of (100,2) for the spline
fs_matrix = hcat(fs, fc)

print(xs)

spline = JPEC.SplinesMod.spline_setup(xs, fs_matrix, 2)

print("!!!")

xs_fine = collect(range(0.0, stop=2*pi, length=100))
fs_fine = JPEC.SplinesMod.spline_eval(spline, xs_fine)

print(xs_fine)
print(fs_fine)

plot(xs_fine, fs_fine, label="spline", legend=:topright)
# plot the input data scatter
scatter!(xs, fs, label="sin(x)", legend=:topright)
scatter!(xs, fc, label="cos(x)", legend=:topright)