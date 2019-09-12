import matplotlib.pyplot as plt

init_values = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
               0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
           'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
filenames = ["ale.txt", "ang.txt", "cas.txt", "cat.txt", "fra.txt", "ita.txt"]


def add(c, count):
    count[ord(c)-ord('a')] += 1


for name in filenames:
    values = init_values.copy()
    f = open(name, "r")
    if f.mode == 'r':
        txt = f.read().split(' ')
    for word in txt:
        for c in word:
            add(c, values)
    plt.figure()
    plt.bar(letters, values)
    plt.title(name)
    plt.show()
