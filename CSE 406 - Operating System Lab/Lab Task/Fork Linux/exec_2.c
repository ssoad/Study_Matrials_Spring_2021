#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <sys/wait.h>

int main(int argc, char *argv[]) {
 printf("hello world (pid:%d)\n", (int) getpid());
 int rc = fork();
 if (rc < 0) {
   fprintf(stderr, "fork failed\n");
   exit(1);
 } else if (rc == 0) {
   close(STDOUT_FILENO); //close standard output
   open("./p4.output", O_CREAT | O_WRONLY | O_TRUNC, S_IRWXU); // open a file for showing output
   char *myargs[3];
   myargs[0] = strdup("wc");
   myargs[1] = strdup("p4.c");
   myargs[2] = NULL;
   execvp(myargs[0], myargs);
 } else {
   int wc = wait(NULL);
 }
 return 0;
}

