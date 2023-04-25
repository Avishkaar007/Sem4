#include <iostream>
#include <vector>

using namespace std;

int solve(vector<int> w, vector<int> v, int W) {
    int n = w.size();
    vector<vector<int>> dp(n+1, vector<int>(W+1, 0));
    for (int i = 1; i <= n; i++) {
        for (int j = 0; j <= W; j++) {
            if (w[i-1] > j) {
                dp[i][j] = dp[i-1][j];
            } else {
                dp[i][j] = max(dp[i-1][j], dp[i-1][j-w[i-1]] + v[i-1]);
            }
        }
    }
    return dp[n][W];
}

int main() {
    vector<int> w = {2, 3, 4, 5};
    vector<int> v = {3, 4, 5, 6};
    int W = 8;
    int maxVal = solve(w, v, W);
    cout << "The maximum total value is " << maxVal << endl;
    return 0;
}
