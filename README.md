# An open-source system for pupillometric tracking in head-fixed mice

Designed by members of the Rodriguez-Romaguera Lab at the University of North Carolina at Chapel Hill, this running wheel for head-fixed mice allows researchers to capture pupil dynamics and body kinematics. Our system relies on two sperate cameras, an infared camera placed at eye-level to capture pupil size and an aerial monochrome camera to record body kinematics. Additionally, our system is capable of capturing  locomotion, or the mouse's movement across time, as our wheel system is attatched to a mounted rotary encoder.


![Complete Pupillometry System](https://github.com/jovantormesvaquerano/PeRo-Lab-Pupillometry-Wheel/assets/135740829/22fac3c5-26e8-41bd-9761-33d093ffc762)


**Behavioral Data Collected**:
- IR Camera → Pupil Dynamics (Dilation and Constriction)
- Monochrome Camera → Body Kinematics (Body and Tail Movement)
- Rotary Encoder → Locotion (Speed and Acceleration)

**Custom Arduino Printed Circuit Board Shield**:
Our system is driven and controlled by an Arduino Mega 2560 microcontroller board, with a custom printed circuit board (PCB) shield with build in resistance, interactive feedback LEDs, real-time clock compatibility, and screw hole terminals. The PCB shield expands the capabilities of the microcontroller board and allows for greater stability than a conventional solderless circuit board. 

**Required Software and Applications**:
- MATLAB R2022a 
- Arduino IDE 
- Spinnaker SDK (Spinview GUI)
- DeepLabCuts

# Commercially Avaliable and Custom Made Parts 

The following [component list](1-Pupillometry-Components-Table.pdf) details the manufacturer, part number, and quantity of each item required. This [version](2-Color-Coded-Pupillometry-Components-Table.pdf) of the component list contains a color coded key which provides an additional layer of support when building the system. 

<table class="table table-bordered table-hover table-condensed">
<thead><tr><th title="Field #1">Part Number</th>
<th title="Field #2">Distributor</th>
<th title="Field #3">Part Name</th>
<th title="Field #4">Distributor Part Number</th>
<th title="Field #5">Quantity Needed</th>
<th title="Field #6">Unit Price</th>
<th title="Field #7">Total Price</th>
</tr></thead>
<tbody><tr>
<td align="right">1</td>
<td>McMaster</td>
<td>5 mm Linear Motion Shaft</td>
<td>6112K37</td>
<td>1</td>
<td>$10.98 </td>
<td>$10.98 </td>
</tr>
<tr>
<td align="right">2</td>
<td>McMaster</td>
<td>Clear Impact-Resistant Polycarbonate Film</td>
<td>85585K15</td>
<td>1</td>
<td>$8.35 </td>
<td>$8.35 </td>
</tr>
<tr>
<td align="right">3</td>
<td>McMaster</td>
<td>Female Threaded Round Standoff</td>
<td>93330A541</td>
<td>10</td>
<td>$2.13 </td>
<td>$21.30 </td>
</tr>
<tr>
<td align="right">4</td>
<td>McMaster</td>
<td>Socket Head Screw M3 x 0.5 mm Thread, 6 mm Long</td>
<td>91290A111</td>
<td>1 (Pack of 100)</td>
<td>$10.91 </td>
<td>$10.91 </td>
</tr>
<tr>
<td align="right">5</td>
<td>Polulu</td>
<td>Aluminum Mounting Hub for 5mm Shaft</td>
<td>1203</td>
<td>1 (Pack of 2)</td>
<td>$18.90 </td>
<td>$18.90 </td>
</tr>
<tr>
<td align="right">6</td>
<td>Polulu</td>
<td>Machine Screw: #4-40, 1/2? Length, Phillips</td>
<td>1962</td>
<td>1 (Pack of 25)</td>
<td>$1.39 </td>
<td>$1.39 </td>
</tr>
<tr>
<td align="right">7</td>
<td>Thorlabs</td>
<td>0.75 Inch Post</td>
<td>TR075</td>
<td>1</td>
<td>$5.38 </td>
<td>$5.38 </td>
</tr>
<tr>
<td align="right">8</td>
<td>Thorlabs</td>
<td>2 Inch Post</td>
<td>TR2</td>
<td>2</td>
<td>$5.90 </td>
<td>$11.80 </td>
</tr>
<tr>
<td align="right">9</td>
<td>Thorlabs</td>
<td>3 Inch Post</td>
<td>TR3</td>
<td>2</td>
<td>$6.15 </td>
<td>$12.30 </td>
</tr>
<tr>
<td align="right">10</td>
<td>Thorlabs</td>
<td>4 Inch Post, 5 Pack</td>
<td>TR4-P5</td>
<td>1 (Pack of 5)</td>
<td>$30.00 </td>
<td>$30.00 </td>
</tr>
<tr>
<td align="right">11</td>
<td>Thorlabs</td>
<td>6 Inch Post</td>
<td>TR6</td>
<td>2</td>
<td>$8.09 </td>
<td>$16.18 </td>
</tr>
<tr>
<td align="right">12</td>
<td>Thorlabs</td>
<td>8 Inch Post</td>
<td>TR8</td>
<td>2</td>
<td>$9.69 </td>
<td>$19.38 </td>
</tr>
<tr>
<td align="right">13</td>
<td>Thorlabs</td>
<td>10 Inch Post</td>
<td>TR10</td>
<td>2</td>
<td>$10.76 </td>
<td>$21.52 </td>
</tr>
<tr>
<td align="right">14</td>
<td>Thorlabs</td>
<td>2 Inch Post Holder</td>
<td>PH2</td>
<td>1</td>
<td>$8.95 </td>
<td>$8.95 </td>
</tr>
<tr>
<td align="right">15</td>
<td>Thorlabs</td>
<td>3 Inch Post Holder</td>
<td>PH3</td>
<td>4</td>
<td>$9.62 </td>
<td>$38.48 </td>
</tr>
<tr>
<td align="right">16</td>
<td>Thorlabs</td>
<td>6 Inch Post Holder</td>
<td>PH6</td>
<td>1</td>
<td>$14.70 </td>
<td>$14.70 </td>
</tr>
<tr>
<td align="right">17</td>
<td>Thorlabs</td>
<td>Right Angle End Clamp</td>
<td>RA180</td>
<td>4</td>
<td>$12.34 </td>
<td>$49.36 </td>
</tr>
<tr>
<td align="right">18</td>
<td>Thorlabs</td>
<td>Rotating Clamp</td>
<td>SWC</td>
<td>1</td>
<td>$26.91 </td>
<td>$26.91 </td>
</tr>
<tr>
<td align="right">19</td>
<td>Thorlabs</td>
<td>Right Angle Post Clamp</td>
<td>RA90TR</td>
<td>1</td>
<td>$17.82 </td>
<td>$17.82 </td>
</tr>
<tr>
<td align="right">20</td>
<td>Thorlabs</td>
<td>Mini Optical Post</td>
<td>MS3R</td>
<td>1</td>
<td>$9.09 </td>
<td>$9.09 </td>
</tr>
<tr>
<td align="right">21</td>
<td>Thorlabs</td>
<td>Aluminum Breadboard 8&quot; x 10&quot; x 1/2&quot;, 1/4&quot;-20 Taps</td>
<td>MB810</td>
<td>1</td>
<td>$131.60 </td>
<td>$131.60 </td>
</tr>
<tr>
<td align="right">22</td>
<td>Thorlabs</td>
<td>Aluminum Breadboard 12&quot; x 18&quot; x 1/2&quot;, 1/4&quot;-20 Taps</td>
<td>MB1218</td>
<td>1</td>
<td>$214.65 </td>
<td>$214.65 </td>
</tr>
<tr>
<td align="right">23</td>
<td>Thorlabs</td>
<td>Breadboard Lifting Handles, Reinforced Polymer </td>
<td>BBH1</td>
<td>2 (Pack of 2)</td>
<td>$17.01 </td>
<td>$17.01 </td>
</tr>
<tr>
<td align="right">24</td>
<td>Thorlabs</td>
<td>4-40 Stainless Steel Cap Screw, 3/8&quot; Long</td>
<td>SH4S038</td>
<td>1 (Pack of 50)</td>
<td>$9.31 </td>
<td>$9.31 </td>
</tr>
<tr>
<td align="right">25</td>
<td>Thorlabs</td>
<td>Spring-Loaded 3/16&quot; Hex-Locking Thumbscrew, 1/4&quot;-20 Thread</td>
<td>TS25H</td>
<td>2</td>
<td>$2.87 </td>
<td>$5.74 </td>
</tr>
<tr>
<td align="right">26</td>
<td>Thorlabs</td>
<td>1/4&quot;-20 Stainless Steel Setscrew, 5/8&quot; Long (Adaptor)</td>
<td>SS25S0625</td>
<td>1 (Pack of 25)</td>
<td>$6.97 </td>
<td>$6.97 </td>
</tr>
<tr>
<td align="right">27</td>
<td>Thorlabs</td>
<td>1/4&quot; Washer, M6 Compatible, Stainless Steel</td>
<td>W25S050</td>
<td>1 (Pack of 100)</td>
<td>$10.20 </td>
<td>$10.20 </td>
</tr>
<tr>
<td align="right">28</td>
<td>Thorlabs</td>
<td>1/4&quot;-20 Stainless Steel Nut</td>
<td>N25S0440</td>
<td>1 (Pack of 50)</td>
<td>$6.43 </td>
<td>$6.43 </td>
</tr>
<tr>
<td align="right">29</td>
<td>SparkFun</td>
<td>Rotary Encoder - 1024 P/R (Quadrature)</td>
<td>E6B2-CWZ3E (E69-C06B)</td>
<td>1</td>
<td>$48.50 </td>
<td>$48.50 </td>
</tr>
<tr>
<td align="right">30</td>
<td>Digikey</td>
<td>Speaker 80hm 5 w top port 104db</td>
<td>2104-SP500208-3-ND</td>
<td>1</td>
<td>$6.79 </td>
<td>$6.79 </td>
</tr>
<tr>
<td align="right">31</td>
<td>Amazon</td>
<td>5 mm Steel Ball Bearing</td>
<td>B00GGQ1NVC / SMR115-ZZ #5 LD</td>
<td>2</td>
<td>$10.58 </td>
<td>$21.16 </td>
</tr>
<tr>
<td align="right">32</td>
<td>Amazon</td>
<td>S-mount lens with IR filter (Xenocam)</td>
<td>SPM16214000924</td>
<td>1</td>
<td>$19.99 </td>
<td>$19.99 </td>
</tr>
<tr>
<td align="right">33</td>
<td>Amazon</td>
<td>Mini-USB 2.0 Type A to Mini-B cable (VOTY )</td>
<td>B07NJW2ZPJ</td>
<td>1 (Pack of 2)</td>
<td>$8.95 </td>
<td>$8.95 </td>
</tr>
<tr>
<td align="right">34</td>
<td>Amazon</td>
<td>0.33-Inch Varifocal lens 2.8-12mm F1.3 Auto Iris (Computar)</td>
<td>B002HRE2ZS / TG4Z2813FCS-IR</td>
<td>1(Used)</td>
<td>$19.99 </td>
<td>$19.99 </td>
</tr>
<tr>
<td align="right">35</td>
<td>Amazon</td>
<td>3 mm UV light, 395-400nm (Chanzon)</td>
<td>100F3T-YT-WH-PU</td>
<td>1 (Pack of 100)</td>
<td>$6.99 </td>
<td>$6.99 </td>
</tr>
<tr>
<td align="right">36</td>
<td>Amazon</td>
<td>5 mm super-bright IR LED, 940nm (Adafruit)</td>
<td>ADA388 / B00ULB0U44</td>
<td>1 (Pack of 25)</td>
<td>$10.98 </td>
<td>$10.98 </td>
</tr>
<tr>
<td align="right">37</td>
<td>Amazon</td>
<td>24 AWG 50 feet Electrical Wire (Fermerry)</td>
<td>B089CX3FVV</td>
<td>1</td>
<td>$26.99 </td>
<td>$26.99 </td>
</tr>
<tr>
<td align="right">38</td>
<td>Amazon</td>
<td>Arduino Mega 2560 Rev3 Microcontroller Board (Arduino)</td>
<td>A000067 / B0046AMGW0</td>
<td>1</td>
<td>$48.99 </td>
<td>$48.99 </td>
</tr>
<tr>
<td align="right">39</td>
<td>Amazon</td>
<td>USB 2.0 Cable Type A/B (Arduino)</td>
<td>M000006 / B013EOQUAW</td>
<td>1</td>
<td>$7.00 </td>
<td>$7.00 </td>
</tr>
<tr>
<td align="right">40</td>
<td>Amazon</td>
<td>2.54mm Pitch Single Row Pin Header Strip (HiLetgo)</td>
<td>B07R5QDL8D</td>
<td>1</td>
<td>$5.49 </td>
<td>$5.49 </td>
</tr>
<tr>
<td align="right">41</td>
<td>Amazon</td>
<td>PCB Mount Screw Terminal Block Connectors (Tnisesm)</td>
<td>CATN-T03B</td>
<td>1</td>
<td>$8.99 </td>
<td>$8.99 </td>
</tr>
<tr>
<td align="right">42</td>
<td>Amazon</td>
<td>2N2222 NPN TO-92 Power Transistors (Ardest)</td>
<td>B07222XY81</td>
<td>1 (Pack of 100)</td>
<td>$10.99 </td>
<td>$10.99 </td>
</tr>
<tr>
<td align="right">43</td>
<td>Amazon</td>
<td>Real Time Clock Module DS3231 AT24C32 IIC (Adeept)</td>
<td>2pcsDS3231 / B097PMNMQZ</td>
<td>1 (Pack of 2)</td>
<td>$7.99 </td>
<td>$7.99 </td>
</tr>
<tr>
<td align="right">44</td>
<td>Amazon</td>
<td>3V Lithium Battery (Junpower)</td>
<td>CR2032 / B07LGL9LQ1</td>
<td>1 (Pack of 10)</td>
<td>$4.99 </td>
<td>$4.99 </td>
</tr>
<tr>
<td align="right">45</td>
<td>Amazon</td>
<td>Heat Shrink Tubing (Electfun)</td>
<td>ELECFUN / B08SQBPVJB</td>
<td>1</td>
<td>$14.99 </td>
<td>$14.99 </td>
</tr>
<tr>
<td align="right">46</td>
<td>Amazon</td>
<td>Black Adhesive contact paper (Yancorp)</td>
<td>B082CPSVPW</td>
<td>1</td>
<td>$6.98 </td>
<td>$6.98 </td>
</tr>
<tr>
<td align="right">47</td>
<td>Amazon</td>
<td>IPS Weld-On 3 Acrylic Plastic Cement (Weld-On)</td>
<td>?TLLPN-21847771</td>
<td>1</td>
<td>$28.55 </td>
<td>$28.55 </td>
</tr>
<tr>
<td align="right">48</td>
<td>Amazon</td>
<td>12V 5A DC Power Cable Male Female Connector (Centro Power)</td>
<td>B07C7VSRBG</td>
<td>1 (Pack of 10)</td>
<td>$9.19 </td>
<td>$9.19 </td>
</tr>
<tr>
<td align="right">49</td>
<td>Amazon</td>
<td>12V DC Power Connector Barrel Adaptor (Centro Power)</td>
<td>B07C61434H</td>
<td>1 (Pack of 10)</td>
<td>$7.99 </td>
<td>$7.99 </td>
</tr>
<tr>
<td align="right">50</td>
<td>Amazon</td>
<td>12V Red LED Flexible Strip Ribbon Light (Alitrove, 16.4 feet)</td>
<td>B07MXXDWDM</td>
<td>1</td>
<td>$13.99 </td>
<td>$13.99 </td>
</tr>
<tr>
<td align="right">51</td>
<td>Amazon</td>
<td>Power Strip Surge Protector 10Ft (Mifaso Power)</td>
<td>B0BTPB5Z4W</td>
<td>1</td>
<td>$19.99 </td>
<td>$19.99 </td>
</tr>
<tr>
<td align="right">52</td>
<td>Amazon</td>
<td>Anti Vibration Pads (Functional Necessities)</td>
<td>B08NWRFLDC</td>
<td>1 (Pack of 4)</td>
<td>$14.99 </td>
<td>$14.99 </td>
</tr>
<tr>
<td align="right">53</td>
<td>Amazon</td>
<td>1&quot; x 12&quot; x 12&quot; Sound Absorption Wall Panels (Xin &amp; Log)</td>
<td>B078VVJTXQ</td>
<td>1 (Pack of 24)</td>
<td>$17.99 </td>
<td>$17.99 </td>
</tr>
<tr>
<td align="right">54</td>
<td>Amazon</td>
<td>4 inch Zip Ties with 18 lb Tensile Strength</td>
<td>B0BC1VH4XB</td>
<td>1 (Pack of 200)</td>
<td>$3.99 </td>
<td>$3.99 </td>
</tr>
<tr>
<td align="right">55</td>
<td>Amazon</td>
<td>3M Scotch Super 33+ Electrical Tape - 3/4 in x 52 ft</td>
<td>B0000AZ9HG</td>
<td>1</td>
<td>$4.98 </td>
<td>$4.98 </td>
</tr>
<tr>
<td align="right">56</td>
<td>Custom Machined Parts</td>
<td>Rotary Encoder Adaptor (Aluminum 304)</td>
<td>CNC Machining (eMachineShop)</td>
<td>6 (Bulk Purchase)</td>
<td>$28.43 </td>
<td>$170.62 </td>
</tr>
<tr>
<td align="right">57</td>
<td>Custom Machined Parts</td>
<td>Head Plate Holder (Aluminum 304)</td>
<td>CNC Machining (eMachineShop)</td>
<td>12 (Bulk Purchase)</td>
<td>$30.20 </td>
<td>$362.44 </td>
</tr>
<tr>
<td align="right">58</td>
<td>Custom Machined Parts</td>
<td>Head Plate (Top Piece) (Aluminum 304)</td>
<td>CNC Machining (eMachineShop)</td>
<td>6 (Bulk Purchase)</td>
<td>$39.14 </td>
<td>$234.85 </td>
</tr>
<tr>
<td align="right">59</td>
<td>Custom Machined Parts</td>
<td>Head Plate (Bottom Piece) (Aluminum 304)</td>
<td>CNC Machining (eMachineShop)</td>
<td>6 (Bulk Purchase)</td>
<td>$51.01 </td>
<td>$306.04 </td>
</tr>
<tr>
<td align="right">60</td>
<td>Custom Machined Parts</td>
<td>Head rings (Aluminum 6061-T6)</td>
<td>CNC Machining (eMachineShop)</td>
<td>100 (Bulk Purchase)</td>
<td>$5.16 </td>
<td>$258.22 </td>
</tr>
<tr>
<td align="right">61</td>
<td>Custom Machined Parts</td>
<td>Rotary Wheel (1/8 Thick Clear Cast Acrylic)</td>
<td>Laser Cutting (Ponoko)</td>
<td>2</td>
<td>$61.06 </td>
<td>$61.06 </td>
</tr>
<tr>
<td align="right">62</td>
<td>Custom Machined Parts</td>
<td>Rotary Wheel Curved Surface (Clear Cast Acrylic)</td>
<td>Laser Cutting / Manual Cutting</td>
<td>1</td>
<td>$0.00 </td>
<td>$0.00 </td>
</tr>
<tr>
<td align="right">63</td>
<td>Custom Machined Parts</td>
<td>Rotary Wheel Curved Surface (Black Adhesive Contact Paper)</td>
<td>Laser Cutting / Manual Cutting</td>
<td>1</td>
<td>$0.00 </td>
<td>$0.00 </td>
</tr>
<tr>
<td align="right">64</td>
<td>Custom Machined Parts</td>
<td>Waste Management Ramp (Resin)</td>
<td>3-D Printing (Craftcloud3d)</td>
<td>1</td>
<td>$57.76 </td>
<td>$57.76 </td>
</tr>
<tr>
<td align="right">65</td>
<td>Custom Machined Parts</td>
<td>Arduino Mega 2560 Rev3 Protective Case (Resin)</td>
<td>3-D Printing (Craftcloud3d)</td>
<td>1</td>
<td>$16.06 </td>
<td>$16.06 </td>
</tr>
<tr>
<td align="right">66</td>
<td>Custom Machined Parts</td>
<td>Arduino Mega 2560 Rev3 Shield SMT PCB</td>
<td>PCB Manufacturing (JLC PCB)</td>
<td>1</td>
<td>X</td>
<td>X</td>
</tr>
<tr>
<td align="right">67</td>
<td>FLIR</td>
<td>Firefly S Camera</td>
<td>FFY-U3-16S2M-S</td>
<td>1</td>
<td>$234.00 </td>
<td>$234.00 </td>
</tr>
<tr>
<td align="right">68</td>
<td>FLIR</td>
<td>Tripod Adapter for Firefly S Camera</td>
<td>ACC-01-0017</td>
<td>1</td>
<td>$32.10 </td>
<td>$32.10 </td>
</tr>
<tr>
<td align="right">69</td>
<td>FLIR</td>
<td>USB 3.1 Locking Cable</td>
<td>ACC-01-2300</td>
<td>1</td>
<td>$24.60 </td>
<td>$24.60 </td>
</tr>
<tr>
<td align="right">70</td>
<td>FLIR</td>
<td>GPIO cable w/ 6 pins</td>
<td>ACC-01-3015</td>
<td>1</td>
<td>$9.60 </td>
<td>$9.60 </td>
</tr>
<tr>
<td align="right">71</td>
<td>The Imaging Source</td>
<td>USB 2.0 CMOS Monochrome Camera</td>
<td>DMK-22BUC03</td>
<td>1</td>
<td>$234.00 </td>
<td>$234.00 </td>
</tr>
<tr>
<td align="right">72</td>
<td>SYSRACKS</td>
<td>15U 35&quot; Depth Under Desk Sound Proof Server Cabinet</td>
<td>SP15.900</td>
<td>1</td>
<td>$1,122.00 </td>
<td>$1,122.00 </td>
</tr>
</tbody></table>


This [document](4-Pupillometry-Wheel-Custom-Parts-Table.pdf) outlines the design of each of the custom pieces and the filetypes found within this repository that can be used to replicate the system. More details regarding the specifications of the custom parts can be found [here](5-Pupillometry-Wheel-Custom-Parts-Specifications.pdf). The following [spreadsheet](3-Pupillometry-Wheel-Cost-Spreadsheet.xlsx) outlines the total cost of the system.  

**Here is a list of the manufacturers we purchased materials from:** 
- McMaster-Carr
- Pololu
- Thorlabs
- SparkFun
- Digikey
- Amazon
- FLIR
- The Imaging Source

**Here is a list of companies you can purchase custom parts from, if not fabricated in-house:**
- eMachineShop (CNC Machining)
- Ponoko (Laser Cutting)
- Craftcloud3d (3-D Printing)
- JBL PCB (PCB Printing / Soldering)

# Step-by-Step Building Guide

**A fully functioning system requires users to build the following elements from the materials purchased:**
- Rotary Wheel
- Head Plate System
- IR / UV LEDs

**Additionally, the following commercial materials need to modified to be used within our system:**
- Rotary Encoder
- GPIO Cable
- Overhead Speaker
- Ambiant Noise Fan
- Red LED Strips

This following guide provides a step-by-step walkthrough for building and modifying each of required components. This guide includes diagrams and explanations for assembling each of the final components of the build. 

![Labled Full Pupillometry Setup (Distributor Part Number) (Lossless Conversion)](https://github.com/jovantormesvaquerano/PeRo-Lab-Pupillometry-Wheel/assets/135740829/54193ec6-5679-49b8-b566-6202ed5a8fd6)

![Labled Full Pupillometry Setup (Internal Part Number) (Lossless conversion)](https://github.com/jovantormesvaquerano/PeRo-Lab-Pupillometry-Wheel/assets/135740829/2fa64411-3f92-41df-9d72-a3405e1b4e41)


# Software Installation Guide and Dependencies

Following this installation guide will ensure that your system will be able to run the set of MATLAB scripts and Arduino IDE sketches we have provided. Our system is run primarily on MATLAB's interface. While other software is used to first initialize componnets, such as Arduino IDE for the rotary encoder and Spinnaker SDK for the cameras, the subsequent input signals and data aquisition steps are performed exclusively with MATLAB. 

**Software Requirements**:
- MATLAB R2022a
- Arduino IDE
- Spinnaker SDK (Spinview GUI)
  
Our MATLAB scripts are based on MATLAB R2022a, a previous version of the software application. Running our scripts on a more recent version of the application will result in a number of errors. After downloading MATLAB R2022a, you will need to download a number of toolboxes and add-ons. 

**Base Toolboxes**:
- Data Acquisition Toolbox
- Image Acquisition Toolbox
- Image Processing Toolbox
- Statistics and Machine Learning Toolbox 

**Additional Toolbox Support Packages**:
- Data Acquisition Toolbox Support Package for National Instruments NI-DAQmx Devices
- Image Acquisition Toolbox Support Package for GenICam Interface
- Image Acquisition Toolbox Support Package OS Generic Video Interface
- Image Acquisition Toolbox Support Package for Pont Grey Hardware
- MATLAB Support Package for Arduino Hardware

Finally, users will need to download the following drivers to generate a connection between their computer system and an external hardware devices. In our case, we need to download two drivers to interface with the monochrome camera used in our system.

**Driver Requirements**:
- USB3 Driver
- DMK 22BUC03 Driver
