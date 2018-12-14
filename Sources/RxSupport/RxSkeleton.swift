//  Copyright © 2018 SkeletonView. All rights reserved.

import Foundation

internal func debugFatalError(_ e: Error) {
    #if DEBUG
    fatalError("\(e)")
    #else
    print("\(e)")
    #endif
}
