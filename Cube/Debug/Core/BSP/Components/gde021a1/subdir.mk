################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/BSP/Components/gde021a1/font12epd.c \
../Core/BSP/Components/gde021a1/font16epd.c \
../Core/BSP/Components/gde021a1/font20epd.c \
../Core/BSP/Components/gde021a1/font8epd.c \
../Core/BSP/Components/gde021a1/gde021a1.c \
../Core/BSP/Components/gde021a1/stm32l0538_discovery.c \
../Core/BSP/Components/gde021a1/stm32l0538_discovery_epd.c 

OBJS += \
./Core/BSP/Components/gde021a1/font12epd.o \
./Core/BSP/Components/gde021a1/font16epd.o \
./Core/BSP/Components/gde021a1/font20epd.o \
./Core/BSP/Components/gde021a1/font8epd.o \
./Core/BSP/Components/gde021a1/gde021a1.o \
./Core/BSP/Components/gde021a1/stm32l0538_discovery.o \
./Core/BSP/Components/gde021a1/stm32l0538_discovery_epd.o 

C_DEPS += \
./Core/BSP/Components/gde021a1/font12epd.d \
./Core/BSP/Components/gde021a1/font16epd.d \
./Core/BSP/Components/gde021a1/font20epd.d \
./Core/BSP/Components/gde021a1/font8epd.d \
./Core/BSP/Components/gde021a1/gde021a1.d \
./Core/BSP/Components/gde021a1/stm32l0538_discovery.d \
./Core/BSP/Components/gde021a1/stm32l0538_discovery_epd.d 


# Each subdirectory must supply rules for building sources it contributes
Core/BSP/Components/gde021a1/%.o Core/BSP/Components/gde021a1/%.su Core/BSP/Components/gde021a1/%.cyclo: ../Core/BSP/Components/gde021a1/%.c Core/BSP/Components/gde021a1/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m0plus -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L053xx -c -I../Core/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc -I../Drivers/STM32L0xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L0xx/Include -I../Drivers/CMSIS/Include -I../Core/BSP/Components/gde021a1 -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-BSP-2f-Components-2f-gde021a1

clean-Core-2f-BSP-2f-Components-2f-gde021a1:
	-$(RM) ./Core/BSP/Components/gde021a1/font12epd.cyclo ./Core/BSP/Components/gde021a1/font12epd.d ./Core/BSP/Components/gde021a1/font12epd.o ./Core/BSP/Components/gde021a1/font12epd.su ./Core/BSP/Components/gde021a1/font16epd.cyclo ./Core/BSP/Components/gde021a1/font16epd.d ./Core/BSP/Components/gde021a1/font16epd.o ./Core/BSP/Components/gde021a1/font16epd.su ./Core/BSP/Components/gde021a1/font20epd.cyclo ./Core/BSP/Components/gde021a1/font20epd.d ./Core/BSP/Components/gde021a1/font20epd.o ./Core/BSP/Components/gde021a1/font20epd.su ./Core/BSP/Components/gde021a1/font8epd.cyclo ./Core/BSP/Components/gde021a1/font8epd.d ./Core/BSP/Components/gde021a1/font8epd.o ./Core/BSP/Components/gde021a1/font8epd.su ./Core/BSP/Components/gde021a1/gde021a1.cyclo ./Core/BSP/Components/gde021a1/gde021a1.d ./Core/BSP/Components/gde021a1/gde021a1.o ./Core/BSP/Components/gde021a1/gde021a1.su ./Core/BSP/Components/gde021a1/stm32l0538_discovery.cyclo ./Core/BSP/Components/gde021a1/stm32l0538_discovery.d ./Core/BSP/Components/gde021a1/stm32l0538_discovery.o ./Core/BSP/Components/gde021a1/stm32l0538_discovery.su ./Core/BSP/Components/gde021a1/stm32l0538_discovery_epd.cyclo ./Core/BSP/Components/gde021a1/stm32l0538_discovery_epd.d ./Core/BSP/Components/gde021a1/stm32l0538_discovery_epd.o ./Core/BSP/Components/gde021a1/stm32l0538_discovery_epd.su

.PHONY: clean-Core-2f-BSP-2f-Components-2f-gde021a1

