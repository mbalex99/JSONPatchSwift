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

public enum JPSJsonPointerError: ErrorType {
    case ValueDoesNotContainDelimiter
    case NonEmptyPointerDoesNotStartWithDelimiter
    case ContainsEmptyReferenceToken
    case EvaluationFailed
}

public struct JPSJsonPointer {
    
    let rawValue: String
    let pointerValue: [JSONSubscriptType]
    
}

extension JPSJsonPointer {

    public init(rawValue: String) throws {
        
        guard rawValue.isEmpty || rawValue.containsString(JPSConstants.JsonPointer.Delimiter) else {
            throw JPSJsonPointerError.ValueDoesNotContainDelimiter
        }
        guard rawValue.isEmpty || rawValue.hasPrefix(JPSConstants.JsonPointer.Delimiter) else {
            throw JPSJsonPointerError.NonEmptyPointerDoesNotStartWithDelimiter
        }
        
        let pointerValueWithoutFirstElement = Array(rawValue.componentsSeparatedByString(JPSConstants.JsonPointer.Delimiter).dropFirst())
        
        guard rawValue.isEmpty || !pointerValueWithoutFirstElement.contains(JPSConstants.JsonPointer.EmptyString) else {
            throw JPSJsonPointerError.ContainsEmptyReferenceToken
        }
        
        let pointerValueAfterDecodingDelimiter = pointerValueWithoutFirstElement.map { $0.stringByReplacingOccurrencesOfString(JPSConstants.JsonPointer.EscapedDelimiter, withString: JPSConstants.JsonPointer.Delimiter) }
        let pointerValue: [JSONSubscriptType] = pointerValueAfterDecodingDelimiter.map { $0.stringByReplacingOccurrencesOfString(JPSConstants.JsonPointer.EscapedEscapeCharacter, withString: JPSConstants.JsonPointer.EscapeCharater)}
        
        self.init(rawValue: rawValue, pointerValue: pointerValue)
    }
    
}

extension JPSJsonPointer {
    static func traverse(pointer: JPSJsonPointer) -> JPSJsonPointer {
        let pointerValueWithoutFirstElement = Array(pointer.rawValue.componentsSeparatedByString(JPSConstants.JsonPointer.Delimiter).dropFirst().dropFirst()).joinWithSeparator(JPSConstants.JsonPointer.Delimiter)
        // swiftlint:disable force_try
        return try! JPSJsonPointer(rawValue: JPSConstants.JsonPointer.Delimiter + pointerValueWithoutFirstElement)
        // swiftlint:enable force_try
    }
}
