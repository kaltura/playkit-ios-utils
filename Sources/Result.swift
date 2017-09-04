//
//  File.swift
//  Pods
//
//  Created by Gal Orlanczyk on 04/09/2017.
//
//

import Foundation

/// `Result` is a helper enum that simplifies result patterns with success and failure.
public enum Result<Value> {
    /// success wraps a value of Value type.
    case success(Value)
    /// Failure wraps an Error
    case failure(Error?)
    
    /// getter for the value
    public var value: Value? {
        switch self {
        case .success(let v): return v
        case .failure: return nil
        }
    }
    
    /// getter for the error
    public var error: Error? {
        switch self {
        case .success: return nil
        case .failure(let e): return e
        }
    }
    
    /// Transforms the result from one type to another.
    /// In the event that this Result is a `.failure`, the next Result will have the same error as this one.
    ///
    /// - Parameter transform: transformation function.
    /// - Returns: New result from the tranformation return type.
    public func map<U>(_ transform: (Value) -> U) -> Result<U> {
        switch self {
        case .success(let val): return .success(transform(val))
        case .failure(let e): return .failure(e)
        }
    }
}
