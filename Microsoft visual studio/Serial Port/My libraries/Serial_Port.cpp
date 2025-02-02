
 
#define WIN32_LEAN_AND_MEAN
#include <windows.h>  // WYMAGANE dla CreateFile, DWORD, INVALID_HANDLE_VALUE
#include <iostream>
#include <string>
#include "pch.h"
#include "Serial_Port.h"



HANDLE hSerial_moj; 
using namespace System;
using namespace System::Windows::Forms;
using namespace System::Threading;

SerialPort::SerialPort() {
    hSerial_moj = INVALID_HANDLE_VALUE;  // Inicjalizacja uchwytu portu szeregowego
}
SerialPort::~SerialPort() {
    if (hSerial_moj != INVALID_HANDLE_VALUE) {
        CloseHandle(hSerial_moj);  // Zamykanie portu szeregowego
    }
}
bool SerialPort::OpenSerialPort(const wchar_t* portName)
{
        hSerial_moj = CreateFile(portName,
        GENERIC_READ | GENERIC_WRITE,
        0, // Brak dzielenia dostêpu
        NULL, // Brak zabezpieczeñ
        OPEN_EXISTING,  // Otwórz istniej¹cy port
        0,  // Brak flagi (tryb blokuj¹cy)
        NULL);

    if (hSerial_moj == INVALID_HANDLE_VALUE) {
        DWORD error = GetLastError();  // Sprawdzenie b³êdu
        
        flag = true;
        return false;  // Port nie zosta³ otwarty
    }
    flag = true;
    return true;  // Port otwarty pomyœlnie

}
void SerialPort::CloseSerialPort()
{
    if (hSerial_moj != INVALID_HANDLE_VALUE) 
        {
            CloseHandle(hSerial_moj);
            hSerial_moj = INVALID_HANDLE_VALUE;
        }
  
}
bool SerialPort::SetupSerialPort() {
    if (!SetupComm(hSerial_moj, 2 * 4096, 2 * 4096)) {
        std::cerr << "Error with setting bufor size" << std::endl;
        return false;
    }

    DCB dcbSerialParams = { 0 };
    dcbSerialParams.DCBlength = sizeof(dcbSerialParams);

    if (!GetCommState(hSerial_moj, &dcbSerialParams)) {
        std::cerr << "Error with getting port status!" << std::endl;
        return false;
    }

    dcbSerialParams.BaudRate = CBR_115200;
    dcbSerialParams.ByteSize = 8;
    dcbSerialParams.StopBits = ONESTOPBIT;
    dcbSerialParams.Parity = NOPARITY;

    if (!SetCommState(hSerial_moj, &dcbSerialParams)) {
        std::cerr << "Error setting parameters of port" << std::endl;
        return false;
    }

    COMMTIMEOUTS timeouts = { 0 };
    timeouts.ReadIntervalTimeout = 100;
    timeouts.ReadTotalTimeoutConstant = 100;
    timeouts.ReadTotalTimeoutMultiplier = 200;
    timeouts.WriteTotalTimeoutConstant = 50;  // Maksymalnie 50 ms na zapis
    timeouts.WriteTotalTimeoutMultiplier = 5;  // 5 ms na ka¿dy bajt

    if (!SetCommTimeouts(hSerial_moj, &timeouts)) {
        std::cerr << "Error with setting timeouts" << std::endl;
        return false;
    }

    return true;
}
System::String^ SerialPort::ReadSerialPort()
{
    char buffer_moj[2 * 4096];
    DWORD bytesRead = 0;
    std::string result = "";

    if (hSerial_moj == INVALID_HANDLE_VALUE) {
        return "Port wasn't open!\n";
    }

    // Odczyt danych
    BOOL success = ReadFile(hSerial_moj, buffer_moj, sizeof(buffer_moj), &bytesRead, NULL);

    if (success && bytesRead > 0) {
        buffer_moj[bytesRead] = '\0';  // Dodanie null-terminatora
        result = buffer_moj;
    }
    else {
        DWORD error = GetLastError();
        if (error == ERROR_IO_PENDING) {
            return "Receiving...\n";
        }
        else {
            return System::String::Format("Error receving data: {0}\n", error);
        }
    }

    // Zwróæ konwertowane dane jako System::String^
    return ConvertToSystemString(result);
}
System::String^ SerialPort::ConvertToSystemString(const std::string& str)
{
    return gcnew System::String(str.c_str());  // Konwersja std::string na System::String^
}
void SerialPort::SendSerialDataInBackground(uint8_t tab[], int logoSize)
{
    DWORD bytesWritten = 0; // Liczba wys³anych bajtów
    OVERLAPPED ol = { 0 }; // Struktura OVERLAPPED dla operacji asynchronicznych
    ol.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL); // Tworzymy zdarzenie do monitorowania operacji

    if (ol.hEvent == NULL) {
        Text = "Error creating event!";
        return;
    }

    // Przesy³anie danych przez port szeregowy
    if (WriteFile(hSerial_moj, tab, logoSize, &bytesWritten, &ol)) {
        Text = "Data have sent..";
    }
    else {
        if (GetLastError() == ERROR_IO_PENDING) {
            // Jeœli operacja jest w toku (asynchroniczna)
            DWORD dwRes = WaitForSingleObject(ol.hEvent, INFINITE); // Czekamy na zakoñczenie operacji
            if (dwRes == WAIT_OBJECT_0) {
                // Operacja zakoñczona
                DWORD bytesTransferred = 0;
                if (GetOverlappedResult(hSerial_moj, &ol, &bytesTransferred, FALSE)) {
                    Text = "Data are sending.";
                }
                else {
                    Text = "Error during receving data";;
                }
            }
            else {
                Text = "Eror expectation for data!";
            }
        }
        else {
            Text = "Error sending data!";
        }
    }

    // Czyszczenie zasobów
    CloseHandle(ol.hEvent); // Zamykanie uchwytu do zdarzenia
}


