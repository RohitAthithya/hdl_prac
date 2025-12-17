# HDLBits Solutions: (Sys)Verilog Clean Code Practice <img src="https://img.shields.io/static/v1.svg?label=%E2%AD%90&message=If%20Useful&color=blue">
---

<p align="center">
  <a href="https://hdlbits.01xz.net/wiki/Main_Page">
    <img src="https://hdlbits.01xz.net/images/logo270.png" alt="Logo" width="70" height="70">
  </a>
</p>

Welcome to this personal repository of (Sys)Verilog solutions for problem sets on HDLBits

---
## What can you find in my Repo? 🔍

Code solutions to problem sets in HDBits. Look out for the following in my code:\
--> Code Quality\
--> Code Readbility\
--> Code Extensibility\
--> Synthesiable code\
--> Useful/Meaningful comments

Look at me having fun with verilog and How I got addicted to HDL ⭐

---

## Purpose and Learning Goals 📚

This project serves two primary purposes:

**Study and Practice**: ___Strengthen foundation___: Combinational & Sequential circuit design, FSM, pipelining, bus interfaces, ___and more___.

**Code Quality and Professionalism**: Implementing and reinforcing clean code practices, design patterns, and style conventions from the master's course ***Digital Design for SoCs*** (instructed by ***[Steven Millman](https://search.asu.edu/profile/3420219)*** at **ASU**). The goal is to write not just *correct* code, but code that reflects professional standards in hardware design.

---
## Repository Structure 🏢

Each topic/group of problem sets on HDLBits => a subfolder of implemented code!

### Typical contents of each subfolder: [subjected to change in the future]

- **Solution files** (`.v` or `.sv`): Complete, verified implementations of the HDLBits problems in that section.
- **Success artifacts**: HDLBits waveform captures (``*.jpg``) and value-change dump files (`.vcd`) that demonstrate correct simulation behavior and serve as reference for debugging.
- **Notes and learnings** (optional `.md` or `.txt` files): Design decisions, key insights, debugging techniques, and conceptual takeaways from working through that problem set.

Example structure:
-----
```
repo/
├── README.md
├── 01-basics/
│   ├── wire.v
│   ├── notgate.v
│   ├── ...
│   └── info
│       └── additional info: images, waveforms & notes
├── ...
|
├── 03-vector/
│   ├── vector01.v
│   ├── vector02.v
│   ├── ...
│   └── info
│       └── additional info: images, waveforms & notes
└── ...
```

-----
## Simulation and Verification 🐞=> ❌ ; 🔍 => ✅

**HDLBits Testbenches**: Each solution is verified on HDLBits itself, which runs the code against a comprehensive set of test vectors and captures waveforms to confirm functional correctness.

**Beyond the Online Judge**: In parallel with the official HDLBits tests, I ensured functionality/extensibility with custom test cases and manual waveform inspection (`.vcd` files).

**Future Enhancements**: As familiarity with formal verification and testbench methodologies grows, this repository may be extended to include more structured, self-checking testbenches (SystemVerilog or similar) to complement HDLBits and practice rigorous design verification techniques. The intent is to demonstrate not just passing the online judge, but also the discipline of thorough, independent verification.

-----
## How to Use This Repository❓

1. **Browse by topic**: Explore subfolders in order or jump to areas of interest—each problem set is relatively self-contained. Problem statement for each set is declared atop the solutions files.
2. **Compare approaches**: Open the corresponding problem on [HDLBits](https://hdlbits.01xz.net/wiki/Main_Page), read the problem statement, and review the solution here to see one working approach and coding style.
3. **Study the design**: Read any accompanying notes or learnings files to understand the design decisions and key concepts.
4. **Inspect waveforms**: For complex designs, load the included `.vcd` files in your simulator to see the behavior in action.
5. Read the compiled clean code principles followed in ___Clean_Code_Principles.md___ file


-----
## Tools and Environment ⚙️

- **HDLBits**: Online problem and verification platform.
- **Verilog/SystemVerilog**: Primary hardware description languages.
- **Local development**: Git for version control and GitHub for remote backup and sharing.
- **Simulation**: Waveform analysis and debugging using standard Verilog simulation tools.

-----
## Acknowledgments 👥🎓

- [HDLBits](https://hdlbits.01xz.net/wiki/Main_Page) -- An outstanding, free online platform offering hands-on digital logic and hardware design exercises with instant simulation feedback.
Easy to build practical hardware design intuition by providing progressively challenging problems alongside immediate waveform-based verification, making it an invaluable resource for anyone serious about mastering RTL design.
- Arizona State University's ***EEE591: Digital Design for SoCs*** course and instructor ***Steven Millman*** for emphasizing professional coding practices and rigorous design methodology. - ***Thank you Steve!***

---

**Note**: This repository is maintained as a personal learning portfolio. Contributions and pull requests are welcome if you wish to suggest improvements or corrections to the solutions.

---
### UNLICENSE:
Checkout the licensing info in the ***File: UNLICENSE***