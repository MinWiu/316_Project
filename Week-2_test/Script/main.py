import os
import time
os.system('clear')
os.system('python3 ~/Desktop/BT2_CE434/Assignment2_vivado/Python/imagetoFP.py')
os.system('vsim -c -do "run.do;run -all" testbench')
print('complete vsim')
os.system('python3 ~/Desktop/BT2_CE434/Assignment2_vivado/Python/fpToImageHSV.py')