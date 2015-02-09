#include <fcntl.h>
#include <stdio.h>
#include <errno.h>
#include <utils/Log.h>
#include <cutils/properties.h>

int get_chargemode() {
    char buffer[1024];
    int len;
    int fd = open("/proc/app_info",O_RDONLY);
    int flag = 0;

    if (fd < 0)
        ALOGV("could not open /proc/app_info:%s", strerror(errno));
    do 
		len = read(fd,buffer,sizeof(buffer));
    while
		(len == -1 && errno == EINTR);

    if (len < 0) {
        ALOGV("could not read /proc/app_info:%s", strerror(errno));
        close(fd);
    }
    close(fd);
	char * charge;
	charge = strstr(buffer, "charge_flag");

	if((int)charge[13] == 49){	
		ALOGV("Charge Flag: %c", charge[13]);
		flag = 1;
    }

	return flag;
}

int main(void){
    int flag;
    	flag = get_chargemode();
	if (flag) {
	property_set("ctl.stop", "recovery");
	property_set("ctl.start", "charger");
	} else {
	sleep(3);
        property_set("ctl.start", "recovery");
	}

	return 0;
}
