import RecursionAndDynamicProgrammingQuestions
import XCTest

class RecursionAndDynamicProgrammingTests: XCTestCase {

    /**
     8.1: Insertion

     A child is running up a staircase with n steps and can hop either 1 step, 2 steps, or 3 steps at a a time. Implement a method to count how many possible ways the child can run up the stairs.
     */
    func test_8_1_TripleSteps() {
        XCTAssertEqual(possibleWaysToStep(n: 1), 1)
        XCTAssertEqual(possibleWaysToStep(n: 2), 2)
        XCTAssertEqual(possibleWaysToStep(n: 3), 4)

        XCTAssertEqual(possibleWaysToStep(n: 50), 10562230626642)
    }

    /**
     8.2: Robot Grid

     Imagine a robot sitting on the upper left corner of grid r rows and c columns. The robot can only move in two directions, right and down, but certain cells are "off limits" such that the robot cannot step on them. Design an algorithm to find a path for the robot from the top left to the bottom right.
    */
    func test_8_2_RobotInAGrid() {
        assertPointsEqual(getPath(grid: [
            [0, 0, 1],
            [1, 0, 0],
            [1, 1, 0],
        ]),
        [
            (0,0), (0,1), (1,1), (1,2), (2,2)
        ])

        assertPointsEqual(getPath(grid: [
            [0, 0, 1, 0],
            [0, 0, 1, 0],
            [1, 0, 0, 0],
            [1, 1, 0, 0],
        ]),
        [
            (0,0), (0,1), (1,1), (2,1), (2,2), (2,3), (3,3)
        ])
    }

}
