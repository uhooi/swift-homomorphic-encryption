// Copyright 2024 Apple Inc. and the Swift Homomorphic Encryption project authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

@testable import HomomorphicEncryption
import XCTest

class Array2dTests: XCTestCase {
    func testZeroize() {
        func runTest<T: FixedWidthInteger & Sendable>(_: T.Type) {
            let data = [T](1...16)
            var array = Array2d(data: data, rowCount: 2, columnCount: 8)
            array.zeroize()

            let zero = Array2d(
                data: [T](repeating: 0, count: 16),
                rowCount: 2,
                columnCount: 8)
            XCTAssertEqual(array, zero)
        }
        runTest(Int.self)
        runTest(Int32.self)
        runTest(Int32.self)
        runTest(Int64.self)
        runTest(UInt64.self)
        runTest(DWUInt128.self)
    }

    func testShape() {
        let data = [Int](0..<16)
        let array = Array2d(data: data, rowCount: 2, columnCount: 8)
        XCTAssert(array.shape == (2, 8))
    }

    func testIndices4x4() {
        let data = [Int](0..<16)
        let array = Array2d(data: data, rowCount: 4, columnCount: 4)

        XCTAssertEqual(array.collectValues(indices: array.rowIndices(row: 0)), [0, 1, 2, 3])
        XCTAssertEqual(array.collectValues(indices: array.columnIndices(column: 0)), [0, 4, 8, 12])
    }

    func testIndices2x8() {
        let data = [Int](0..<16)
        let array = Array2d(data: data, rowCount: 2, columnCount: 8)

        XCTAssertEqual(array.collectValues(indices: array.rowIndices(row: 0)), [0, 1, 2, 3, 4, 5, 6, 7])
        XCTAssertEqual(array.collectValues(indices: array.columnIndices(column: 0)), [0, 8])
        XCTAssertEqual(array.collectValues(indices: array.columnIndices(column: 7)), [7, 15])
    }

    func testTransposed() {
        let data = [Int](0..<16)
        let array = Array2d(data: data, rowCount: 2, columnCount: 8)
        let transposed = array.transposed()

        XCTAssert(array.shape == (2, 8))
        XCTAssert(transposed.shape == (8, 2))

        XCTAssertEqual(transposed.collectValues(indices: transposed.rowIndices(row: 0)), [0, 8])
        XCTAssertEqual(transposed.collectValues(indices: transposed.rowIndices(row: 7)), [7, 15])
        XCTAssertEqual(transposed.collectValues(indices: transposed.columnIndices(column: 0)), [0, 1, 2, 3, 4, 5, 6, 7])
        XCTAssertEqual(
            transposed.collectValues(indices: transposed.columnIndices(column: 1)),
            [8, 9, 10, 11, 12, 13, 14, 15])
    }

    func testResizeColumn() {
        var array = Array2d(data: [Int](0..<6), rowCount: 2, columnCount: 3)

        array.resizeColumn(newColumnCount: 5, defaultValue: 99)
        let newData: [Int] = [0, 1, 2, 99, 99, 3, 4, 5, 99, 99]
        XCTAssertEqual(array, Array2d(data: newData, rowCount: 2, columnCount: 5))

        array.resizeColumn(newColumnCount: 3)
        XCTAssertEqual(array, Array2d(data: [Int](0..<6), rowCount: 2, columnCount: 3))
    }

    func testRemoveLastRows() {
        let data = [Int](0..<32)
        var array = Array2d(data: data, rowCount: 4, columnCount: 8)

        array.removeLastRows(2)
        XCTAssertEqual(array, Array2d(data: [Int](0..<16), rowCount: 2, columnCount: 8))

        array.removeLastRows(1)
        XCTAssertEqual(array, Array2d(data: [Int](0..<8), rowCount: 1, columnCount: 8))

        array.removeLastRows(1)
        XCTAssertEqual(array, Array2d(data: [], rowCount: 0, columnCount: 8))
    }

    func testAppendRows() {
        let data = [Int](0..<32)
        var array = Array2d(data: data, rowCount: 4, columnCount: 8)
        array.append(rows: [])
        XCTAssertEqual(array, Array2d(data: data, rowCount: 4, columnCount: 8))

        array.append(rows: [32, 33, 34, 35, 36, 37, 38, 39])
        XCTAssertEqual(array, Array2d(data: [Int](0..<40), rowCount: 5, columnCount: 8))

        array.append(rows: Array(40..<56))
        XCTAssertEqual(array, Array2d(data: [Int](0..<56), rowCount: 7, columnCount: 8))
    }
}
