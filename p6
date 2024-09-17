#Ford Fulkerson Algorithm
class Graph:
    def __init__(self, graph):
        self.graph = graph
    def bfs(self, s, t, parent):
        visited, queue = [False] * len(self.graph), [s]
        visited[s] = True
        while queue and not visited[t]:
            u = queue.pop(0)
            for v, c in enumerate(self.graph[u]):
                if not visited[v] and c > 0:
                    visited[v], parent[v] = True, u
                    queue.append(v)
        return visited[t]

    def ford_fulkerson(self, s, t):
        p, f = [-1] * len(self.graph),0
        while self.bfs(s, t, p):
            pf, v = float('inf'), t
            while v != s:
                u = p[v]
                pf, v = min(pf, self.graph[u][v]), u
            f += pf
            v = t
            while v != s:
                u = p[v]
                self. graph[u][v] -= pf
                self.graph[v][u] +=pf
                v = p[v]
        return f
graph = [[0,16,13,0,0,0],
                [0,0,10,12,0,0],
                 [0,4,0,0,14,0],
                 [0,0,9,0,0,20],
                 [0,0,0,7,0,4],
                 [0,0,0,0,0,0]]
g  = Graph(graph)
print("Max Flow: ", g.ford_fulkerson(0,5))
