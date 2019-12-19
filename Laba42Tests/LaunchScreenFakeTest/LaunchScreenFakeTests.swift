//
//  LaunchScreenFakeTests.swift
//  Laba42Tests
//
//  Created by chizhavko on 12/18/19.
//  Copyright © 2019 chizhavko. All rights reserved.
//

import XCTest

class LaunchScreenFakeTests: XCTestCase {
  
  func testIsviewBecomeVisible() {
    let launchView = LaunchScreenFake()
    let line = UIView()
    line.alpha = 0
    launchView.animateView(on: line, delayAfter: 0)
    XCTAssertTrue(line.alpha == 1)
  }
}
