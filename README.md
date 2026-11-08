# 8-Bit PWM Controller ASIC Design (SkyWater 130nm)

This repository contains the complete RTL-to-GDSII ASIC design flow of an **8-bit Pulse Width Modulation (PWM) Controller** fabricated conceptually using the open-source **SkyWater 130nm PDK** and the **OpenLane** automated EDA toolchain.

---

## 📌 Project Overview
* **Function:** 8-bit hardware-level PWM pulse generation for motor speed & LED dimming control.
* **Technology:** SkyWater 130nm (`sky130_fd_sc_hd`)
* **Clock Frequency:** 100 MHz (Clock Period = 10.0 ns)
* **Die Area:** 100 µm x 100 µm (0.01 mm²)
* **Signoff Status:** 
  * **Magic DRC:** 0 Violations
  * **Netgen LVS:** 0 Errors
  * **Timing Slack (Setup & Hold):** Met without violations

---

## 🏗️ Architecture & Operation
The chip samples an 8-bit input (`duty[7:0]`) representing the target duty cycle (0 to 255). An internal synchronous 8-bit counter increments on every positive clock edge. The output `pwm_out` remains `HIGH` as long as `counter < duty`, producing a clean, jitter-free PWM output without loading the main CPU.

---

## 🚀 ASIC Flow Summary (OpenLane)
1. **Synthesis:** Yosys & ABC mapping to Sky130 standard cells.
2. **Floorplanning & PDN:** 100x100 µm boundary, I/O pin placement, and power grid rings.
3. **Placement:** Global and detailed placement with cell density optimization.
4. **CTS (Clock Tree Synthesis):** TritonCTS buffer tree with minimal clock skew.
5. **Routing:** TritonRoute multi-layer metal interconnects (met1 - met5).
6. **Signoff:** Static Timing Analysis (OpenSTA), Magic DRC, Netgen LVS, and GDSII generation.

---

## 📁 Repository Structure
* `/src`: Verilog RTL code (`pwm_controller.v`) and simulation testbench (`tb_pwm.v`).
* `/config.json`: OpenLane physical design configuration parameters.
* `/gds`: Final tapeout-ready GDSII mask (`pwm_controller.gds`).
* `/reports`: OpenLane metrics and manufacturability reports (`metrics.csv`, `manufacturability.rpt`).
