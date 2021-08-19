//
//  Copyright SkeletonView. All Rights Reserved.
//
//  Licensed under the MIT License (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      https://opensource.org/licenses/MIT
//
//  ProcessInfo+Extensions.swift
//
//  Created by Juanpe Catalán on 18/8/21.

import Foundation

extension ProcessInfo {
    
    enum Constants {
        static let testConfigurationFilePathKey = "XCTestConfigurationFilePath"
    }
    
    static var isRunningXCTest: Bool {
        return processInfo.environment[Constants.testConfigurationFilePathKey] != nil
    }
    
}
