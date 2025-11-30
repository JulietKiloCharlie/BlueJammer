# ESP32 Pins Needed for BlueJammer

## ✅ Pins You DO Need

### Power Pins (Required)
- **3.3V** - Powers both nRF24 modules (CRITICAL!)
- **GND** - Ground connection for both modules
- **VIN or 5V** - NOT needed for nRF24 modules (only if you want to power something else)

### Module 1 (HSPI) - Required Pins
- **GPIO 16** → nRF24 Module 1 CE
- **GPIO 15** → nRF24 Module 1 CSN
- **GPIO 14** → nRF24 Module 1 SCK (Serial Clock - THIS IS NEEDED!)
- **GPIO 13** → nRF24 Module 1 MOSI
- **GPIO 12** → nRF24 Module 1 MISO

### Module 2 (VSPI) - Required Pins
- **GPIO 22** → nRF24 Module 2 CE
- **GPIO 21** → nRF24 Module 2 CSN
- **GPIO 18** → nRF24 Module 2 SCK (Serial Clock - THIS IS NEEDED!)
- **GPIO 23** → nRF24 Module 2 MOSI
- **GPIO 19** → nRF24 Module 2 MISO

### USB Power (Required)
- **USB Port** - For powering ESP32 (provides 5V internally, ESP32 converts to 3.3V)

---

## ❌ Pins You DON'T Need

### Power Pins
- **5V pin** - NOT needed for nRF24 modules (they use 3.3V)
- **VIN pin** - NOT needed (unless powering other components)

### Clock Pins
- **CLK/System Clock pins** - NOT needed (these are internal)
- **BUT**: SCK (Serial Clock) pins ARE needed! (GPIO 14 and GPIO 18)

### Other Pins
- **IRQ pins** on nRF24 modules - NOT used
- **GPIO 4, 5** - Reserved for OLED (not needed yet)
- **GPIO 27** - Reserved for status LED (optional)

---

## ⚠️ Important Clarification

### SCK vs CLK
- **SCK (Serial Clock)** = GPIO 14 and GPIO 18 - **THESE ARE REQUIRED!**
  - These are the SPI clock signals for communication
  - Without these, the modules won't work
  
- **CLK (System Clock)** = Internal ESP32 clock pins - **NOT NEEDED**
  - These are internal to the ESP32 chip
  - You don't connect anything to these

### 5V vs 3.3V
- **5V pin** on ESP32 - **NOT NEEDED** for nRF24 modules
  - nRF24 modules use 3.3V only
  - Connecting nRF24 to 5V will **damage** the modules!
  
- **3.3V pin** on ESP32 - **REQUIRED!**
  - This powers both nRF24 modules
  - ESP32 provides this from USB power automatically

---

## Summary

**You DO need:**
- ✅ 3.3V pin (for power)
- ✅ GND pin (for ground)
- ✅ GPIO 14 (SCK for Module 1)
- ✅ GPIO 18 (SCK for Module 2)
- ✅ All other GPIO pins listed above
- ✅ USB port (for power)

**You DON'T need:**
- ❌ 5V pin (for nRF24 modules)
- ❌ VIN pin (unless powering other things)
- ❌ System CLK pins (internal only)
- ❌ IRQ pins on nRF24 modules

---

## Quick Answer

**5V pin?** ❌ NO - Don't use it for nRF24 modules (they need 3.3V)

**CLK pin?** ❌ NO - System clock pins are internal, not needed

**SCK pins?** ✅ YES - GPIO 14 and GPIO 18 are REQUIRED for SPI communication!

