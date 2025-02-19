################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/SSD1306/ssd1306.c \
../Core/SSD1306/ssd1306_fonts.c \
../Core/SSD1306/ssd1306_tests.c 

OBJS += \
./Core/SSD1306/ssd1306.o \
./Core/SSD1306/ssd1306_fonts.o \
./Core/SSD1306/ssd1306_tests.o 

C_DEPS += \
./Core/SSD1306/ssd1306.d \
./Core/SSD1306/ssd1306_fonts.d \
./Core/SSD1306/ssd1306_tests.d 


# Each subdirectory must supply rules for building sources it contributes
Core/SSD1306/%.o Core/SSD1306/%.su Core/SSD1306/%.cyclo: ../Core/SSD1306/%.c Core/SSD1306/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L053xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../Core/BSP/Components/gde021a1 -I../Debug/Core/SSD1306 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-SSD1306

clean-Core-2f-SSD1306:
	-$(RM) ./Core/SSD1306/ssd1306.cyclo ./Core/SSD1306/ssd1306.d ./Core/SSD1306/ssd1306.o ./Core/SSD1306/ssd1306.su ./Core/SSD1306/ssd1306_fonts.cyclo ./Core/SSD1306/ssd1306_fonts.d ./Core/SSD1306/ssd1306_fonts.o ./Core/SSD1306/ssd1306_fonts.su ./Core/SSD1306/ssd1306_tests.cyclo ./Core/SSD1306/ssd1306_tests.d ./Core/SSD1306/ssd1306_tests.o ./Core/SSD1306/ssd1306_tests.su

.PHONY: clean-Core-2f-SSD1306

