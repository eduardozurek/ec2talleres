import numpy as np

n = 1000

a = np.random.uniform(-1, 1, (n, n))
b = np.random.uniform(-1, 1, (n, n))

c = a @ b
