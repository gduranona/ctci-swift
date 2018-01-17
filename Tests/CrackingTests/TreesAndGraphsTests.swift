import TreesAndGraphsQuestions
import DataStructure
import XCTest

class TreesAndGraphsTests: XCTestCase {

    /**
     4.1: Route Between Nodes

     Given a directed graph, design an algorithm to find out whether there is a route between two nodes.
     */
    func test_4_1_RouteBetweenNodes() {
        let nodes = ["a","b","c","d","e","f"]
        let dependencies = [("a","d"), ("f","b"), ("b","d"), ("f","a"), ("d","c") ]
        let graph = Graph<MarkedVertex>(vertices: nodes, edges: dependencies)

        let f = graph.getVertex("f")!
        let e = graph.getVertex("e")!
        let c = graph.getVertex("c")!

        graph.reset()
        XCTAssertFalse(isDfsRouted(from: f, to: e, in: graph))

        graph.reset()
        XCTAssert(isDfsRouted(from: f, to: c, in: graph))

        graph.reset()
        XCTAssertFalse(isBfsRouted(from: f, to: e, in: graph))

        graph.reset()
        XCTAssert(isBfsRouted(from: f, to: c, in: graph))
    }


    /**
     4.2: Minimal Tree

     Given a sorted (increasing order) array with unique integer elements, write an algorithm to create a binary search tree with minimal height.
    */
    func test_4_2_MinimalTree() {
        let list = [1, 3, 5, 6, 9, 13, 16, 20]

        let one = BinaryTree.node(.empty, 1, .empty)
        let three = BinaryTree.node(one, 3, .empty)
        let six = BinaryTree.node(.empty, 6, .empty)
        let thirteen = BinaryTree.node(.empty, 13, .empty)
        let twenty = BinaryTree.node(.empty, 20, .empty)
        let five = BinaryTree.node(three, 5, six)
        let sixteen = BinaryTree.node(thirteen, 16, twenty)
        let expectedTree = BinaryTree.node(five, 9, sixteen)

        XCTAssertEqual(minimalTree(list), expectedTree)
    }


    /**
     4.3: List of Depth

     Given a binary tree, design an algorithm which creates a linked list of all the nodes at each depth (e.g. if you have a tree with depth D, you'll have D linked lists).
    */

    /**
     4.7: Build Order

     You are given a list of projects and a list of dependencies (which is a list of pairs of projects, where the second project is dependent on the first project). All of a project's dependencies must be built before the project is. Find a build order that will allow the projects to be built. If there is no valid build order, return an error.

     Input:
      `projects: a, b, c, d, e, f`
      `dependencies: (a,d), (f,b), (b,d), (f,a), (d,c)`
    Output: `f, e, a, b, d, c`
     */
    func test_4_7_BuildOrder() {
        let projects = ["a","b","c","d","e","f"]
        let dependencies = [("a","d"), ("f","b"), ("b","d"), ("f","a"), ("d","c") ]
        let graph = Graph<Project>(vertices: projects, edges: dependencies)

        graph.reset()
        assertOrderSorted(order(graph), in: graph)

        graph.reset()
        assertOrderSorted(order2(graph), in: graph)
    }

}
