//
//  ViewController.swift
//  RustCBridge
//
//  Created by Michael Mooring on 7/4/20.
//  Copyright © 2020 MDM. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var userPath: NSPathControl!
    @IBOutlet var makeButton: NSButton!
    
    @IBAction func rustMake(_ sender: NSButton) {
        let rustGreetings = RustWrite()
        print("\(rustGreetings.write_test_file(path: self.userPath.url?.path ?? ""))")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

