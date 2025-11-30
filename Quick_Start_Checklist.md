# Quick Start Checklist - USB Power Setup

## ✅ Pre-Flight Check

- [ ] ESP32 board ready
- [ ] 2x nRF24L01+PA+LNA modules (with antenna connectors)
- [ ] 2x 10µF capacitors
- [ ] 2x antennas
- [ ] USB cable (data-capable)
- [ ] Breadboard
- [ ] Jumper wires (~30 wires)

---

## 🔌 Step 1: Power Connections

### nRF24 Module 1 (HSPI)
- [ ] VCC → ESP32 3.3V
- [ ] GND → ESP32 GND
- [ ] 10µF capacitor: + to VCC, - to GND

### nRF24 Module 2 (VSPI)
- [ ] VCC → ESP32 3.3V
- [ ] GND → ESP32 GND
- [ ] 10µF capacitor: + to VCC, - to GND

**⚠️ CRITICAL: Use 3.3V, NOT 5V!**

---

## 📡 Step 2: Data Connections

### Module 1 (HSPI) - Left Side
- [ ] CE → GPIO 16
- [ ] CSN → GPIO 15
- [ ] SCK → GPIO 14
- [ ] MOSI → GPIO 13
- [ ] MISO → GPIO 12

### Module 2 (VSPI) - Right Side
- [ ] CE → GPIO 22
- [ ] CSN → GPIO 21
- [ ] SCK → GPIO 18
- [ ] MOSI → GPIO 23
- [ ] MISO → GPIO 19

---

## 📶 Step 3: Antennas

- [ ] Antenna 1 → nRF24 Module 1 (screw on tight)
- [ ] Antenna 2 → nRF24 Module 2 (screw on tight)

---

## 🔍 Step 4: Double Check

- [ ] All VCC = 3.3V (NOT 5V!)
- [ ] All GND connected
- [ ] Both capacitors installed
- [ ] All data wires connected correctly
- [ ] Antennas attached
- [ ] No loose wires or short circuits

---

## 💾 Step 5: Flash Firmware

- [ ] Go to: https://esp32-bluejammerflasher.pages.dev
- [ ] Select **"Generic"** (NOT OLED)
- [ ] Connect ESP32 via USB
- [ ] Click "Connect" → Select your ESP32
- [ ] Click "Flash" → Wait for completion
- [ ] Device restarts automatically

**If web flasher doesn't work:**
- [ ] Install USB drivers (CP2102 or CH340)
- [ ] Download .bin file from GitHub
- [ ] Use ESP32 flash tool

---

## ⚡ Step 6: Test

- [ ] Plug in USB cable
- [ ] ESP32 powers on
- [ ] Test with Bluetooth device nearby
- [ ] Should see interference/disconnection

**Done!** 🎉

---

## 🆘 Troubleshooting Quick Fixes

| Problem | Solution |
|---------|----------|
| No power | Check USB cable, try different port |
| Modules hot | Check voltage (should be 3.3V, not 5V!) |
| Won't flash | Install USB drivers, hold BOOT button |
| No jamming | Check antennas, verify PA+LNA modules |
| ESP32 resets | Check power supply, look for shorts |

---

## 📝 Notes

- **Firmware**: Use "Generic" version (no OLED needed)
- **Power**: USB only for now (battery later)
- **Display**: Skip OLED for now (add in 2 days)
- **Voltage**: Always 3.3V for nRF24 modules!

---

**Ready to build?** Follow the checklist above step by step!

