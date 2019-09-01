# fpga_pipeline: fpga_pipeline.c
# 	gcc -o fpga_pipeline fpga_pipeline.c -I.

#
TARGET = fpga_pipeline

#
CFLAGS = -g -Wall
LDFLAGS = -g -Wall
CC = gcc

build: $(TARGET)

$(TARGET): $(TARGET).o PCIE.o
	$(CC) $(LDFLAGS) $^ -o $@ -ldl

%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o : %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: clean
clean:
	rm -f $(TARGET) *.a *.o *~