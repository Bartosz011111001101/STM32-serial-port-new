#ifndef SERIALPORT_H
#define SERIALPORT_H
#pragma once
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <iostream>
#include <string>


using namespace System;
using namespace System::Windows::Forms;
using namespace System::Threading; 

class SerialPort{
public:
    SerialPort();  // Konstruktor
    ~SerialPort(); // Destruktor

   // bool OpenSerialPort_moj(const wchar_t* portName_moj);
    bool OpenSerialPort(const wchar_t* portName_moj);
    void CloseSerialPort();
    bool SetupSerialPort();
    System::String^ ReadSerialPort();
    System::String^ ConvertToSystemString(const std::string& str);
    void SendSerialDataInBackground(uint8_t tab[], int logoSize);
    std::string Text;
    bool flag;

private:
HANDLE hSerial; // Uchwyt do portu szeregowego

};

#endif // SERIALPORT_H