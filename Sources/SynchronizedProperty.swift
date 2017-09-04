//
//  SynchronizedProperty.swift
//  Pods
//
//  Created by Gal Orlanczyk on 04/09/2017.
//
//

import Foundation

/// `SynchronizedProperty` will be used as a property with synchronized protection for getting and setting it value.
/// 
/// ````
/// // creating the property
/// var state = SynchronizedProperty<MyState>(initialValue: .new)
///
/// // getting the value
/// state.value
///
/// // settings the value:
/// state.value = .newState
/// ````
public final class SynchronizedProperty<Value: Equatable> {
    
    private let synchronizedQueue: DispatchQueue
    private var _value: Value
    private var valueChangedHandler: ((Value) -> Void)?
    private var onChangeDispatchQueue = DispatchQueue.main
    
    public var value: Value {
        get {
            return synchronizedQueue.sync {
                return self._value
            }
        }
        set {
            synchronizedQueue.sync {
                if self._value != newValue {
                    self._value = newValue
                    onChangeDispatchQueue.async {
                        self.valueChangedHandler?(newValue)
                    }
                }
            }
        }
    }
    
    public init(initialValue value: Value, synchornizedQueue: DispatchQueue? = nil) {
        self._value = value
        self.synchronizedQueue = synchornizedQueue == nil ? DispatchQueue(label: "\(Value.self)-synchornized") : synchornizedQueue!
    }
    
    
    /// observe the changes of the value on the selected dispatch queue.
    ///
    /// - Parameters:
    ///   - observeOn: the dispatch queue to observe on.
    ///   - handler: the on change handler to be called when the value changes.
    public func onChange(observeOn onChangeDispatchQueue: DispatchQueue = DispatchQueue.main, handler: ((Value) -> Void)?) {
        self.onChangeDispatchQueue = onChangeDispatchQueue
        self.valueChangedHandler = handler
    }
}
