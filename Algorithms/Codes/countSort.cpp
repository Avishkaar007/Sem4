#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void countingSort(vector<int> &arr) {
    int n = arr.size();

    // Find the maximum value in the input array
    int maxVal = *max_element(arr.begin(), arr.end());

    // Create a count array of size maxVal+1 and initialize it to 0
    vector<int> count(maxVal + 1, 0);

    // Count the number of occurrences of each element in the input array
    for (int i = 0; i < n; i++) {
        count[arr[i]]++;
    }

    // Calculate the cumulative sum of the count array
    for (int i = 1; i <= maxVal; i++) {
        count[i] += count[i-1];
    }

    // Create a temporary output array
    vector<int> output(n);

    // Place each element in the input array in the correct position in the output array
    for (int i = n-1; i >= 0; i--) {
        output[count[arr[i]]-1] = arr[i];
        count[arr[i]]--;
    }

    // Copy the sorted output array back to the input array
    for (int i = 0; i < n; i++) {
        arr[i] = output[i];
    }
}

int main() {
    vector<int> arr = {5, 2, 9, 5, 2, 3, 4, 7, 6, 8, 1, 0};
    countingSort(arr);

    for (int i = 0; i < arr.size(); i++) {
        cout << arr[i] << " ";
    }

    cout << endl;

    return 0;
}
