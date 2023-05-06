#include <iostream>
#include <vector>
using namespace std;
#define init(i,a,b) for (int i=a;i<b;i++)
vector<int> val,wt, mem;

int Knapsack(int n,int w){
    if (w<0||n<0){
        return 0;}
    if (wt[n]>w)
    {return Knapsack(n-1,w);}
    return max(Knapsack(n-1,w),Knapsack(n-1,w-wt[n-1])+val[n]);
}
vector<vector<int>> st;
int memoizedKnapsack(int n,int w){
    if (w<0||n<0){
        return 0;}
    if(st[n][w]!=-1){
        return st[n][w];
    }
    if (wt[n]>w)
    {st[n][w]=memoizedKnapsack(n-1,w);}
    return st[n][w]=max(memoizedKnapsack(n-1,w),memoizedKnapsack(n-1,w-wt[n-1])+val[n]);
}
int main(){
    int w; // Total Weight of Sack
    cout<<"Enter Total Weight ";
    cin>>w;
    cout<<"Enter Total items ";
    int n;// Total Elements
    cin>>n;
    int tmp;
    //Initialize value array
    cout<<"Enter Values ";
    init(i,0,n){
        cin>>tmp;
        val.push_back(tmp);
    }
    cout<<"Enter individual weights ";
    init(i,0,n){
        cin>>tmp;
        wt.push_back(tmp);
    }
  
    init(i,0,n){
        init(j,0,n){
            st[i][j]=-1;
        }
    }
    cout<<Knapsack(n,w);
    return 0;
}
/*20 5 80 60 40 10 50 8 6 4 1 5
*/