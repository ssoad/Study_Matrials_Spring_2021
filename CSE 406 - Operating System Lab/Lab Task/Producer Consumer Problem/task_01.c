#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>
#include<sys/wait.h>
#include<semaphore.h>

sem_t m;

int main() {
    int n = 50;
    int i;
    FILE *file;
    file = fopen("test.txt","w");
    int c = fork();
    int d = fork();
    printf("Fork created\n");
    sem_init(&m,0,1);
    sem_wait(&m);
    for(i=0; i<n; i++)
       printf(file, "I am process %d and my p_id is %d\n",c,getpid());
    sem_post(&m);
return 0;
}