// Take substring of some variable string and give it to another function?
// Concatenate two strings and branch on value of the string given that it 
//   matches some other string (both variable and fixed)

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <klee/klee.h>

#define SIZE 256

char* string_concat(char* front, char* back) {

	if (!front || !back) {
		printf("error! please provide valid inputs. \n");
		return NULL;
	}

	int front_count = strlen(front);
	int back_count = strlen(back);

	char* return_val;
	return_val = malloc(front_count + back_count + 1);
	char* combined = strcat(front, back);
	strcpy(return_val, combined);
	return return_val;

}

int find_needle_in_haystack(char *hay1, char* hay2, char* needle) {
	char* haystack = strcat(hay1, hay2);
	if (strcmp(needle, haystack) == 0) {
		return 1;
	}
	return 0;
}

int main() {
	// char hay1[] = "car";
	// char hay2[] = "car";
	// char needle[] = "car";
	char hay1[SIZE];
	char hay2[SIZE];
	char needle[SIZE];
	klee_make_symbolic(hay1, SIZE, "hay1");
	klee_make_symbolic(hay2, SIZE, "hay2");
	klee_make_symbolic(needle, SIZE, "needle");
	return find_needle_in_haystack(hay1, hay2, needle);
}