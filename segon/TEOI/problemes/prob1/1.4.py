import numpy as np
import matplotlib.pyplot as plt
import collections as cl

init_values = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
           'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']


# letter_init = {
#     'a': 0, 'b':0 , 'c':0, 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
#            'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
# }


filenames = ["ale.txt", "ang.txt", "cas.txt", "cat.txt", "fra.txt", "ita.txt"]


def divergence_from_U(v, t):
    sum = 0.0
    for p in v:
        if p != 0:
            sum += p*np.log(p*t)
    return sum


for name in filenames:
    values = init_values.copy()
    char_count = 0
    f = open(name, "r")
    if f.mode == 'r':
        txt = f.read()
    #     txt = f.read().split(' ')
    d = cl.Counter(txt)
    # for word in txt:
    #     for c in word:
    #         char_count += 1
    #         values[ord(c)-ord('a')] += 1
    # values = list(map(lambda x: float(x/char_count), values))
    for a in d:
        char_count += d[a]
    values = list(map(lambda x: float(x/char_count), d.values()))
    plt.figure()
    plt.bar(sorted(d.keys()), values)
    plt.title('filename: '+name+';\n'+'Kullback-Leibler divergence wrt U_n: ' +
              str(divergence_from_U(values, char_count))+'.')
    plt.show()
    # print(divergence_from_U(values, char_count))
