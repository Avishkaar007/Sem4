#include <iostream>
#include <vector>
#include <bits\stdc++.h>
using namespace std;
int main(){
vector<vector<int>> v={{4,16},{1,1},{2,4},{3,9}};
sort(v.begin(),v.end(),[&](vector<int> &a,vector<int> &b){return a[1]<b[1]; });
for (auto i=v.begin();i!=v.end();i++ ){
cout<<(*i)[1]<<" ";}

}