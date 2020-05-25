#include <sys/time.h>
#include <sys/resource.h>

int get_resource_usage (struct rusage * r);
double timeval_to_ms(struct timeval * tv);
double timespec_to_ms(struct timespec * ts);
