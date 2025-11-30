# ESP32-BlueJammer Hardware Checklist

## ✅ What You Already Have
- [x] ESP32 Development Board
- [x] nRF24 Modules (2x) - **Verify they are nRF24L01+PA+LNA versions**
- [x] Antennas (2x)
- [x] 10µF Capacitors (2x)

## 🔴 ESSENTIAL - You Still Need These

### 1. Power Supply
- **USB Cable** (Micro-USB or USB-C depending on your ESP32)
  - For powering the ESP32 during testing
  - Also needed for flashing firmware
  - **OR** Battery setup (see optional section below)

### 2. Wiring/Connection Method
Choose ONE:
- **Option A: Breadboard + Jumper Wires** (Easiest for testing)
  - Breadboard (half-size or full-size)
  - Jumper wires (male-to-male, ~20-30 wires recommended)
  - Allows easy prototyping and testing
  
- **Option B: Custom PCB** (For permanent build)
  - PCB design files available in repository
  - Requires PCB manufacturing
  - More professional but less flexible

### 3. Verify Your nRF24 Modules
**IMPORTANT**: Make sure your modules are **nRF24L01+PA+LNA** versions, not just basic nRF24L01
- **Basic nRF24L01**: Lower power, shorter range
- **nRF24L01+PA+LNA**: Has power amplifier and low noise amplifier (what you need)
- Check for external antenna connector on the module
- PA+LNA versions are larger and have better range

## 🟡 RECOMMENDED (But Not Essential for Basic Testing)

### Status LED (Optional but Useful)
- 1x Blue 3mm LED
- 1x 4.7kΩ Resistor
- Helps indicate when device is active

### USB Cable Quality
- Use a **data-capable USB cable** (not charge-only)
- Needed for firmware flashing
- Can also power the device

## 🟢 OPTIONAL (Nice to Have)

### For Portable Operation
- **TP4056 Charging Module** (Micro-USB or Type-C)
- **3.7V Li-Ion Battery** (1500mAh or higher)
- **JST PH 2.0 Connector**
- **Mini Slide Switch** (for power control)

### For Display/Status
- **0.96" OLED Display (I2C)** - Shows status information
- Requires "OLED version" firmware

### For Professional Build
- **Custom PCB** (7cm x 5.5cm)
- **3D Printed Case** (V3 or V4)
- **M3 Screws** (for case mounting)

### For Enhanced Range
- **Higher Gain Antennas** (12dBi)
- **4W 2.4GHz Amplifier**
- **E01-2G4M27D modules** (higher power nRF24 variants)

---

## Minimum Setup for Testing

To get started and test the device, you need:

1. ✅ ESP32 (you have)
2. ✅ 2x nRF24L01+PA+LNA modules (verify you have PA+LNA versions)
3. ✅ 2x 10µF capacitors (you have)
4. ✅ Antennas (you have)
5. 🔴 **USB Cable** (for power and flashing)
6. 🔴 **Breadboard + Jumper Wires** (or PCB)

That's it! Everything else is optional.

---

## Quick Verification Checklist

Before you start wiring:

- [ ] ESP32 has enough GPIO pins (need 38+ pins for full functionality)
- [ ] nRF24 modules are **PA+LNA versions** (check for antenna connector)
- [ ] Capacitors are 10µF and rated above 5V
- [ ] Antennas are 2.4GHz compatible
- [ ] USB cable can transfer data (not charge-only)
- [ ] Breadboard and jumper wires available (or PCB ready)

---

## Wiring Summary

You'll need to connect:
- **2x nRF24 modules** to ESP32 (HSPI and VSPI interfaces)
- **2x capacitors** (one per nRF24 module, between VCC and GND)
- **2x antennas** (one per nRF24 module)
- **Power** (via USB or battery)

Total connections needed: ~14 wires per module = 28 wires total (plus power)

---

## Next Steps

1. **Verify your nRF24 modules** are PA+LNA versions
2. **Get USB cable** for power/flashing
3. **Get breadboard + jumper wires** (or prepare PCB)
4. **Download firmware** from GitHub or use web flasher
5. **Wire everything up** according to pin configuration
6. **Flash firmware** using web flasher or ESP32 flasher tool
7. **Test!**

---

## Notes

- You can start with just USB power (no battery needed initially)
- Breadboard setup is fine for testing - you can move to PCB later
- Status LED is nice but not required for basic operation
- OLED display requires different firmware version

