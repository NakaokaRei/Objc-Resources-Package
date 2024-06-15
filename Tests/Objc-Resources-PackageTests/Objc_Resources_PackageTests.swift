import XCTest
@testable import Objc_Resources_Package

final class Objc_Resources_PackageTests: XCTestCase {
    func testResourceBundleIsNonNil() throws {
        XCTAssertNotNil(Package.resourceBundle())
    }
}
