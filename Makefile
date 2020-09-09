#######################################
# Walter Sweetheart's Simple makefile #
#######################################

# Configuration
CC      := gcc#          compiler path
SRC_EXT := c#            file extension to compile          | NOTE: only one file extension allowed

SRC_DIR := ./src#        directory with sources             | NOTE: only one directory allowed
OBJ_DIR := ./obj#        temporate directory with obj files | NOTE: only one directory allowed

LDFLAGS :=
CFLAGS  :=

EXEC_NAME := main

RM    := rm -rf#          command to delete folder with files within
MKDIR := mkdir -p#       command to make a directory


# DONT TOUCH THAT IF YOU CANT UNDERSTAND WHAT ARE HAPPENING
rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))

SRC_FILES := $(call rwildcard,$(SRC_DIR),*.$(SRC_EXT))
OBJ_FILES := $(patsubst $(SRC_DIR)/%.$(SRC_EXT),$(OBJ_DIR)/%.o,$(SRC_FILES))

all: clean build

clean:
	$(RM) $(OBJ_DIR)/* $(EXEC_NAME)

build: $(OBJ_FILES)
	$(CC) $(LDFLAGS) -o $(EXEC_NAME) $^

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.$(SRC_EXT)
	$(MKDIR) $(@D)
	$(CC) $(CFLAGS) -c -o $@ $<
