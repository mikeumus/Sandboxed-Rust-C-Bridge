//
//  RustGreetings.swift
//  RustCBridge
//
//  Created by Michael Mooring on 7/5/20.
//  Copyright © 2020 MDM. All rights reserved.
//

import Foundation

class RustWrite {
    func write_test_file(path: String) -> String {
        let result = rust_write(path)
        let swift_result = String(cString: result!)
        rust_write_free(UnsafeMutablePointer(mutating: result))
        return swift_result
    }
}
