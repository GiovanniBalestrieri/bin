#ifndef CSERIAL_H
#define CSERIAL_H

#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>

#define READ_ALL -1
#define STDBUFFSIZE 255
#define PACKETSIZE 56

class cserial
{
	private:
		int connected;
		int serialfileno;
		speed_t intToBaud(int);
		int read_buffer(char *);
		int partial_read_buffer(char *, size_t);
		char compute_checksum(char * , int);
	public:
		cserial();
		~cserial();
		int connect(char *, int);
		int disconnect();
		int serial_read(char *, size_t);
		int serial_write(char *, int, size_t);
		int is_connected();
};

#endif

