# 4-Bit Combinational Decrementer using Half-Adders

> **Problem Source:** M. Morris Mano & Michael D. Ciletti — *Digital Design: With an Introduction to the Verilog HDL*, 5th Edition — Problem 4.11(b)

---

## Problem Statement

Design a four-bit combinational **decrementer** — a circuit that subtracts 1 from a four-bit binary number — using **only four half-adders** and additional simple logic gates (inverters, AND gates). Full adders are explicitly **not allowed**.

---

## Why This Is Different From Most Online Solutions

Almost every YouTube video and online resource implements a 4-bit decrementer by chaining **four full adders** and adding the 2's complement of 1 (`1111`) to the input. This works, but each full adder internally contains two half-adders and an OR gate — meaning you're using a lot more hardware than necessary for the specific case of subtracting a constant value of 1.

The constraint here is deliberate: **only four half-adders**. This forces you to think about the circuit from first principles using the **borrow-propagation method**, which is more hardware-efficient for this specific task and directly mirrors how paper-and-pencil binary subtraction works.

---

## Mathematical Foundation

### Binary Subtraction With Borrow Propagation

When subtracting 1 from a binary number bit-by-bit, starting from the LSB:

For each bit position `i`, given input bit `X_i` and incoming borrow `borrow_i`:

- **Difference bit:**  
  `Y_i = X_i ⊕ borrow_i`

- **Borrow to next bit:**  
  `borrow_{i+1} = (NOT X_i) AND borrow_i`

The borrow propagates to the next position only if the current bit is 0 (i.e., it cannot give — it must borrow from above).

We start with `borrow_0 = 1` because we are subtracting 1.

### Expanded Equations for All 4 Bits

Starting with `borrow_0 = 1`:

```
Y_0 = X_0 ⊕ 1  =  NOT(X_0)
borrow_1 = NOT(X_0) · 1  =  NOT(X_0)

Y_1 = X_1 ⊕ borrow_1
borrow_2 = NOT(X_1) · borrow_1  =  NOT(X_1) · NOT(X_0)

Y_2 = X_2 ⊕ borrow_2
borrow_3 = NOT(X_2) · borrow_2  =  NOT(X_2) · NOT(X_1) · NOT(X_0)

Y_3 = X_3 ⊕ borrow_3
borrow_4 = NOT(X_3) · borrow_3  ← underflow/borrow-out flag
```

### Role of the Half-Adder

A half-adder takes two single-bit inputs `A` and `B` and produces:
- `Sum = A ⊕ B`
- `Carry = A · B`

The XOR is exactly what we need for the difference bit at each stage. The carry output of the half-adder is not used here; the borrow propagation is computed separately with an inverter and AND gate. This is why only the XOR part of each half-adder is consumed, and the circuit uses **exactly four half-adders** — one per bit.

---

## Circuit Architecture
_see image_: https://imgur.com/a/5QX4ea4

**Total hardware used:**
- 4 Half-Adders (using only their XOR/Sum output)
- 4 Inverters
- 4 AND gates

No full adders. No 2's complement adder chain.

---

## Verilog Implementation

### Half-Adder Module (`HA_1bit`)

```verilog
module HA_1bit (
    output sum, carry,
    input  a, b
);
    assign {carry, sum} = a + b;
endmodule
```

A clean, idiomatic 1-line half-adder. The `{carry, sum}` packing correctly places the carry in the MSB of the 2-bit result.

### 4-Bit Decrementer Module (`decrementer_4bit`)

```verilog
module decrementer_4bit (
    output wire [3:0] diff,
    output wire       borrow,
    input  wire [3:0] a
);
    wire [4:0] interim_borrow;

    assign interim_borrow[0] = 1'b1;           // borrow-in = 1 (subtracting 1)
    assign borrow = interim_borrow[4];         // borrow-out = underflow flag

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin
            HA_1bit hx (
                .sum(diff[i]), .carry(),        // carry output unused
                .a(a[i]), .b(interim_borrow[i])
            );
            assign interim_borrow[i+1] = interim_borrow[i] & (~a[i]);
        end
    endgenerate

endmodule
```

**Design notes:**
- `interim_borrow` is declared as `wire [4:0]`, not `reg`, because it is driven by continuous `assign` statements.
- The `generate` loop programmatically instantiates the four half-adders and borrow-chain logic.
- `.carry()` is intentionally left unconnected — the HA carry output is not needed; borrow propagation is handled explicitly.
- The `assign` inside `generate` is structural continuous assignment, which is the correct construct in this context.

---

## Testbench

```verilog
`timescale 1ps/1ps

module tb_decrementer;

    reg  [3:0] inp;
    wire [3:0] diff;
    wire       borrow;

    decrementer_4bit DUT (
        .diff(diff), .borrow(borrow),
        .a(inp)
    );

    initial begin
        $dumpfile("tb_decrementer_view.vcd");
        $dumpvars(0, tb_decrementer);
    end

    initial begin
        $monitor(" inp=(%d) => o/p: diff=(%b) ;; borrow=(%b)", inp, diff, borrow);
        #0;
        inp = 4'b0000;
        repeat(16) begin
            #1 inp = inp + 1;
        end
    end

endmodule
```

**Testbench notes:**
- `$monitor` is placed before the first assignment so the initial state is captured.
- `repeat(16)` steps through all 16 values starting from `0001` (after the initial `0000`), covering the wrap-around case `0000` again at the end.
- Both `diff` and `borrow` (underflow flag) are monitored.

---

## Simulation Output

```
VCD info: dumpfile tb_decrementer_view.vcd opened for output.
 inp=( 0) => o/p: diff=(1111) ;; borrow=(1)
 inp=( 1) => o/p: diff=(0000) ;; borrow=(0)
 inp=( 2) => o/p: diff=(0001) ;; borrow=(0)
 inp=( 3) => o/p: diff=(0010) ;; borrow=(0)
 inp=( 4) => o/p: diff=(0011) ;; borrow=(0)
 inp=( 5) => o/p: diff=(0100) ;; borrow=(0)
 inp=( 6) => o/p: diff=(0101) ;; borrow=(0)
 inp=( 7) => o/p: diff=(0110) ;; borrow=(0)
 inp=( 8) => o/p: diff=(0111) ;; borrow=(0)
 inp=( 9) => o/p: diff=(1000) ;; borrow=(0)
 inp=(10) => o/p: diff=(1001) ;; borrow=(0)
 inp=(11) => o/p: diff=(1010) ;; borrow=(0)
 inp=(12) => o/p: diff=(1011) ;; borrow=(0)
 inp=(13) => o/p: diff=(1100) ;; borrow=(0)
 inp=(14) => o/p: diff=(1101) ;; borrow=(0)
 inp=(15) => o/p: diff=(1110) ;; borrow=(0)
 inp=( 0) => o/p: diff=(1111) ;; borrow=(1)
```

### Output Verification Table

| inp (dec) | inp (bin) | diff (bin) | diff (dec) | borrow | Correct? |
|-----------|-----------|------------|------------|--------|----------|
| 0  | 0000 | 1111 | 15 | 1 | ✅ underflow (0 - 1 wraps to 15) |
| 1  | 0001 | 0000 | 0  | 0 | ✅ |
| 2  | 0010 | 0001 | 1  | 0 | ✅ |
| 3  | 0011 | 0010 | 2  | 0 | ✅ |
| 4  | 0100 | 0011 | 3  | 0 | ✅ |
| 5  | 0101 | 0100 | 4  | 0 | ✅ |
| 6  | 0110 | 0101 | 5  | 0 | ✅ |
| 7  | 0111 | 0110 | 6  | 0 | ✅ |
| 8  | 1000 | 0111 | 7  | 0 | ✅ |
| 9  | 1001 | 1000 | 8  | 0 | ✅ |
| 10 | 1010 | 1001 | 9  | 0 | ✅ |
| 11 | 1011 | 1010 | 10 | 0 | ✅ |
| 12 | 1100 | 1011 | 11 | 0 | ✅ |
| 13 | 1101 | 1100 | 12 | 0 | ✅ |
| 14 | 1110 | 1101 | 13 | 0 | ✅ |
| 15 | 1111 | 1110 | 14 | 0 | ✅ |

All 16 input combinations produce the correct output.

---

## Understanding the `borrow` Output Flag

The `borrow` output is **not** a signed overflow flag. It is a **unsigned underflow indicator**.

- `borrow = 1` only when input is `0000` (decimal 0), which underflows to `1111` (decimal 15, or -1 in signed 2's complement). This is equivalent to modulo-16 subtraction: `0 - 1 ≡ 15 (mod 16)`.
- `borrow = 0` for all inputs `0001` through `1111`, meaning the subtraction completed without underflow.

For signed 2's complement interpretation, the signed overflow case would be `1000` (-8) → `0111` (+7), but this requires a separate overflow detection circuit (comparing carry-into vs carry-out of the MSB), which is beyond this problem's scope.

---

## Signed vs Unsigned — Does It Matter?

No, the same hardware works for both interpretations. Both the borrow-based decrementer and a 2's complement adder implement the same modulo-2⁴ operation. The difference is only in how you interpret the bit pattern:

- **Unsigned:** `0000` → `1111` is underflow; borrow flag signals it.
- **Signed 2's complement:** `0000` (0) → `1111` (-1) is a valid result with no overflow.

The gates don't change — only your interpretation of the output changes.

---

## Tools Used

- **Simulator:** Icarus Verilog (`iverilog`, `vvp`)
- **Waveform Viewer:** GTKWave
- **Reference:** M. Morris Mano & M. D. Ciletti, *Digital Design with Verilog HDL*, 5th Ed., Problem 4.11(b)
