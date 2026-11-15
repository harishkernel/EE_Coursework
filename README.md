# EE Coursework: Power Electronics & Electric Drives (MATLAB/Simulink)

Simulink models and output waveforms for common power electronics and electric drive topics: DC motor drives (rectifier and chopper fed), induction motor drives (VSI, vector control), and synchronous/PMSM/BLDC drives.

Made by **Harish M**, B.E. Electrical and Electronics Engineering, Easwari Engineering College, Chennai.

**Tools:** MATLAB, Simulink, Simscape Electrical (Specialized Power Systems). Each folder has the model file and an `output.pdf` with the circuit and simulation waveforms (speed, torque, current, voltage).

> Models are meant for learning and reference. Open the `.slx` / `.mdl` file in MATLAB and press Run. Feel free to use them, and open an issue if something doesn't work.

## Contents

### Power Electronics
| Topic | Files |
|---|---|
| Single-phase fully controlled rectifier circuit | [Model](Power_Electronics/Single_phase_full_controlled_rectifier_circuit) |

### Electric Drives: DC motor
| Topic | Files |
|---|---|
| Single-phase fully controlled bridge converter fed separately excited DC motor | [Folder](Electric_Drives/Single_phase_fully_controlled_bridge_converter_fed_separately_excited_DC_motor) |
| Three-phase fully controlled converter fed DC motor | [Folder](Electric_Drives/Three_phase_fully_controlled_converter_fed_DC_motor) |
| Open-loop chopper fed (MOSFET) separately excited DC motor drive | [Folder](Electric_Drives/Open_loop_chopper_fed_MOSFET_separately_excited_DC_motor_drive) |
| Closed-loop PI speed control of chopper fed DC motor | [Folder](Electric_Drives/Closed_loop_PI_speed_control_of_chopper_fed_DC_motor) |

### Electric Drives: Induction motor
| Topic | Files |
|---|---|
| Open-loop VSI fed 3-phase induction motor drive (SPWM) | [Folder](Electric_Drives/Open_loop_VSI_fed_3_phase_induction_motor_drive_SPWM) |
| Vector control (FOC with SVPWM) of 3-phase induction motor drive | [Folder](Electric_Drives/Vector_control_FOC_with_SVPWM_of_3_phase_induction_motor_drive) |

### Electric Drives: Synchronous, PMSM and BLDC
| Topic | Files |
|---|---|
| Speed control of wound-field synchronous motor drive | [Folder](Electric_Drives/Speed_control_of_wound_field_synchronous_motor_drive) |
| Open-loop speed control of PMSM drive | [Folder](Electric_Drives/Open_loop_speed_control_of_PMSM_drive) |
| BLDC / PMSM drive with Hall-sensor 6-step commutation | [Folder](Electric_Drives/BLDC_PMSM_drive_with_Hall_sensor_6_step_commutation) |

## Topic summaries

**Single-phase fully controlled bridge converter fed DC motor.** Four thyristors fed from a single-phase AC source supply a separately excited DC machine. Gate pulses come from a ramp (repeating sequence) compared with a control level, which sets the firing angle. Output shows armature voltage, armature current, speed and electromagnetic torque.

**Three-phase fully controlled converter fed DC motor.** Six-thyristor bridge on a three-phase AC supply driving a DC machine with a load torque. Plots show the speed rise, armature current, torque and output voltage ripple.

**Open-loop chopper fed DC motor drive.** A MOSFET chopper with a pulse generator and freewheeling diode supplies the armature of a separately excited DC motor. Waveforms show chopped voltage, armature current ripple, torque, speed and constant field current.

**Closed-loop PI speed control of chopper fed DC motor.** Speed reference is compared with measured speed, passed through a PI controller (gain plus limited integrator) and a relay, which switches a GTO chopper. Plots show speed and torque response.

**Open-loop VSI fed 3-phase induction motor drive (SPWM).** A three-phase IGBT voltage source inverter driven by sinusoidal PWM supplies an induction motor. Plots show rotor speed, electromagnetic torque and stator currents during start-up.

**Vector control (FOC with SVPWM) of induction motor.** Field-oriented control with space-vector PWM on a 50 HP, 460 V induction motor, with a DC link and switchable speed and torque references. Plots show phase currents, rotor speed and torque.

**Wound-field synchronous motor drive speed control.** Converter-fed synchronous machine with a two-quadrant chopper for field excitation and a speed controller. Plots show rotor speed against reference, phase currents, torque and rotor electrical angle.

**Open-loop PMSM drive speed control.** PMSM fed by a three-phase IGBT inverter using sine-triangle PWM. Plots show PWM pole voltages, phase currents, rotor speed and torque with a load step.

**BLDC / PMSM with Hall-sensor 6-step commutation.** A universal bridge commutated by switching signals derived from rotor position (Hall signals), driving a permanent magnet synchronous machine.

## Keywords
Simulink power electronics, electric drives simulation, thyristor rectifier DC motor, chopper fed DC motor, PI speed control, VSI induction motor SPWM, vector control FOC SVPWM, PMSM drive, BLDC Hall sensor six-step, wound field synchronous motor, MATLAB.
