import Foundation
import SwiftUI

// 그래프의 노드를 나타내는 구조체
struct Node: Identifiable {
    var id: Int
}

// 그래프의 엣지(간선)를 나타내는 구조체
struct Edge {
    var source: Int
    var destination: Int
    var weight: Int
}

// 다익스트라 알고리즘을 수행하는 함수
func dijkstra(graph: [Node], edges: [Edge], source: Int) -> [Int] {
    var distances = [Int](repeating: Int.max, count: graph.count) // 모든 노드까지의 거리를 무한대로 초기화
    distances[source] = 0 // 시작 노드의 거리는 0
    
    var visited = Set<Int>() // 방문한 노드를 저장할 집합
    
    // 모든 노드를 방문할 때까지 반복
    while visited.count < graph.count {
        // 방문하지 않은 노드 중에서 가장 가까운 노드를 찾음
        var minDistanceNode = -1
        var minDistance = Int.max
        for i in 0..<graph.count {
            if !visited.contains(i) && distances[i] < minDistance {
                minDistance = distances[i]
                minDistanceNode = i
            }
        }
        
        // 가장 가까운 노드를 방문한 것으로 표시
        visited.insert(minDistanceNode)
        
        // 방문한 노드와 연결된 모든 노드의 거리를 업데이트
        for edge in edges {
            if edge.source == minDistanceNode {
                let newDistance = distances[minDistanceNode] + edge.weight
                if newDistance < distances[edge.destination] {
                    distances[edge.destination] = newDistance
                }
            }
        }
    }
    
    return distances
}

struct ContentView: View {
    var body: some View {
        Text("Dijkstra Algorithm Example")
            .padding()
            .onAppear {
                let nodes = [Node(id: 0), Node(id: 1), Node(id: 2), Node(id: 3), Node(id: 4)] // 그래프의 노드
                let edges = [
                    Edge(source: 0, destination: 1, weight: 4),
                    Edge(source: 0, destination: 2, weight: 1),
                    Edge(source: 1, destination: 3, weight: 1),
                    Edge(source: 2, destination: 1, weight: 2),
                    Edge(source: 2, destination: 3, weight: 5),
                    Edge(source: 3, destination: 4, weight: 3)
                ] // 그래프의 엣지
                
                let sourceNode = 0 // 시작 노드
                let distances = dijkstra(graph: nodes, edges: edges, source: sourceNode)
                print("Shortest distances from node \(sourceNode): \(distances)")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
