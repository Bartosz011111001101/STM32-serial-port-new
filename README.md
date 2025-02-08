STM32 Serial Port GUI
This project is a graphical user interface (GUI) for communicating with an STM32 microcontroller via a serial port. It extends the functionality of STM32-Serial-Port.

The GUI is developed in C++ using Microsoft Visual Studio.

Features
📡 Serial Port Communication – Connects and communicates with STM32 via UART.
🖼 Image Transfer – Sends images to STM32 for display on an ePaper screen.
🖥 Data Visualization – Displays received data, including raw bitmaps from STM32.
🎛 User Controls:
Send Image 1 – Sends the "Cat" image.
Send Image 2 – Sends the "Testowy Test" image.
Receive – Retrieves and displays the current raw bitmap.
Connect – Opens and connects to the serial port.
Disconnect – Closes the serial port.
Microcontroller Setup
The STM32 firmware supports communication via UART and updates the OLED display based on the current operation (sending/receiving data).

Technologies Used
C++
Microsoft Visual Studio
STM32 HAL Library
Serial Communication (UART)
