//
//  MasterViewController.swift
//  ScaryBugsMac
//
//  Created by Lê Viết Mẫn on 7/25/15.
//  Copyright (c) 2015 Lê Viết Mẫn. All rights reserved.
//

import Cocoa

class MasterViewController: NSViewController {
    
    var bugs = [ScaryBugDoc]()
    
    func setupSampleBugs() {
        let bug1 = ScaryBugDoc(title: "Potato Bug", rating: 4.0,
                               thumbImage: NSImage(named: "potatoBugThumb"),
                               fullImage: NSImage(named: "potatoBug"))
        let bug2 = ScaryBugDoc(title: "House Centipede", rating: 3.0,
                               thumbImage: NSImage(named: "centipedeThumb"),
                               fullImage: NSImage(named: "centipede"))
        let bug3 = ScaryBugDoc(title: "Wolf Spider", rating: 5.0,
                               thumbImage: NSImage(named: "wolfSpiderThumb"),
                               fullImage: NSImage(named: "wolfSpider"))
        let bug4 = ScaryBugDoc(title: "Lady Bug", rating: 1.0,
                               thumbImage: NSImage(named: "ladybugThumb"),
                               fullImage: NSImage(named: "ladybug"))
        
        bugs = [bug1, bug2, bug3, bug4]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSampleBugs()
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

// MARK: - NSTableViewDataSource
extension MasterViewController: NSTableViewDataSource {
    func numberOfRowsInTableView(aTableView: NSTableView) -> Int {
        return self.bugs.count
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        // 1
        var cellView: NSTableCellView = tableView.makeViewWithIdentifier(tableColumn!.identifier, owner: self) as! NSTableCellView
        
        // 2
        if tableColumn!.identifier == "BugColumn" {
            // 3
            let bugDoc = self.bugs[row]
            cellView.imageView!.image = bugDoc.thumbImage
            cellView.textField!.stringValue = bugDoc.data.title
            return cellView
        }
        
        return cellView
    }
}

// MARK: - NSTableViewDelegate
extension MasterViewController: NSTableViewDelegate {
}