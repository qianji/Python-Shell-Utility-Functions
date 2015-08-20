def get_lines_from_file(file_name):
    with open(file_name) as f:
        lines = f.readlines()
        return lines

def get_unique_lines_from_file(file_name):
    lines = get_lines_from_file(file_name)
    unique_lines=[]
    for line in lines:
        if not line in unique_lines:
            unique_lines.append(line)
    return unique_lines

def print_unique_lines_from_file(file_name):
    unique_lines = get_unique_lines_from_file(file_name)
    for line in unique_lines:
        print(line.strip())

def get_duplicate_dict(file_name):
    lines = get_lines_from_file(file_name)
    dic = dict()
    for line in lines:
        line= line.strip()
        if not line in dic:
            dic[line]=1
        else:
            count = dic[line]+1
            dic[line]=count
    return dic
def print_line_count(file_name):
    dic = get_duplicate_dict(file_name)
    for line in dic:
        two_word_sets = [line,str(dic[line])]
        print("\t".join(two_word_sets))
