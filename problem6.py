import random 

mini = []

for i in range(1000000):
	e1 = random.random()
	e2 = random.random()
	mini.append(min(e1, e2))

print sum(mini)/ float(len(mini))

