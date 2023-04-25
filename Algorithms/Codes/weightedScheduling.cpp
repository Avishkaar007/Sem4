#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

struct Interval
{
    int start, end, weight;
};

bool cmp(const Interval &a, const Interval &b)
{
    return a.end < b.end;
}

int solve(vector<Interval> intervals)
{
    sort(intervals.begin(), intervals.end(), cmp);
    int n = intervals.size();
    vector<int> dp(n + 1, 0);
    for (int i = 1; i <= n; i++)
    {
        int j = i - 1;
        while (j >= 0 && intervals[j].end > intervals[i - 1].start)
        {
            j--;
        }
        dp[i] = max(dp[i - 1], dp[j + 1] + intervals[i - 1].weight);
    }
    return dp[n];
}

int main()
{
    vector<Interval> intervals = {{1, 4, 2}, {3, 5, 1}, {0, 6, 3}, {5, 7, 4}, {3, 8, 2}, {5, 9, 3}, {6, 10, 1}, {8, 11, 2}};
    int maxWeight = solve(intervals);
    cout << "The maximum total weight is " << maxWeight << endl;
    return 0;
}
