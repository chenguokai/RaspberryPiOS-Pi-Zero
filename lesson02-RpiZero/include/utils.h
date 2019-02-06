#ifndef	_BOOT_H
#define	_BOOT_H

extern void delay ( unsigned long);
extern void put32 ( unsigned long, unsigned int );
extern unsigned int get32 ( unsigned long );
extern int get_el ( void );

extern unsigned int __aeabi_uidivmod (unsigned int num, unsigned int modn);
extern unsigned int __aeabi_uidiv (unsigned int, unsigned int);

#endif  /*_BOOT_H */
