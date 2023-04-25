#include <iostream>
#include <vector>

using namespace std;

void radix_sort(vector<int> &arr) {
    int max_digit = 0;

    // Find the maximum number of digits in the input array
    for (int i = 0; i < arr.size(); i++) {
        int num_digits = 0;
        int n = arr[i];
        while (n != 0) {
            num_digits++;
            n /= 10;
        }
        if (num_digits > max_digit) {
            max_digit = num_digits;
        }
    }

    // Perform counting sort for each digit from least significant to most significant
    for (int digit = 1; digit <= max_digit; digit++) {
        vector<int> count(10, 0);

        // Count the frequency of each digit in the current column
        for (int i = 0; i < arr.size(); i++) {
            int n = arr[i];
            for (int j = 0; j < digit - 1; j++) {
                n /= 10;
            }
            count[n % 10]++;
        }

        // Calculate the cumulative sum of the count array
        for (int i = 1; i < count.size(); i++) {
            count[i] += count[i - 1];
        }

        // Construct the sorted array
        vector<int> sorted(arr.size());
        for (int i = arr.size() - 1; i >= 0; i--) {
            int n = arr[i];
            for (int j = 0; j < digit - 1; j++) {
                n /= 10;
            }
            sorted[count[n % 10] - 1] = arr[i];
            count[n % 10]--;
        }

        // Copy the sorted array back to the input array
        for (int i = 0; i < arr.size(); i++) {
            arr[i] = sorted[i];
        }
    }
}

int main() {
    vector<int> arr = {170, 45, 75, 90, 802, 24, 2, 66};
    cout << "Input Array: ";
    for (int i = 0; i < arr.size(); i++) {
        cout << arr[i] << " ";
    }
    cout << endl;

    radix_sort(arr);

    cout << "Sorted Array: ";
    for (int i = 0; i < arr.size(); i++) {
        cout << arr[i] << " ";
    }
    cout << endl;

    return 0;
}
