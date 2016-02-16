//===----------------------------------------------------------------------===//
//
// This source file is part of the JSONPatchSwift open source project.
//
// Copyright (c) 2015 EXXETA AG
// Licensed under Apache License v2.0
//
//
//===----------------------------------------------------------------------===//

import SwiftyJSON

func == (lhs: JPSOperation, rhs: JPSOperation) -> Bool {
    return lhs.type == rhs.type
}

/// RFC 6902 compliant JavaScript Object Notation (JSON) Patch operation implementation, see https://tools.ietf.org/html/rfc6902#page-4.
public struct JPSOperation {
    
    /**
     Operation types as stated in https://tools.ietf.org/html/rfc6902#page-4.
     
     - Add: The `add` operation.
     - Remove = The `remove` operation.
     - Replace = The `replace` operation.
     - Move = The `move` operation.
     - Copy = The `copy` operation.
     - Test: The `test` operation.
     */
    public enum JPSOperationType: String {
        case Add = "add"
        case Remove = "remove"
        case Replace = "replace"
        case Move = "move"
        case Copy = "copy"
        case Test = "test"
    }
    
    let type: JPSOperationType
    let pointer: JPSJsonPointer
    let value: JSON
    let from: JPSJsonPointer?
}
