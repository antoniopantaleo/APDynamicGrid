import XCTest
@testable import APDynamicGrid

final class APDynamicGridTests: XCTestCase {
    
    private var sut: DynamicGridViewModel<MockEntity>!
    
    override func setUp() {
        sut = DynamicGridViewModel()
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
    private func mockValues(size: Int) -> [MockEntity] { (0..<size).map {_ in  MockEntity() } }

    func testEmptyValues() {
        let grid = sut.getGrid(values: mockValues(size: 0), columns: 1)
        XCTAssertEqual(0, grid.keys.count)
    }
    
    func testEmptyColumns() {
        let grid = sut.getGrid(values: mockValues(size: 10), columns: 0)
        XCTAssertEqual(0, grid.keys.count)
    }
    
    func testEmptyValuesAndColumns() {
        let grid = sut.getGrid(values: mockValues(size: 0), columns: 0)
        XCTAssertEqual(0, grid.keys.count)
    }
    
    func testOneColumn() {
        let grid = sut.getGrid(values: mockValues(size: 10), columns: 1)
        XCTAssertEqual(10, grid.keys.count)
    }
    
    func testTwoColumns_evenValues() {
        let grid = sut.getGrid(values: mockValues(size: 10), columns: 2)
        XCTAssertEqual(5, grid.keys.count)
    }
    
    func testTwoColumns_oddValues() {
        let grid = sut.getGrid(values: mockValues(size: 11), columns: 2)
        XCTAssertEqual(6, grid.keys.count)
    }
    
    func testTwoColumns_oddValues_last() throws {
        let grid = sut.getGrid(values: mockValues(size: 11), columns: 2)
        let lastColumn = try XCTUnwrap(grid.keys.sorted().last)
        XCTAssertEqual(1, grid[lastColumn]?.count)
        XCTAssertEqual(2, grid[lastColumn - 1]?.count)
    }
    
    func testThreeColumns() {
        let grid = sut.getGrid(values: mockValues(size: 11), columns: 3)
        XCTAssertEqual(4, grid.keys.count)
    }
    
}

fileprivate struct MockEntity: Identifiable & Hashable {
    let id = UUID()
}
