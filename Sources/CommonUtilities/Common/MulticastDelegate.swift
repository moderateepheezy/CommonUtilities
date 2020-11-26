//
//  MulticastDelegate.swift
//  Common
//
//  Created by Afees Lawal on 6/25/19.
//  Copyright © 2019 Afees Lawal. All rights reserved.
//

import Foundation

public final class MulticastDelegate<T> {
    // MARK: - Private Properties
    private var delegates = NSHashTable<AnyObject>(options: [.weakMemory])
    
    // MARK: - Lifecycle
    deinit {
        removeAll()
    }
    
    // MARK: - Public Functions
    public func add(_ delegate: T) {
        delegates.add(delegate as AnyObject)
    }
    public func remove(_ delegate: T) {
        delegates.remove(delegate as AnyObject)
    }
    public func removeAll() {
        delegates.removeAllObjects()
    }
    public func notify(_ closure: (T) -> Void) {
        delegates.allObjects.map({ $0 as! T }).forEach(closure)
    }
}
