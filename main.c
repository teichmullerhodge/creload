#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <curl/curl.h>




void print_timestamp(const char *filepath) {
    struct stat attributes;
    stat(filepath, &attributes);
    printf("Last modified time: %s\n", ctime(&attributes.st_ctime));
}

/// verificar como printar o timestamp de um arquivo.

int main(int argc, char **argv) {

    // const char path[] = "info.txt";
    // print_timestamp(path);
    // return 0;
    printf("Hello world are you me\n");
    
}