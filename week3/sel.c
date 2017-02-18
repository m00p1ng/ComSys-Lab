#include <stdio.h>

int main() {
    int n; scanf("%d", &n);

    int arr[20];
    for(int i = 0; i < n; i++) scanf("%d", &arr[i]);

    for(int i = 0; i < n-1; i++) {
        int idx = -1;
        for(int j = i+1; j < n; j++) {
            if(arr[j] < arr[i]) {
                idx = j;
            }
        }
        if(idx != -1) {
            int temp = arr[idx];
            arr[idx] = arr[i];
            arr[i] = temp;
        }
    }

    for(int i = 0; i < n; i++) printf("%d\n", arr[i]);
}
