# ESP32-BlueJammer Comprehensive Research Document

## Project Overview

The **ESP32-BlueJammer** is a wireless interference device designed to disrupt 2.4GHz communications. It was created by @EmenstaNougat and has gained significant community attention with over 4,700 stars and 614 forks on GitHub (as of November 2025).

### Core Purpose
- Disrupt Bluetooth, BLE, Wi-Fi (2.4GHz), and RC device communications
- Generate noise and unnecessary packets causing interference
- Intended for controlled disruption and security testing
- **Educational purposes only** - jamming is illegal in many jurisdictions

---

## Hardware Components

### Required Components
1. **ESP32 Development Board**
   - Recommended: ESP32-32U CP2102
   - Must have 38+ pins for full functionality
   - Supports 802.11b/g/n (2.4GHz only, NOT 5GHz)

2. **nRF24L01+PA+LNA Modules (2x)**
   - High-power transceivers with Power Amplifier and Low Noise Amplifier
   - Operate exclusively in 2.4GHz ISM band (2.400-2.525 GHz)
   - Cannot operate at 5GHz frequencies

3. **10µF Capacitors (2x)**
   - Voltage rating: Above 5V
   - One capacitor per nRF24 module
   - Placed between VCC and GND for power stabilization

### Optional Components
- **0.96" OLED Display (I2C)** - For status display
- **TP4056 Charging Module** - Battery charging with thermal/overcharge protection
- **3.7V Li-Ion Battery** (1500mAh+) - For portability
- **JST PH 2.0 Connector** - Battery connection
- **Slide Switches (2x)** - Power control
- **Status LED** - Blue 3mm LED with 4.7kΩ resistor
- **Resistors:**
  - R1 = 1kΩ
  - R2, R3, R5, R7 = 47kΩ
  - R4, R6 = 100kΩ

### Advanced Enhancements
- **E01-2G4M27D nRF24L01 modules** - Higher power variants
- **12dBi Antennas** - Extended range
- **4W 2.4GHz Amplifier** - Significant range boost
- **Third Antenna** - IPEX to SMA-F pigtail (optional)

---

## Pin Configuration

### HSPI Interface (First nRF24L01 Module)
| nRF24L01 Pin | ESP32 GPIO | Notes |
|--------------|------------|-------|
| VCC | 3.3V | +10µF capacitor |
| GND | GND | -10µF capacitor |
| CE | GPIO 16 | |
| CSN | GPIO 15 | |
| SCK | GPIO 14 | |
| MOSI | GPIO 13 | |
| MISO | GPIO 12 | |
| IRQ | Not used | |

### VSPI Interface (Second nRF24L01 Module)
| nRF24L01 Pin | ESP32 GPIO | Notes |
|--------------|------------|-------|
| VCC | 3.3V | +10µF capacitor |
| GND | GND | -10µF capacitor |
| CE | GPIO 22 | |
| CSN | GPIO 21 | |
| SCK | GPIO 18 | |
| MOSI | GPIO 23 | |
| MISO | GPIO 19 | |
| IRQ | Not used | |

### Additional Components

#### Status LED
- GPIO 27 → 4.7kΩ Resistor → Blue LED (+) → GND

#### OLED Display (I2C) - Optional
- VCC → 3.3V
- GND → GND
- SCL → GPIO 5
- SDA → GPIO 4

#### Battery Modification - Optional
- 3.7V Li-Ion Battery → JST-PH2.0 Connector
- TP4056 Charging Module (Bat+/Bat-)
- Mini Slide Switch → 3V3 (ESP32)

---

## Frequency Coverage

### Target Frequencies (2.4GHz ISM Band Only)

| Protocol | Channels | Frequency Range | Channel Width |
|----------|----------|-----------------|---------------|
| **Bluetooth** | 79 | 2.402 - 2.480 GHz | 1 MHz |
| **BLE** | 40 | 2.400 - 2.4835 GHz | 2 MHz |
| **Wi-Fi (2.4GHz)** | 14 | 2.400 - 2.4835 GHz | 20 MHz |
| **RC Devices** | 1-125 | 2.400 - 2.525 GHz | 1 MHz |

### Limitations
- **5GHz Wi-Fi**: NOT supported (ESP32 and nRF24L01 cannot operate at 5GHz)
- **6GHz Wi-Fi**: NOT supported
- **Other bands**: NOT supported

---

## Performance Specifications

### Range
- **Standard Configuration**: 30+ meters
- **With Enhanced Antennas**: Significantly increased
- **With Amplifier**: Extended range (4W amplifier available)
- **Factors Affecting Range**:
  - Antenna quality and gain
  - Power amplifier capability
  - Environmental conditions
  - Obstacles and interference

### Effectiveness
- Varies based on target device Bluetooth version
- Newer Bluetooth versions may be more resistant
- Effectiveness depends on:
  - Signal strength
  - Distance to target
  - Environmental factors
  - Target device sensitivity

---

## Firmware

### Availability
- **Source Code**: CLOSED SOURCE (not publicly available)
- **Binary Files**: Available (.bin files)
- **Web Flasher**: Available at esp32-bluejammerflasher.pages.dev

### Firmware Versions
1. **Generic Version** - Standard firmware
2. **0.96" OLED Version** - Includes OLED display support

### Flashing Methods
1. **Web Flasher** (Recommended - Easy)
   - Visit: esp32-bluejammerflasher.pages.dev
   - Select firmware type
   - Connect ESP32 via USB
   - Flash directly from browser

2. **Binary Files** (Advanced)
   - Download .bin files from repository
   - Use any ESP32 flasher tool
   - Flash manually

### Drivers Required
- CP2102 USB-to-Serial drivers (if ESP32 not recognized)
- Available on Discord server

---

## PCB Design

### Specifications
- **Size**: 7cm x 5.5cm (CRITICAL - larger sizes won't fit in case)
- **Components**: ESP32 DevKitC, 2x nRF24 modules, OLED, LEDs, switches
- **Mounting**: Requires 2x M3 screw holes (must be drilled)

### PCB Features
- Fits ESP32-WROOM-32U/E DevKitC
- Accommodates 2 nRF24 modules
- 0.96" I2C OLED support
- LED indicators
- Switch controls
- Battery charging circuit support

---

## 3D Printed Case

### Versions
- **V3 Case**: 2 antenna version
- **V4 Case**: 3 antenna version (optional third antenna)

### Features
- Access to ESP32 micro-USB port
- Access to EN & Boot buttons
- TP4056 charging port access
- Charging state indicator holes (red=charging, blue=charged)
- On/off switch with blue indicator LED
- Fits ONLY 7cm x 5.5cm PCB

### Files
- STL files available for download
- Requires drilling 2 M3 screw holes in PCB

---

## Technical Implementation Details

### Jamming Techniques
The device uses multiple methods to disrupt communications:
1. **Noise Generation**: Continuous interference signals
2. **Packet Injection**: Sending unnecessary/invalid packets
3. **Frequency Hopping Disruption**: Interfering with adaptive frequency hopping
4. **Dual Module Operation**: Two nRF24 modules for broader coverage

### Why Two Modules?
- **HSPI and VSPI**: Allows simultaneous operation
- **Broader Coverage**: Can target multiple channels simultaneously
- **Increased Effectiveness**: Better disruption across frequency range

### Power Management
- **TP4056 Module**: Handles battery charging safely
- **Thermal Protection**: Prevents overheating
- **Overcharge Protection**: Protects battery
- **Power Switching**: Optional switch for battery power

---

## Alternative Open-Source Projects

### 1. Noisy Boy ESP32 Bluetooth Jammer
- **GitHub**: smoochiee/Noisy-boy-esp32-Bluetooth-jammer
- **Features**:
  - Web server interface
  - Configurable jamming parameters
  - Single or dual NRF24L01 support
  - Wi-Fi deauthentication
  - 2.4GHz spectrum scanning
- **Status**: Open source

### 2. Cypher Jammer
- **GitHub**: dkyazzentwatwa/cypher-jammer
- **Features**:
  - ESP32-WROOM-32D based
  - 2x NRF24L01+PA+LNA modules
  - Open source implementation
- **Status**: Open source

### 3. RF-Clown
- **GitHub**: cifertech/RF-Clown
- **Features**:
  - Triple NRF24 modules
  - OLED display
  - Tactile switches for navigation
  - NeoPixel feedback
  - Enhanced coverage
- **Status**: Open source

### 4. nRFBox
- **Repository**: git.robby.blue/RobbyV2/nRFBox
- **Features**:
  - Comprehensive 2.4GHz toolkit
  - Scanning capabilities
  - Spoofing functionality
  - Jamming capabilities
  - BLE jamming
  - Wi-Fi deauthentication attacks
  - Protocol disruption
- **Status**: Open source

### 5. Bluetooth-Jammer-ESP32
- **GitHub**: smoochiee/Bluetooth-jammer-esp32
- **Features**:
  - Basic Bluetooth jamming
  - nRF24L01 module
  - Noise signal generation
- **Status**: Open source

---

## Flipper Zero Integration

### ZeroWave_FlipperZero-BlueJammer
- **Official firmware port** of ESP32-BlueJammer
- **Platform**: ZeroWave extension board for Flipper Zero
- **Features**:
  - Flipper Zero as user interface
  - Directional pad control
  - Selectable jamming modes
  - Safe power management
- **Developer**: Official port by Emensta

---

## Legal and Ethical Considerations

### Legal Status
- **Illegal in many jurisdictions** including United States
- **FCC Prohibition**: Jamming devices are prohibited
- **Potential Consequences**:
  - Fines
  - Criminal charges
  - Interference with emergency communications
  - Legal penalties

### Intended Use
- **Educational purposes only**
- **Controlled security testing**
- **Authorized research environments**
- **Legal testing facilities**

### Disclaimer
- Use entirely at your own risk
- Not for malicious use
- Author not responsible for misuse
- Must comply with local laws

---

## Community and Development

### GitHub Statistics
- **Stars**: 4,700+
- **Forks**: 614+
- **Commits**: 97+ (as of November 2025)
- **Created**: July 7, 2024
- **Latest Release**: September 22, 2025 (Official board support)

### Active Issues
Common topics discussed:
- Range optimization
- Battery charging detection
- Firmware functionality
- Hardware configuration questions
- Performance improvements

### Resources
- **Discord Server**: Community support and drivers
- **Portfolio**: emensta.pages.dev
- **Web Flasher**: esp32-bluejammerflasher.pages.dev
- **3D Files**: Available in repository
- **Gallery**: Project images available

---

## Technical Limitations

### Hardware Limitations
1. **Frequency Range**: Limited to 2.4GHz only
   - Cannot jam 5GHz Wi-Fi
   - Cannot jam 6GHz Wi-Fi
   - Limited by nRF24L01 specifications

2. **ESP32 Wi-Fi**: Only supports 2.4GHz
   - 802.11b/g/n (2.4GHz)
   - Does NOT support 802.11a/ac/ax (5GHz)

3. **Range Limitations**: 
   - Depends on antenna and power
   - Environmental factors affect range
   - May not be effective against all devices

### Firmware Limitations
- **Closed Source**: Cannot modify firmware
- **Binary Only**: No source code access
- **Limited Customization**: Must use provided firmware

---

## Why Source Code is Closed

According to the developer (@EmenstaNougat):
- **Superior Performance**: Custom implementation with better range and coverage
- **Innovation**: Significant effort invested in development
- **Future Projects**: May use in other projects
- **Protection**: Protects intellectual property
- **Code Snippets**: Some snippets available for comparison

---

## Project Files Available

### Repository Contents
- **Firmware_Files/**: Binary firmware files
- **3D files/**: STL files for case printing
- **Gallery/**: Project images
- **README.md**: Documentation
- **LICENSE**: License file
- **PCB Designs**: Available (Gerber files)

---

## Comparison with Alternatives

| Feature | ESP32-BlueJammer | Noisy Boy | Cypher Jammer | RF-Clown |
|---------|------------------|-----------|---------------|----------|
| **Source Code** | Closed | Open | Open | Open |
| **Modules** | 2x nRF24 | 1-2x nRF24 | 2x nRF24 | 3x NRF24 |
| **Web Interface** | No | Yes | Unknown | Unknown |
| **OLED Support** | Yes | Unknown | Unknown | Yes |
| **Range** | 30m+ | Variable | Variable | Enhanced |
| **Community** | Large | Active | Active | Active |

---

## Key Takeaways

1. **2.4GHz Only**: Cannot jam 5GHz or other frequencies
2. **Dual Module Design**: Uses HSPI and VSPI for simultaneous operation
3. **Closed Source**: Firmware is proprietary
4. **Active Community**: Large GitHub following with active development
5. **Legal Restrictions**: Illegal in many jurisdictions
6. **Educational Purpose**: Intended for learning and authorized testing
7. **Multiple Alternatives**: Several open-source projects available
8. **Extensible**: Can be enhanced with better antennas and amplifiers

---

## References and Resources

### Official Resources
- **GitHub**: github.com/EmenstaNougat/ESP32-BlueJammer
- **Web Flasher**: esp32-bluejammerflasher.pages.dev
- **Portfolio**: emensta.pages.dev
- **Discord**: Community server for support

### Alternative Projects
- **Noisy Boy**: github.com/smoochiee/Noisy-boy-esp32-Bluetooth-jammer
- **Cypher Jammer**: github.com/dkyazzentwatwa/cypher-jammer
- **RF-Clown**: github.com/cifertech/RF-Clown
- **nRFBox**: git.robby.blue/RobbyV2/nRFBox

### Documentation
- PCB schematics and designs available
- 3D case files (STL) available
- Pinout diagrams provided
- Hardware layout guides

---

## Conclusion

The ESP32-BlueJammer is a sophisticated 2.4GHz jamming device with a large community following. While the firmware is closed-source, the hardware design is well-documented, and there are several open-source alternatives available for those interested in understanding or modifying the implementation. The project serves as an educational tool for understanding wireless communication vulnerabilities, but must be used responsibly and legally.

**Remember**: Jamming is illegal in many jurisdictions. Use only for educational purposes and authorized security testing.

