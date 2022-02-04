class Process:
    def __init__(self, name, time):
        self.name = name
        self.time = time

def Average(lst):
    return sum(lst) / len(lst)

procss_list = []
input_number = int(input("Enter Number of Process: "))
for i in range(input_number):
    name = input("Name:")
    time = float(input("Time: "))
    prcs = Process(name, time)
    procss_list.append(prcs)
init_time = 0
start_time=[]
for p in procss_list:
    start_time.append(init_time)
    print(init_time, end="-")
    print(p.name, end="-" )
    init_time = init_time + p.time
print(init_time)
average_time = Average(start_time)
print("Average Waiting Time:", average_time," ms")