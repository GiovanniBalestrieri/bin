#ifndef HLSERIAL_H
#define HLSERIAL_H

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

#define SYNC_SEQ 1
#define RAW_SEQ 0

#define DEF_SYNC_SIZE 4
#define DEF_SYNC_BYTE -86

#define BLK_READ 1
#define NBLK_READ 0

class Serial
{
	private:
		int mode;
		int blktimeo;
		char * sync_seq;
		int sync_size;
		int use_sync;
		int connected;
		int serialfileno;
		speed_t intToBaud(int);
		int read_buffer(char **);
		int partial_read_buffer(char *, size_t);
		char compute_checksum(char * , int);
	public:
		Serial();
		~Serial();
		int flush_io();
		int connect(char *, int, int, int);
		int disconnect();
		int serial_read(char **, int);
		int serial_write(char *, size_t);
		int is_connected();
		int set_sync_sequence(char *, int);
		void set_polling_t(int);
		void set_nonblocking();
};

#endif

