#include <klee/klee.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

int branching_function(int session, int total) {
	
	char *role;
	if (session < 3) {
		if (session == 0)
			role = "visitor";
		
		else {
			role = "new";
		}
	}
	else {
		if (session == 9) 
			role = "admin";
		else
			role = "1";
	}

	if (total > 2) {
		char* substr = malloc(sizeof(char));
		strncpy(substr, role, 1);
		if (strcmp(substr, "n") == 0) {
			return 1;
		}
		else
			return 0;
	}

	return -1;

}

int main () {
	int session, total;
	klee_make_symbolic(&session, sizeof(int), "session");
	klee_make_symbolic(&total, sizeof(int), "total");
	int ret = branching_function(session, total);
	return ret;
}

