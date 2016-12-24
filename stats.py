import os
import sys

try :
    DIR = sys.argv[1]
except :
    print("Specify a directory!")
    sys.exit(1)
    
def parse_log(file) :
    data = list()
    for line in file :
        if line[:5] == 'epoch' :
            line_data = dict()
            sl = line.split()
            for i in range(len(sl) // 2) :
                key = sl[2*i]
                value = float(sl[2*i+1])
                line_data[key] = value
            data.append(line_data)
    return data
    
def save_stat(file, stat) :
    attrs = list(stat[0].keys())
    print(', '.join(attrs), file=file)
    for line_stat in stat :
        print(', '.join(str(line_stat[a]) for a in attrs), file=file)

for root, dirs, files in os.walk(DIR):
    print("Current directory", root)
#    print("Sub directories", dirs)
#    print("Files", files)
    all_data = dict()
    for file in files :
        if file[-4:] == '.log' :
            print('prosessing %s...'%file)
            data = parse_log(open(os.path.join(root, file)))
            all_data[file] = data
            save_stat(open(os.path.join(root, file+'.csv'), 'w'), data)
    
    n_data = len(all_data)
    if n_data == 0 : continue
    
    stat = list()
#    print(all_data)
    for line_datas in zip(*all_data.values()) :
        assert(len(line_datas) == n_data)
        line_stat = dict()
        for line_data in line_datas :
            for attr in line_data :
                line_stat.setdefault(attr, 0)
                line_stat[attr] += line_data[attr]
        for attr in line_stat :
            line_stat[attr] /= n_data
        stat.append(line_stat)
        
    save_stat(open(os.path.join(root, 'average.csv'), 'w'), stat)
                
            
