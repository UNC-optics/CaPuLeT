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
