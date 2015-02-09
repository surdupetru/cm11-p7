#include <fcntl.h>
#include <stdio.h>
#include <errno.h>
#include <utils/Log.h>

int check_usb_connection() {

   char cap[4];

   FILE *fptr;

   fptr = fopen("/sys/devices/platform/bq_bci_battery.1/power_supply/Battery/status", "rt");

	if (fptr) {
		fgets(cap, 2, fptr);		
   		fclose(fptr);
			if (cap[0] == 'C') 
				return 1;
			else
				return 0;
		}
    return -1;
}

int battery_level() {

   int val;

   FILE *fptr;

   fptr = fopen("/sys/devices/platform/bq_bci_battery.1/power_supply/Battery/capacity", "rt");

	if (fptr) {
                fscanf(fptr, "%d", &val);
   		fclose(fptr);

		if (val >= 90) 
			return 1;
		else
			return 0;
		}
   return -1;
}

void set_leds(int green, int red) {

   FILE *fptr1;
   FILE *fptr2;

   fptr1 = fopen("/sys/class/leds/green/brightness", "wr");

   if (fptr1 == NULL) {
        ALOGV("could not read /sys/class/leds/green/brightness:%s", strerror(errno));
   exit(1);
   }

   fprintf(fptr1, "%d", green);
   fclose(fptr1);

   fptr2 = fopen("/sys/class/leds/red/brightness", "wr");

   if (fptr2 == NULL) {
        ALOGV("could not read /sys/class/leds/red/brightness:%s", strerror(errno));
   exit(1);
   }

   fprintf(fptr2, "%d", red);
   fclose(fptr2);

}

int main(void){

        if (check_usb_connection()) {

		if (battery_level())
		      set_leds(255, 0);
		else
		      set_leds(255, 255);

        }
	else {
        set_leds(0, 0);
	}
	return 0;
}
