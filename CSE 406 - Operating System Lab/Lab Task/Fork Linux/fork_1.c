#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
 printf("hello world (pid:%d)\n", (int) getpid());
 int rc = fork();
 if (rc < 0) { //fork fails
   fprintf(stderr, "fork failed\n");
 } else if (rc == 0) { //new process (children)
   printf("hello, I am child (pid:%d)\n", (int) getpid());
 } else {  // parent(the main process)
   printf("hello, I am parent of %d (pid:%d)\n", rc, (int) getpid());
 }
 return 0;
}

