# Component Update - Your Setup

## ✅ Your Components

1. **2x nRF24L01+PA+LNA Modules** ✅
2. **ESP32 DevKit** ✅
   - Has additional antenna connector option (circular connector on board)
   - This is a bonus feature for extended range!
3. **1.3" OLED Display** ⚠️
   - **Note:** Firmware shows "0.96" OLED" option
   - Your 1.3" OLED might work, but may need testing
   - Same I2C connections (GPIO 4 & 5)
4. **10µF 100V Capacitors** ✅
   - 100V rating is perfect (way above the 5V requirement)
   - These will work great!

---

## ⚠️ OLED Size Consideration

**Your 1.3" OLED vs Firmware Options:**

The web flasher shows:
- **"Generic"** - No OLED support
- **"0.96" OLED"** - Designed for 0.96" OLED

**Options:**

1. **Try "0.96" OLED" firmware first:**
   - Many 1.3" OLEDs use the same I2C interface (SSD1306 driver)
   - It might work, just might not fill the entire screen
   - Worth testing!

2. **Use "Generic" firmware:**
   - Will work perfectly for jamming
   - Just won't have OLED display
   - You can add OLED later if needed

3. **Check your OLED model:**
   - If it's SSD1306-based, it should work with 0.96" firmware
   - If it's SH1106 or different, might need different firmware

**Recommendation:** Start with "Generic" firmware to get it working, then test "0.96" OLED" firmware to see if your 1.3" display works.

---

## ESP32 Antenna Connector

Your ESP32 has an additional antenna connector - this is great for:
- Extended Wi-Fi range
- Better signal quality
- Optional enhancement

**Note:** This is for the ESP32's built-in Wi-Fi, not for the nRF24 modules (they have their own antennas).

---

## Next Steps

1. **Wire everything up** according to the guide
2. **Flash firmware:**
   - Start with **"Generic"** to test basic functionality
   - Then try **"0.96" OLED"** to see if your 1.3" display works
3. **Test the device**

---

## OLED Connections (When Ready)

If you want to try the OLED:
- **VCC** → ESP32 3.3V
- **GND** → ESP32 GND
- **SDA** → ESP32 GPIO 4
- **SCL** → ESP32 GPIO 5

Most 1.3" OLEDs use the same I2C interface, so it should work!

