#include <iostream>
#include <vector>
using namespace std;
#define init(i,a,b) for (int i=a;i<b;i++)
vector<vector<int>> interval;
int main(){
    int n=3;//no of processes
    int start=0,end=0;
    init(i,0,n){
        cin>>start>>end;
        interval.push_back({start,end});
    }
    init(i,0,n){
        cout<<interval[i];
    }
    return 0; 
}
//1 2 2 5 4 6