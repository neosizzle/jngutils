# Initializes a barebones kernel module

read -e -p "C project path: " PROJECT_PATH

[ ! -d "$PROJECT_PATH" ] && mkdir -pv $PROJECT_PATH

cat  << "EOF" > "$PROJECT_PATH/Makefile"
obj-m += hello-1.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
EOF

cat  << "EOF" > "$PROJECT_PATH/main.c"
/*  
 * hello-1.c - The simplest kernel module.
 */
#include <linux/module.h>	/* Needed by all modules */
#include <linux/kernel.h>	/* Needed for KERN_INFO */

MODULE_AUTHOR("jng");
MODULE_LICENSE("GPL");

int init_module(void)
{
	printk(KERN_INFO "Hello world !\n");

	/* 
	 * A non 0 return means init_module failed; module can't be loaded. 
	 */
	return 0;
}

void cleanup_module(void)
{
	printk(KERN_INFO "Cleaning up module.\n");
}
EOF