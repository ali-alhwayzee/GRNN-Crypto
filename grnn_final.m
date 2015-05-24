
N = 4
K = [27; 14; 68;143]
inp = power(2, N)
d = (0:inp-1)';
b = de2bi(d, N, 'left-msb')
t = zeros(inp, 1)
for i = 1:inp
    for j = 1:N
        disp(b(i,j));
        t(i) = t(i) + b(i,j)*K(j)
    end
end

bin_t = de2bi(t, inp, 'left-msb')
disp(bin_t)
% Train the data
net = newgrnn(rot90(b),rot90(bin_t));
Q = b
v = rot90(sim(net,rot90(Q)), 3);

partial_b = b(1:inp/2, :)
partial_bin_t = bin_t(1:inp/2, :)
net = newgrnn(rot90(partial_b),rot90(partial_bin_t));
Q = b
half_trained_v = rot90(sim(net,rot90(Q)), 3);

