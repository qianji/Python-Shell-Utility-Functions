from library import *
import os
main_dir = os.path.split(os.path.abspath(__file__))[0]
def main():
   file_name = os.path.join(main_dir,'data',"data.txt")
   #print_unique_lines_from_file(file_name)
   print_line_count(file_name)

main()

