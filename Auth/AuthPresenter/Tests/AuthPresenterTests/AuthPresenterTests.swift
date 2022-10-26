import XCTest
@testable import AuthPresenter

final class AuthPresenterTests: XCTestCase {
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let sut = makeSUT()
        
        XCTAssertNil(sut.user, "User should be nil")
        XCTAssertEqual(sut.name, "--",  "User name should return -- if not logged in")
    }
    
    func testUserLogin() throws {
        let sut = makeSUT()
        sut.login(name: "user")
        XCTAssertEqual(sut.name, "user",  "User name should be user")
    }
    
    func testUserLogout() throws {
        let sut = makeSUT()
        sut.login(name: "user")
        XCTAssertEqual(sut.name, "user",  "User name should be user")
        sut.logout()
        XCTAssertEqual(sut.name, "--",  "User name should return -- if not logged in")
    }
    
    func makeSUT() -> LoginStore {
        return LoginStore()
        
    }
    
}
