# EE Coursework: Power Electronics, Electric Drives & Power Systems (MATLAB/Simulink)

Simulink models, MATLAB scripts and output plots for power electronics, electric drives and power systems: DC/induction/PMSM/BLDC drives, load flow, fault analysis, transient stability, load frequency control and relay characteristics.

Made by **Harish M** ([@harishkernel](https://github.com/harishkernel)), B.E. Electrical and Electronics Engineering, Easwari Engineering College, Chennai.

## Requirements
- MATLAB with Simulink
- Simscape Electrical (Specialized Power Systems), needed for the thyristor, IGBT, DC machine, induction machine and PMSM blocks

## How to run
1. Clone or download the repo.
2. In MATLAB, set the current folder to the topic folder you want.
3. Open the `.slx` (or `.mdl`) file and press **Run**.
4. Double-click the scopes to see speed, torque, current and voltage. Each folder's `output.pdf` shows the expected result.

## Required helper functions (Power Systems)
Two Power Systems scripts call functions that are not part of the scripts themselves. They are included in `Power_Systems/Helper_Functions/` and come from the MATLAB files that accompany Hadi Saadat's *Power System Analysis*. All credit for these functions goes to the author.

| Script | Helper functions it calls |
|---|---|
| `Power_Systems/Fault_analysis_LL_LG_LLG/Fault_analysis.m` | `zbuild`, `symfault`, `lgfault`, `llfault`, `dlgfault` |
| `Power_Systems/Newton_Raphson_Load_Flow_Analysis/Load_flow_analysis.m` | `lfybus`, `lfnewton`, `busout`, `lineflow` |

The other Power Systems scripts run on their own.

**Add the helper folder to the MATLAB path before running those two scripts:**

```matlab
% 1. Set MATLAB's current folder to the repo root (EE_Coursework)
% 2. Add the helper functions (and subfolders) to the path
addpath(genpath('Power_Systems/Helper_Functions'));

% 3. Move into the topic folder and run the script
cd Power_Systems/Fault_analysis_LL_LG_LLG
Fault_analysis
```

`addpath` lasts only for the current MATLAB session. To keep it permanently, use **Home > Set Path > Add with Subfolders**, select `Helper_Functions`, then **Save**. If MATLAB reports `Undefined function 'zbuild'` (or `lfybus` etc.), the helper folder is not on the path.

Several scripts also ask for inputs at the prompt (`input(...)`); enter values when asked.

## Contents

### Power Electronics
| Topic | Folder |
|---|---|
| Single-phase fully controlled rectifier circuit | [Open](Power_Electronics/Single_phase_full_controlled_rectifier_circuit) |

### Power Systems
| Topic | Folder |
|---|---|
| Y-bus calculation | [Open](Power_Systems/Ybus_calculation) |
| Z-bus calculation (building algorithm) | [Open](Power_Systems/Zbus_calculation) |
| Gauss-Seidel load flow analysis | [Open](Power_Systems/Gauss_Seidel_Load_Flow_Analysis) |
| Newton-Raphson load flow analysis | [Open](Power_Systems/Newton_Raphson_Load_Flow_Analysis) |
| Fault analysis: LG, LL and LLG faults | [Open](Power_Systems/Fault_analysis_LL_LG_LLG) |
| Transient stability of SMIB system: equal area criterion and critical clearing angle | [Open](Power_Systems/Transient_stability_SMIB_equal_area_criterion) |
| Two-area load frequency control (Simulink) | [Open](Power_Systems/Two_area_LFC) |
| Tie-line power and frequency deviation (Simulink) | [Open](Power_Systems/Tie_line_power) |
| Inverse definite minimum time (IDMT) overcurrent relay characteristics | [Open](Power_Systems/Inverse_Definite_Min_Time_Relay) |
| Transmission line parameters: inductance and capacitance with ACSR conductors | [Open](Power_Systems/Modelling_of_Transmission_line_parameters) |
| CT and PT testing (ratio and percent error) | [Open](Power_Systems/Transformer_CT_PT_Testing) |

### Electric Drives: DC motor
| Topic | Folder |
|---|---|
| Single-phase fully controlled bridge converter fed separately excited DC motor | [Open](Electric_Drives/Single_phase_fully_controlled_bridge_converter_fed_separately_excited_DC_motor) |
| Three-phase fully controlled converter fed DC motor | [Open](Electric_Drives/Three_phase_fully_controlled_converter_fed_DC_motor) |
| Open-loop chopper fed (MOSFET) separately excited DC motor drive | [Open](Electric_Drives/Open_loop_chopper_fed_MOSFET_separately_excited_DC_motor_drive) |
| Closed-loop PI speed control of chopper fed DC motor | [Open](Electric_Drives/Closed_loop_PI_speed_control_of_chopper_fed_DC_motor) |

### Electric Drives: Induction motor
| Topic | Folder |
|---|---|
| Open-loop VSI fed 3-phase induction motor drive (SPWM) | [Open](Electric_Drives/Open_loop_VSI_fed_3_phase_induction_motor_drive_SPWM) |
| Vector control (FOC with SVPWM) of 3-phase induction motor drive | [Open](Electric_Drives/Vector_control_FOC_with_SVPWM_of_3_phase_induction_motor_drive) |

### Electric Drives: Synchronous, PMSM and BLDC
| Topic | Folder |
|---|---|
| Speed control of wound-field synchronous motor drive | [Open](Electric_Drives/Speed_control_of_wound_field_synchronous_motor_drive) |
| Open-loop speed control of PMSM drive | [Open](Electric_Drives/Open_loop_speed_control_of_PMSM_drive) |
| BLDC / PMSM drive with Hall-sensor 6-step commutation | [Open](Electric_Drives/BLDC_PMSM_drive_with_Hall_sensor_6_step_commutation) |

## Topic details

### Single-phase fully controlled bridge converter fed DC motor
- **Circuit:** four thyristors on a single-phase AC source feeding a separately excited DC machine.
- **Control:** a ramp (repeating sequence) is compared with a control level to set the firing angle.
- **Output:** armature voltage, armature current, speed and electromagnetic torque.

### Three-phase fully controlled converter fed DC motor
- **Circuit:** six-thyristor bridge on a three-phase AC supply driving a DC machine with a load torque.
- **Control:** gate pulses T1 to T6 in sequence.
- **Output:** speed build-up, armature current, torque and output voltage ripple.

### Open-loop chopper fed DC motor drive
- **Circuit:** MOSFET chopper with pulse generator and freewheeling diode feeding the armature of a separately excited DC motor.
- **Output:** chopped voltage, armature current ripple, torque, speed and constant field current.

### Closed-loop PI speed control of chopper fed DC motor
- **Circuit:** GTO chopper with series RLC branch and freewheeling diode feeding a DC machine.
- **Control:** speed reference (120 rad/s) minus measured speed goes to a PI controller (proportional gain 1.6, integral gain 16), then a saturation block and relay that switch the GTO.
- **Output:** speed and torque response.

### Open-loop VSI fed 3-phase induction motor drive (SPWM)
- **Circuit:** three-phase IGBT voltage source inverter feeding a 460 V induction motor, with RMS voltage meters on the lines.
- **Control:** sinusoidal PWM reference generation.
- **Output:** rotor speed, electromagnetic torque and stator currents during start-up.

### Vector control (FOC with SVPWM) of 3-phase induction motor drive
- **Circuit:** 50 HP, 460 V induction motor on a three-phase inverter from a DC link.
- **Control:** field-oriented (vector) control generating alpha-beta voltage references for space-vector PWM, with selectable speed and torque references.
- **Output:** phase currents, rotor speed and electromagnetic torque.

### Speed control of wound-field synchronous motor drive
- **Circuit:** HV battery, converter and wound-field synchronous machine, with a two-quadrant chopper for field excitation.
- **Control:** speed request converted to torque command with limits.
- **Output:** rotor speed against reference, phase currents, torque and rotor electrical angle.

### Open-loop speed control of PMSM drive
- **Circuit:** PMSM fed by a three-phase IGBT inverter.
- **Control:** sine-triangle comparison with complementary gate signals, plus a load torque step.
- **Output:** PWM pole voltages, phase currents, rotor speed and torque.

### BLDC / PMSM drive with Hall-sensor 6-step commutation
- **Circuit:** universal bridge on a DC source driving a permanent magnet synchronous machine.
- **Control:** rotor position (theta) converted to Hall signals, which are decoded into six switching signals.

## Power Systems details
- **Y-bus / Z-bus:** builds the bus admittance matrix from line impedance and line charging data, and the bus impedance matrix with the building algorithm.
- **Load flow:** Gauss-Seidel and Newton-Raphson solutions on small test systems, with bus voltages and line flows.
- **Fault analysis:** line-to-ground, line-to-line and double line-to-ground faults using sequence networks.
- **Transient stability:** critical clearing angle of a single-machine infinite-bus system using the equal area criterion.
- **Load frequency control:** two-area system and tie-line power flow in Simulink, with frequency deviation plots.
- **IDMT relay:** operating time against fault current for a standard inverse overcurrent relay.
- **Transmission lines:** inductance and capacitance per km for three-phase lines with bundled ACSR conductors.
- **Instrument transformers:** CT and PT ratio error calculations from test data.

## Feedback and reuse
Found a bug or want to suggest an improvement? Open an issue. You're welcome to reuse the models for learning; see the LICENSE file for terms.