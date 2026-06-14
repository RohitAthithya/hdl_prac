import os
from pathlib import Path

problem_names = ["4.10_a_incrementer", "4.10_b_decrementer"]
src_path = Path(r"C:\Personal\MSE_ASU\HDLBITS\morris_mano_hdl\Chapter_4")

for problem in problem_names:
    sub_dir = Path(src_path, problem)
    os.makedirs(sub_dir, exist_ok=True)
    with open( str(Path(sub_dir, problem + ".v")), "w+" ) as file:
        file.write(" ")
        pass
    with open( str(Path(sub_dir, "tb_" + problem + ".v")), "w+" ) as file:
        file.write(" ")
        pass
    