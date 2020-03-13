// Copyright © 2020 SkeletonView. All rights reserved.

import Foundation

extension ProcessInfo {
    enum Constants {
        static let testConfigurationFilePathKey = "XCTestConfigurationFilePath"
    }
    
    static var isRunningXCTest: Bool {
        return processInfo.environment[Constants.testConfigurationFilePathKey] != nil
    }
}
