import UIKit


import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var boardArray:[[Int]] = Array(repeating: [], count: board.count )
    var stack = [Int]()
    var moveArray = moves.map { $0 - 1 }
    var result = 0
    var value = 0
    
    
    for i in 0..<board.count {
        for j in 0..<board.count {
            if board[i][j] != 0 {
                boardArray[i].append(board[i][j])
            }
        }
    }
//    print(boardArray)
    
    for count in moveArray {
            value = boardArray[count].popLast()!
        if count < board.count {
            if stack.isEmpty {
                stack.append(value)
            } else if stack.popLast() == value {
                stack.popLast()
                result += 2
            } else {
                stack.append(value)
            }
        }
    }
    return result
}

solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4])



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
