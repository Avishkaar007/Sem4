#include <iostream>
#include <list>
#include <stack>
using namespace std;

template<class t> class Graph{
    private:
        int V;
        list<t> *adj;
    public:
        Graph(int v){
            V=v;
            adj = new list<t>[v];
        }

        void addEdge(int u, int v){
            adj[u].push_back(v);
            adj[v].push_back(u);
        }

        void printGraph() {
            for (int d = 1; d < V; ++d) {
                cout << "\nVertex " << d << ":";
                for (int i : adj[d]){
                    cout << "-> " << i;
                }
            }
        }

        void DFS(int source) {
            stack<int> stack;
            bool visited[V];
            for (int i = 0; i < V; i++) {
                visited[i] = false;
            }
            stack.push(source);
            visited[source] = true;
            while (!stack.empty()) {
                int vertex = stack.top();
                stack.pop();
                cout << "Parent :- " << vertex << endl;
                for (int i : adj[vertex]) {
                    if (!visited[i]) {
                        stack.push(i);
                        visited[i] = true;
                        cout << "   Child :- " << i;
                    }
                }
                cout << endl;
            }
        }
};

int main(){
    // int v;
    // cout << "Enter The number Of Nodes :- ";
    // cin >> v;
    Graph<int> g(9);
    g.addEdge(1,2);
    g.addEdge(1,3);
    g.addEdge(2,3);
    g.addEdge(2,4);
    g.addEdge(2,5);
    g.addEdge(3,5);
    g.addEdge(3,7);
    g.addEdge(3,8);
    g.addEdge(4,5);
    g.addEdge(5,6);
    g.addEdge(7,8);
    g.printGraph();
    int* parent = new int[8];
    cout << endl;
    g.DFS(1);
    // for(int i = 1; i <= 8 ; i++){
    //     cout << "Node " << i << " has parent " << parent[i] << endl;
    // }
    return 0;
}
