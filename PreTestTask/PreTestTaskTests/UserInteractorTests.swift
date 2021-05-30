//
//  UserInteractorTests.swift
//  TestTaskTests
//
//  Created by MacOS on 29/05/21.
//

import XCTest
@testable import PreTestTask

class UserInteractorTests: XCTestCase {

    var userInteractor = PostDetailsInteractor()

    override class func setUp() {
        super.setUp()
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserPosts() throws {
//Check if get user with matching user id
        let expectation = self.expectation(description: "GetPosts")
        userInteractor.userid = 3
        userInteractor.getUser(success: { user in
            print("user \(String(describing: user?.username))")
            XCTAssert(user?.username != nil, "UserInteractor failed to get Users")
                        expectation.fulfill()
                    }, failure: { error in
                        XCTAssertNil(error)
                        expectation.fulfill()
                    })
        
        waitForExpectations(timeout: 3, handler: { error in
            XCTAssertNil(error)
        })
    }

}
