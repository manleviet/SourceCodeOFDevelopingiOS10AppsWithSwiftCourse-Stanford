//
//  DiagnosticHappinessViewController.swift
//  Psychologist
//
//  Created by Lê Viết Mẫn on 7/23/15.
//  Copyright (c) 2015 Lê Viết Mẫn. All rights reserved.
//

import UIKit

class DiagnosticHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate {
    
    override var happiness: Int {
        didSet {
            diagnosticHisotry += [happiness]
        }
    }
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var diagnosticHisotry: [Int] {
        get {
            return defaults.objectForKey(History.DefaultKey) as? [Int] ?? []
        }
        set {
            defaults.setObject(newValue, forKey: History.DefaultKey)
        }
    }
    
    private struct History {
        static let SegueIdentifier = "Show Diagnostic History"
        static let DefaultKey = "DiagnosedHappinessViewController.History"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier:
                if let tvc = segue.destinationViewController as? TextViewController {
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    tvc.text = "\(diagnosticHisotry)"
                }
            default: break
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController!, traitCollection: UITraitCollection!) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}