# VSPI Module 2 Failure Diagnosis

## Current Status
- ❌ Module 2 (VSPI) - **NOW FAILING**
- ❓ Module 1 (HSPI) - **Status unknown** (not shown in error)

## What Changed?

Since Module 2 was working before, something changed. Let's figure out what:

### Possibility 1: You Swapped the Modules
If you moved Module 2 to Module 1's position (HSPI pins), and it's now failing, this tells us:
- **If Module 2 fails in HSPI position** → HSPI pin connections are wrong
- **If Module 2 works in HSPI position** → Module 1 hardware is faulty

### Possibility 2: Wiring Got Disconnected
If you were checking connections and accidentally disconnected Module 2's wires.

### Possibility 3: Power Issue
If both modules are now failing, it could be a power supply problem.

---

## Quick Fixes

### Fix 1: Check Module 2 Connections

**Verify Module 2 (VSPI) connections:**

| nRF24 Pin | ESP32 GPIO | Check |
|-----------|------------|-------|
| Pin 1 (GND) | ESP32 GND | ⬜ |
| Pin 2 (VCC) | ESP32 3.3V + Cap | ⬜ |
| Pin 3 (CE) | GPIO 22 | ⬜ |
| Pin 4 (CSN) | GPIO 21 | ⬜ |
| Pin 5 (SCK) | GPIO 18 | ⬜ |
| Pin 6 (MOSI) | GPIO 23 | ⬜ |
| Pin 7 (MISO) | GPIO 19 | ⬜ |

**Action:**
1. Unplug USB
2. Check each Module 2 wire connection
3. Re-seat any loose connections
4. Verify capacitor is still connected
5. Plug in USB and test

---

### Fix 2: Restore Original Setup

If you swapped modules, restore to original:

**Module 1 (HSPI) - Original Position:**
- Pin 3 (CE) → GPIO 16
- Pin 4 (CSN) → GPIO 15
- Pin 5 (SCK) → GPIO 14
- Pin 6 (MOSI) → GPIO 13
- Pin 7 (MISO) → GPIO 12

**Module 2 (VSPI) - Original Position:**
- Pin 3 (CE) → GPIO 22
- Pin 4 (CSN) → GPIO 21
- Pin 5 (SCK) → GPIO 18
- Pin 6 (MOSI) → GPIO 23
- Pin 7 (MISO) → GPIO 19

---

### Fix 3: Check Power Supply

If both modules are failing:
1. Check USB cable connection
2. Try different USB port
3. Verify 3.3V is present at both modules' VCC pins
4. Check that both capacitors are connected

---

## What We Need to Know

Please tell us:
1. **Did you swap the modules?** (Move Module 2 to Module 1's position?)
2. **Did you change any wiring?**
3. **What's the status of Module 1?** (Does it show in the serial output?)
4. **Are both modules failing now, or just Module 2?**

This will help us diagnose the exact issue!

