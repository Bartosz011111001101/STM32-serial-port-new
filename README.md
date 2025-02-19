STM32 Serial Port GUI
This project is a graphical user interface (GUI) for communicating with an STM32 microcontroller via a serial port. It extends the functionality of STM32-Serial-Port.

The GUI is developed in C++ using Microsoft Visual Studio.

![serial port zmniejsozny](https://github.com/user-attachments/assets/15528062-86e1-4828-8320-7d1b7a8b3489)

Features

📡 Serial Port Communication – Connects and communicates with STM32 via UART.

🖼 Image Transfer – Sends images to STM32 for display on an ePaper screen.

🖥 Data Visualization – Displays received data, including raw bitmaps from STM32.

🎛 User Controls:
Send Image 1 – Sends the "Cat" image.


![kot zmiejszony](https://github.com/user-attachments/assets/17e704ff-2cc8-4da4-89e9-630a8ccda609)

Send Image 2 – Sends the "Testowy Test" image.

![testowy test zmniejszony](https://github.com/user-attachments/assets/1b2e4ac9-b96e-430d-b055-8690247ff4b8)

Receive – Retrieves and displays the current raw bitmap.

![Receiving data](https://github.com/user-attachments/assets/09c4d509-562d-40d3-a06b-2aa53665942c)


Connect – Opens and connects to the serial port.

![serial port zmniejsozny](https://github.com/user-attachments/assets/4ba19510-5d90-490f-a901-21921af8a307)


Disconnect – Closes the serial port.

![Serial port disconnected zmniejszony](https://github.com/user-attachments/assets/5469bc22-6a36-4218-9618-9694cf3b64f0)

Microcontroller Setup

![setup zmniejszony](https://github.com/user-attachments/assets/cb584a66-0ad6-4a84-8ce5-2ffc63cce829)

The STM32 firmware supports communication via UART and updates the OLED display based on the current operation (sending/receiving data).


Technologies Used:
-  C++, C
-  Microsoft Visual Studio
- STM32 HAL Library
- I2C for OLED display
- SPI for epaper 
- Serial Communication (UART)

