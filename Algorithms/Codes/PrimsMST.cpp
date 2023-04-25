#include <iostream>
#include <vector>
#include <queue>
#include <utility>

using namespace std;

const int INF = 1e9;

// Function to compute the minimum spanning tree of a graph using Prim's Algorithm
int primMST(vector<vector<pair<int, int>>> &adjList) {
    int numVertices = adjList.size();
    vector<int> parent(numVertices, -1); // stores the parent of each vertex in the MST
    vector<int> key(numVertices, INF); // stores the key value of each vertex in the priority queue
    vector<bool> inMST(numVertices, false); // stores whether each vertex is in the MST or not

    // Use a priority queue to select the vertex with the minimum key value
    priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> pq;

    // Start with vertex 0
    key[0] = 0;
    pq.push(make_pair(0, 0));

    // Repeat until all vertices are in the MST
    while (!pq.empty()) {
        int u = pq.top().second;
        pq.pop();

        if (inMST[u]) {
            continue;
        }

        inMST[u] = true;

        // Update the key values and parent pointers of the adjacent vertices
        for (auto v : adjList[u]) {
            int neighbor = v.first;
            int weight = v.second;
            if (!inMST[neighbor] && weight < key[neighbor]) {
                parent[neighbor] = u;
                key[neighbor] = weight;
                pq.push(make_pair(key[neighbor], neighbor));
            }
        }
    }

    // Compute the weight of the MST
    int mstWeight = 0;
    for (int i = 1; i < numVertices; i++) {
        mstWeight += key[i];
    }

    // Print the edges of the MST
    cout << "Minimum Spanning Tree:" << endl;
    for (int i = 1; i < numVertices; i++) {
        cout << parent[i] << " - " << i << endl;
    }

    return mstWeight;
}

int main() {
    // Example graph represented using an adjacency list
    vector<vector<pair<int, int>>> adjList = {
        {{1, 5}, {2, 6}, {3, 2}},
        {{0, 5}, {2, 2}, {4, 5}},
        {{0, 6}, {1, 2}, {3, 6}, {4, 4}, {5, 3}},
        {{0, 2}, {2, 6}, {5, 6}},
        {{1, 5}, {2, 4}, {5, 2}},
        {{2, 3}, {3, 6}, {4, 2}}
    };

    int mstWeight = primMST(adjList);
    cout << "Total weight of the minimum spanning tree: " << mstWeight << endl;

    return 0;
}
