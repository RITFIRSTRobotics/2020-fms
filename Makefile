# 2020-fms Makefile
#
# @author Connor Henley, @thatging3rkid
OUT_DIR=bin
OBJ_DIR=obj
TEST_OBJ_DIR=test/obj

CC=gcc
CFLAGS=-Wall -Wextra -std=c11 -pthread -lm -I.
TESTFLAGS=-g $(CFLAGS)

all: $(OUT_DIR)/fms

$(OUT_DIR)/fms: $(OBJ_DIR)/fms.o $(OBJ_DIR)/net_lowlevel.o
	@mkdir -p $(OUT_DIR)
	$(CC) $(CFLAGS) -o $@ $<

$(OBJ_DIR)/fms.o: src/fms.c
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJ_DIR)/net_lowlevel.o: src/network/lowlevel.c src/network/lowlevel.h
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

### Testing recipes

### CI recipes

ci-build: $(OUT_DIR)/fms
ci-test:  ; # empty

## Maintence recipes

clean:
	-/bin/rm -rf $(OUT_DIR)
	-/bin/rm -rf $(OBJ_DIR)
