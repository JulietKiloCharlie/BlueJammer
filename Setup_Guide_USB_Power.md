# ESP32-BlueJammer Setup Guide - USB Power (No OLED)

## What We're Building
- Basic ESP32-BlueJammer setup
- USB power only (no battery)
- No OLED display (we'll add that later)
- Just plug in USB and it works!

---

## Components Needed (What You Have)

✅ ESP32 Development Board  
✅ 2x nRF24L01+PA+LNA Modules  
✅ 2x 10µF Capacitors  
✅ 2x Antennas  
✅ USB Cable (data-capable)  
✅ Breadboard (half-size or full-size)  
✅ Jumper Wires (male-to-male, ~30 wires)  

---

## Step 1: Verify Your Components

### Check Your nRF24 Modules
- Should have **external antenna connector** (IPEX/U.FL connector)
- Should be labeled as **nRF24L01+PA+LNA** or have "PA+LNA" in description
- If they're just basic nRF24L01 without antenna connector, they won't work well

### Check Your ESP32
- Should have at least **38 pins** (most ESP32 DevKit boards have this)
- Should have **Micro-USB or USB-C port** for power/flashing

---

## Step 2: Breadboard Layout

Place components on breadboard:
```
[ESP32] - Place on one side of breadboard
[nRF24 Module 1] - Place near ESP32
[nRF24 Module 2] - Place near ESP32
[Capacitors] - Place near each nRF24 module
```

---

## Step 3: Wiring Connections

### Power Connections (Do This First!)

**ESP32 Power:**
- ESP32 **VIN** or **5V** → Connect to breadboard power rail (if using)
- ESP32 **GND** → Connect to breadboard ground rail
- **OR** just use USB cable directly (simplest)

**nRF24 Module 1 (HSPI) - Power:**
- nRF24 **VCC** → ESP32 **3.3V**
- nRF24 **GND** → ESP32 **GND**
- **10µF Capacitor**: Connect between nRF24 VCC (+) and GND (-)
  - Positive lead → VCC
  - Negative lead → GND

**nRF24 Module 2 (VSPI) - Power:**
- nRF24 **VCC** → ESP32 **3.3V**
- nRF24 **GND** → ESP32 **GND**
- **10µF Capacitor**: Connect between nRF24 VCC (+) and GND (-)
  - Positive lead → VCC
  - Negative lead → GND

### Data Connections

**nRF24 Module 1 (HSPI Interface):**
| nRF24 Pin | ESP32 GPIO | Wire Color (suggestion) |
|-----------|------------|-------------------------|
| CE | GPIO 16 | Red |
| CSN | GPIO 15 | Orange |
| SCK | GPIO 14 | Yellow |
| MOSI | GPIO 13 | Green |
| MISO | GPIO 12 | Blue |

**nRF24 Module 2 (VSPI Interface):**
| nRF24 Pin | ESP32 GPIO | Wire Color (suggestion) |
|-----------|------------|-------------------------|
| CE | GPIO 22 | Red |
| CSN | GPIO 21 | Orange |
| SCK | GPIO 18 | Yellow |
| MOSI | GPIO 23 | Green |
| MISO | GPIO 19 | Blue |

**IRQ pins are NOT used** - leave them unconnected

### Antenna Connections
- Screw antennas onto each nRF24 module's antenna connector
- Make sure they're tight and secure

---

## Step 4: Double-Check Your Wiring

Before powering on, verify:

- [ ] Both nRF24 modules have 10µF capacitors between VCC and GND
- [ ] All VCC connections go to ESP32 3.3V (NOT 5V!)
- [ ] All GND connections are connected
- [ ] Data pins match the table above
- [ ] Antennas are securely attached
- [ ] No short circuits (check for loose wires)

**IMPORTANT**: 
- nRF24 modules use **3.3V**, NOT 5V!
- Connecting to 5V will damage the modules!

---

## Step 5: Prepare Firmware

### Download Firmware

1. Go to: **https://github.com/EmenstaNougat/ESP32-BlueJammer**
2. Navigate to **Firmware_Files** folder
3. Download the **Generic** firmware (NOT the OLED version)
   - Look for files like: `bluejammer_generic.bin` or similar
   - The generic version doesn't require OLED display

**OR** use the web flasher (easier):

1. Go to: **https://esp32-bluejammerflasher.pages.dev**
2. Select **"Generic"** firmware type (not OLED)
3. Choose the firmware version you want

---

## Step 6: Flash Firmware

### Method 1: Web Flasher (Easiest - Recommended)

1. **Connect ESP32** to computer via USB cable
2. **Open browser** and go to: https://esp32-bluejammerflasher.pages.dev
3. **Select firmware type**: Choose **"Generic"** (not OLED)
4. **Select firmware version**: Choose latest version
5. **Click "Connect"** and select your ESP32 from the device list
6. **Click "Flash"** and wait for completion
7. **Done!** Device should restart automatically

### Method 2: ESP32 Flash Tool (Alternative)

If web flasher doesn't work:

1. Download **ESP32 Flash Tool** (like esptool.py or ESP32 Flash Download Tool)
2. Download the **.bin file** from GitHub
3. Flash using the tool:
   - Port: Select your ESP32 COM port
   - Address: Usually 0x1000
   - File: Select the downloaded .bin file
   - Click "Start" or "Flash"

**If ESP32 not recognized:**
- Install **CP2102 USB drivers** (or CH340 drivers depending on your ESP32)
- Check device manager for COM port

---

## Step 7: Test the Device

### Power On
1. **Plug in USB cable** to ESP32
2. **Plug USB into computer** or USB power adapter
3. ESP32 should power on (LED may blink)

### Verify Operation
- Device should start jamming automatically
- No buttons or configuration needed
- Just plug in and it works!

### Test Jamming
- Try connecting a Bluetooth device nearby
- Try using 2.4GHz Wi-Fi
- You should notice interference/disconnection

**Note**: Effectiveness depends on:
- Distance to target
- Antenna quality
- Environmental factors
- Target device sensitivity

---

## Troubleshooting

### Device Doesn't Power On
- Check USB cable (try different cable)
- Check USB port (try different port)
- Verify ESP32 isn't damaged

### Modules Not Working
- **Check voltage**: Make sure nRF24 modules are on 3.3V, NOT 5V!
- **Check capacitors**: Must be connected between VCC and GND
- **Check wiring**: Verify all connections match the pinout
- **Check antennas**: Must be securely attached

### Firmware Won't Flash
- Install USB drivers (CP2102 or CH340)
- Hold BOOT button while connecting USB
- Try different USB cable (must be data-capable)
- Try different USB port

### No Jamming Effect
- Verify antennas are attached
- Check that modules are PA+LNA versions
- Move closer to target device
- Check that firmware flashed successfully

### ESP32 Keeps Resetting
- Power supply issue - try different USB port/cable
- Check for short circuits
- Verify capacitors are connected correctly

---

## Wiring Diagram (Text Version)

```
ESP32                    nRF24 Module 1 (HSPI)
------                   --------------------
3.3V  ────────────────→  VCC (+Capacitor+)
GND   ────────────────→  GND (-Capacitor-)
GPIO16 ───────────────→  CE
GPIO15 ───────────────→  CSN
GPIO14 ───────────────→  SCK
GPIO13 ───────────────→  MOSI
GPIO12 ───────────────→  MISO

ESP32                    nRF24 Module 2 (VSPI)
------                   --------------------
3.3V  ────────────────→  VCC (+Capacitor+)
GND   ────────────────→  GND (-Capacitor-)
GPIO22 ───────────────→  CE
GPIO21 ───────────────→  CSN
GPIO18 ───────────────→  SCK
GPIO23 ───────────────→  MOSI
GPIO19 ───────────────→  MISO
```

---

## Quick Reference Pin Map

**ESP32 GPIO Usage:**
- GPIO 12, 13, 14, 15, 16 → nRF24 Module 1 (HSPI)
- GPIO 18, 19, 21, 22, 23 → nRF24 Module 2 (VSPI)
- GPIO 4, 5 → Reserved for OLED (not used yet)
- GPIO 27 → Reserved for status LED (optional)

---

## Next Steps (After It Works)

Once you have it working with USB power:

1. **Add OLED Display** (when it arrives in 2 days):
   - Flash "OLED version" firmware
   - Connect OLED to GPIO 4 (SDA) and GPIO 5 (SCL)

2. **Add Battery Power** (when ready):
   - Connect TP4056 module
   - Connect Li-Ion battery
   - Add power switch

3. **Improve Range**:
   - Better antennas
   - Power amplifier
   - Better positioning

---

## Safety Reminders

⚠️ **IMPORTANT**:
- Jamming is **illegal** in many jurisdictions
- Use only for **educational purposes**
- Use only in **authorized testing environments**
- Do not interfere with emergency communications
- You are responsible for your actions

---

## Summary

**What you're building:**
- ESP32 + 2x nRF24 modules
- USB powered
- Generic firmware (no OLED)
- Plug and play

**Steps:**
1. Wire everything up
2. Flash "Generic" firmware
3. Plug in USB
4. It works!

Good luck! Let me know if you run into any issues.

