x = [[None] * 3] * 3
for i in range(len(x)):
    for j in range(len(x[i])):
        x[i][j] = i+j

print(x)