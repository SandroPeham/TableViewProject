//
//  ViewController.swift
//  TableViewProject
//
//  Created by Sandro Peham on 25.04.16.
//  Copyright © 2016 Sandro Peham. All rights reserved.
//

import Cocoa
import GameplayKit

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {
    
    private var elements: [Int] = []

    @IBOutlet var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 1...3 {
            elements.append(GKRandomSource.sharedRandom().nextInt())
        }
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func addCell(sender: NSButton) {
        elements.append(GKRandomSource.sharedRandom().nextInt())
        tableView.reloadData()
    }

    @IBAction func deleteCell(sender: NSButton) {
        if tableView.selectedRow != -1 {    // only deletes if a cell is selected!
            elements.removeAtIndex(tableView.selectedRow)
            tableView.reloadData()
        }
    }
    
    // MARK: - TableViewDelegate
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if let cell = tableView.makeViewWithIdentifier("randomIntCell", owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = "\(elements[row])"
            return cell
        }
        return nil
    }
    
    // MARK: - TableViewDataSource
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return elements.count
    }
}

