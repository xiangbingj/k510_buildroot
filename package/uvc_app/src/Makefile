CROSS_COMPILE := riscv64-linux-

CC	:= $(CROSS_COMPILE)gcc
C++	:= $(CROSS_COMPILE)g++
OBJDUMP	:= $(CROSS_COMPILE)objdump
OBJCOPY := $(CROSS_COMPILE)objcopy
AR	:= $(CROSS_COMPILE)ar
AS	:= $(CROSS_COMPILE)as
LD	:= $(CROSS_COMPILE)ld

C_SRC = $(wildcard *.c)
C_SRC += $(wildcard common/*.c)
C_OBJ = $(patsubst %.c, %.o, $(C_SRC))
CPP_SRC = $(wildcard *.cpp)
CPP_OBJ = $(patsubst %cpp, %o, $(CPP_SRC))

CFLAGS = $(CFLAG)
LDFLAGS = $(LDFLAG)
$(info "======="$(LDFLAGS) )
TARGET = uvc_app

all: $(TARGET)

$(TARGET): $(CPP_OBJ) $(C_OBJ)
	$(C++) $^ -o $@ $(LDFLAGS)

%.o:%.cpp
	$(CC) -c $< -o $@ $(CFLAGS)
%.o:%.c
	$(C++) -c $< -o $@ $(CFLAGS)

clean:
	@rm -f $(C_OBJ) $(CPP_OBJ)
	@echo "Clean object files done."

	@rm -f *~
	@echo "Clean tempreator files done."

	@rm -f $(TARGET)
	@echo "Clean target files done."

	@echo "Clean done."

