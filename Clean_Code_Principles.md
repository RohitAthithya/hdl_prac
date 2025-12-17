

`default_nettype none:
- throw error for unknown/undeclared wires/regs - do not assume type by default

Use concatenations to pack/unpack values instead of selecting ranges of bits, as possible. Concatenating ranges of bits also works. This idiom is very useful to meaningfully extract fields from raw data words (and to concisely document the field format), to group related signals into a single wide pipeline stage register, or to do fixed permutations of bits.





resources:
[Verilog Coding Standard](https://fpgacpu.ca/fpga/verilog.html)