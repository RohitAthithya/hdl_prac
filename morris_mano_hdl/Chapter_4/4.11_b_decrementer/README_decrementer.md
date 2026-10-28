<a id="top"></a>

# 4-Bit Combinational Decrementer using Half-Adders (Also Includes Full-Adder Approach)

> **Question from:** M. Morris Mano & Michael D. Ciletti - *Digital Design: With an Introduction to the Verilog HDL*, 5th Edition - Problem 4.11(b)

## Problem Statement

    4.11 Using four half-adders (HDL-see Problem 4.52),
    (a) Design a full-subtractor circuit incrementer. (A circuit that adds one to a four-bit binary number.)
    (b) Design a four-bit combinational decrementer (a circuit that subtracts 1 from a fourbit binary number)

**Complete problem definition with constraints solved here:**

Design a four-bit combinational **decrementer**, a circuit that subtracts `1` from a four-bit binary number, using **only four half-adders** and simple logic gates. Full adders are not part of the required book solution.

## Quick Navigation

- **Approach 1 - required by the question:** half-adders plus borrow-propagation logic  
  [Verilog solution](./4.11_b_decrementer.v) | [testbench](./tb_4.11_b_decrementer.v) | [math appendix](#appendix-a-approach-1-borrow-propagation)
- **Approach 2 - extra comparison:** full-adder/two's-complement style decrementer  
  [Verilog solution](./decrementer_with_FA.v) | [same testbench](./tb_4.11_b_decrementer.v) | [math appendix](#appendix-b-approach-2-full-adder-method)
- [Borrow flag and signed/unsigned notes](#appendix-c-borrow-flag-and-signed-vs-unsigned)
- [Tools used](#tools-used)

----------

Decrementer - must compute:

```text
diff = a - 1
```
### NOTE: Following are some corner cases in decrementer circuit.
```
Signed:
  - 0000 - 1 => diff = 1111 (-1) | borrow = 1 | overflow/underflow = 0 
  - 1111 - 1 => diff = 1110 (-2) | borrow = 0 | overflow/underflow = 0
  - 1000 - 1 => diff = 0111 (+7) | borrow = 0 | overflow = 1 
  ---- expected diff = 1 0111(-9)| borrow = 0 | overflow/underflow = 0 
Unsigned:
  - 0000 - 1 => diff = 1111 (15) | borrow = 1 | underflow = 1
  - 1111 - 1 => diff = 1110 (14) | borrow = 0 | overflow = 0
  - 1000 - 1 => diff = 0111 (7)  | borrow = 0 | overflow = 0

```
_Of course: Signed or unsigned is interpreted by Humans, For hardware its just the bits_

----
## Approach 1: Half-Adders And Borrow Logic

This is the intended solution for the question. Each bit uses one half-adder for the difference bit, while the borrow chain is created with inverters and AND gates.

### Verilog Code

Source: [4.11_b_decrementer.v](./4.11_b_decrementer.v)

The design instantiates four `HA_1bit` modules. The half-adder `sum` output becomes `diff[i]`; the half-adder `carry` output is intentionally unused. Borrow propagation is handled separately:

```verilog
assign interim_borrow[i+1] = interim_borrow[i] & (~(a[i]));
```

[Go to top](#top)

### Testbench

Source: [tb_4.11_b_decrementer.v](./tb_4.11_b_decrementer.v)

[Go to top](#top)

### Simulation Output

```text
inp=0  -> diff=1111, borrow=1
inp=1  -> diff=0000, borrow=0
inp=2  -> diff=0001, borrow=0
...
inp=15 -> diff=1110, borrow=0
```

[Go to top](#top)

### Output Explanation

Every output is `input - 1`. The only underflow case is `0000 - 1`, so `borrow` is `1` only for input `0`.

[Go to top](#top)

## Approach 2: Full-Adder / Two's-Complement Method

This approach is included only for comparison. It subtracts `1` by adding `1111`, which is the 4-bit two's-complement representation of `-1`.

### Verilog Code

Source: [decrementer_with_FA.v](./decrementer_with_FA.v)

The LSB is handled with a half-adder, and the upper bits use full adders:

```verilog
HA_1bit HA0 (... .a(a[0]), .b(1'b1));
FA_1bit FAx (... .a(a[i]), .b(1'b1), .carry_in(interim_borrow[i]));
```

This works, but answer doesn't qualify constraint of using 4 Half adders
[Go to top](#top)

### Testbench

Source: [tb_4.11_b_decrementer.v](./tb_4.11_b_decrementer.v)

The same testbench can be reused because both approaches expose the same `decrementer_4bit` module interface.

[Go to top](#top)

### Simulation Output

The output sequence should match Approach 1:

```text
inp=0  -> diff=1111, borrow=1
inp=1  -> diff=0000, borrow=0
...
inp=15 -> diff=1110, borrow=0
```

[Go to top](#top)

### Output Explanation

Adding `1111` is equivalent to subtracting `1` modulo 16. The final carry is inverted to form the unsigned `borrow` flag.

[Go to top](#top)

-------
-------
## Appendix A: Approach 1 Borrow Propagation

For each bit position `i`:

```text
diff[i]     = a[i] XOR borrow[i]
borrow[i+1] = NOT(a[i]) AND borrow[i]
```

The chain starts with `borrow[0] = 1` because the circuit is subtracting one.

Expanded for four bits:

```text
diff[0] = a[0] XOR 1       = NOT(a[0])
borrow[1] = NOT(a[0])

diff[1] = a[1] XOR borrow[1]
borrow[2] = NOT(a[1]) AND NOT(a[0])

diff[2] = a[2] XOR borrow[2]
borrow[3] = NOT(a[2]) AND NOT(a[1]) AND NOT(a[0])

diff[3] = a[3] XOR borrow[3]
borrow[4] = NOT(a[3]) AND borrow[3]
```

A half-adder already gives `sum = A XOR B`, so it naturally produces each `diff[i]`. Its carry output is not the borrow; the borrow is computed explicitly with simple logic.

[Go to top](#top)

## Appendix B: Approach 2 Full-Adder Method

Subtraction by one can also be written as:

```text
a - 1 = a + (-1)
```

In 4-bit two's complement, `-1` is `1111`, so the full-adder approach computes:

```text
a + 1111
```

This gives the same 4-bit `diff` output as Approach 1. For unsigned interpretation, the final carry tells whether the subtraction needed a borrow:

```text
borrow = NOT(final_carry)
```

[Go to top](#top)

## Appendix C: Borrow Flag And Signed Vs Unsigned

`borrow` is an unsigned underflow flag, not a signed overflow flag.

- Unsigned view: `0000 -> 1111` means `0 - 1` wrapped around, so `borrow = 1`.
- Signed two's-complement view: `0000 -> 1111` means `0 -> -1`, which is a valid signed result.

The gates do not change. Only the interpretation of the 4-bit result changes.

[Go to top](#top)

## Tools Used

- Simulator: Icarus Verilog (`iverilog`, `vvp`)
- Waveform viewer: GTKWave
- Reference: M. Morris Mano & M. D. Ciletti, *Digital Design with Verilog HDL*, 5th Ed., Problem 4.11(b)

[Go to top](#top)
