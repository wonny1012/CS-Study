import UIKit

import Foundation

func DFS(graph: [String: [String]], start: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitStack: [String] = [start]
    
    while !needVisitStack.isEmpty {
        //가장 나중에 쌓인 것을 추출 하는 작업
        let node: String = needVisitStack.removeLast()
        print(needVisitStack)
        //추출한 노드가 Queue에 존재한다면 계속 진행
        if visitedQueue.contains(node) { continue }
        //추출한 노드가 Queue에 존재하지 않는다면 넣어준다.
        visitedQueue.append(node)
        //노드와 인접한 것들을 stack에 넣어준다.
        needVisitStack += graph[node] ?? []
//        print(needVisitStack)
    }
    return visitedQueue
}

func BFS(graph: [String: [String]],start: String) -> [String] {
    var visitedQueue: [String] = []
    var needVisitQueue: [String] = [start]
    
    while !needVisitQueue.isEmpty {
        var node:String = needVisitQueue.removeFirst()
        if visitedQueue.contains(node) { continue }
        
        visitedQueue.append(node)
        needVisitQueue += graph[node] ?? []
    }
    return visitedQueue
}





var graph: [String: [String]] = [
    "A" : ["B","C"],
    "B" : ["A","D","E"],
    "C" : ["A","F"],
    "D" : ["B"],
    "E" : ["B"],
    "F" : ["C"],
]

DFS(graph: graph, start: "A")
BFS(graph: graph, start: "A")
