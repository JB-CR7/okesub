#include <stdio.h>
#include <stdlib.h>

void heapify(int a[], int n, int i) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < n && a[left] > a[largest]) {
        largest = left;
    }
    if (right < n && a[right] > a[largest]) {
        largest = right;
    }
    if (largest != i) {
        int temp = a[i];
        a[i] = a[largest];
        a[largest] = temp;
        heapify(a, n, largest);
    }
}

void HEAPSORT(int a[], int n) {
    for (int i = n / 2 - 1; i >= 0; i--) {
        heapify(a, n, i);
    }
    for (int i = n - 1; i >= 0; i--) {
        int temp = a[0];
        a[0] = a[i];
        a[i] = temp;
        heapify(a, i, 0);
    }
}

void printArr(int arr[], int n) {
    for (int i = 0; i < n; ++i) {
        printf("%4d", arr[i]);
    }
    printf("\n");
}

int main() {
    int a[20];
    int m, i;

    printf("Enter the number of elements: ");
    scanf("%d", &m);
    printf("Enter elements: ");
    for (i = 0; i < m; i++) {
        scanf("%d", &a[i]);
    }

    printf("\nBefore sorting: ");
    printArr(a, m);
    HEAPSORT(a, m);
    printf("After sorting: ");
    printArr(a, m);

    return 0;
}
