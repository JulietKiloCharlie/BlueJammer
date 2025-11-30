# OLED Display Troubleshooting Guide

## Current Status
- ✅ Both nRF24 modules - **WORKING**
- ❌ OLED Display - **NOT DISPLAYING CORRECTLY**

## Common OLED Issues & Solutions

### Issue 1: Wrong Firmware Version (MOST COMMON!)

**Problem:** You flashed "Generic" firmware instead of "OLED" firmware.

**Solution:**
1. Go to: **https://esp32-bluejammerflasher.pages.dev**
2. Select **"0.96" OLED"** firmware (even though you have 1.3" - it should work if it's SSD1306)
3. Flash the firmware again
4. Restart ESP32

**Why:** The "Generic" firmware doesn't include OLED display code. You need the OLED version.

---

### Issue 2: Wrong Pin Connections

**Verify OLED connections:**

| ESP32 Pin | OLED Pin | Check |
|-----------|----------|-------|
| 3.3V | VCC | ⬜ |
| GND | GND | ⬜ |
| GPIO 4 | SDA | ⬜ |
| GPIO 5 | SCL | ⬜ |

**Common Mistakes:**
- SDA and SCL swapped (GPIO 4 ↔ GPIO 5)
- VCC connected to 5V instead of 3.3V (will damage OLED!)
- Loose connections

**Action:**
1. Unplug USB
2. Verify each connection
3. Check that SDA → GPIO 4 and SCL → GPIO 5 (not swapped)
4. Plug in USB and test

---

### Issue 3: Wrong I2C Address

**Problem:** Some OLEDs use I2C address 0x3C, others use 0x3D.

**Solution:**
- Most 1.3" OLEDs use **0x3C** (default)
- If your OLED uses 0x3D, firmware may need modification
- Check your OLED's datasheet or try both addresses

**Test:**
- Use an I2C scanner sketch to find the address
- Or check serial output for I2C errors

---

### Issue 4: Display Shows Garbage/Corrupted

**Possible Causes:**
1. **Wrong resolution** - 1.3" OLED might be 128x64 or 128x32
2. **Wrong driver** - Some use SSD1306, others use SH1106
3. **Firmware mismatch** - Firmware expects different display size

**Solutions:**
- Try "0.96" OLED" firmware (usually works for 1.3" SSD1306)
- Check if display shows anything at all (even if wrong)
- If completely blank, check power and connections

---

### Issue 5: Display Completely Blank

**Checklist:**
- [ ] OLED VCC → ESP32 3.3V (NOT 5V!)
- [ ] OLED GND → ESP32 GND
- [ ] OLED SDA → ESP32 GPIO 4
- [ ] OLED SCL → ESP32 GPIO 5
- [ ] All connections are tight
- [ ] Firmware is "OLED" version (not "Generic")
- [ ] ESP32 is powered on

**Test:**
- Use multimeter to check 3.3V at OLED VCC pin
- Check for continuity on SDA and SCL lines

---

### Issue 6: Display Flickers or Unstable

**Possible Causes:**
- Power supply issue (not enough current)
- Loose connections
- I2C bus interference

**Solutions:**
- Try different USB port (more power)
- Check all connections are secure
- Add pull-up resistors if needed (though most OLEDs have them built-in)

---

## Step-by-Step Fix

### Step 1: Verify Firmware
1. Check which firmware you flashed
2. If "Generic" → Flash "0.96" OLED" firmware
3. If "OLED" → Continue to Step 2

### Step 2: Check Connections
1. Unplug USB
2. Verify OLED connections:
   - VCC → 3.3V
   - GND → GND
   - SDA → GPIO 4
   - SCL → GPIO 5
3. Re-seat any loose connections
4. Plug in USB and test

### Step 3: Test Display
1. Power on ESP32
2. Check serial monitor for I2C errors
3. Look at display - does it show anything?
   - **Completely blank** → Check power and connections
   - **Shows garbage** → Wrong firmware or display type
   - **Shows something but wrong** → Firmware/display mismatch

### Step 4: Try Alternative Firmware
If "0.96" OLED" doesn't work:
- Try "Generic" firmware (display won't work, but modules will)
- Or check if there's a "1.3" OLED" specific firmware version

---

## Quick Reference

**OLED Connections:**
```
ESP32 3.3V  →  OLED VCC
ESP32 GND   →  OLED GND
ESP32 GPIO 4 → OLED SDA
ESP32 GPIO 5 → OLED SCL
```

**Firmware Selection:**
- **"Generic"** → No OLED support
- **"0.96" OLED"** → OLED support (works with most 1.3" SSD1306 displays)

---

## What to Check First

1. **Firmware version** - Did you flash "OLED" firmware?
2. **Pin connections** - Are SDA/SCL correct? (GPIO 4/5)
3. **Power** - Is OLED getting 3.3V?
4. **Display type** - Is it SSD1306 or SH1106?

Let me know what you find!

