//
//  ViewController.swift
//  Psychologist
//
//  Created by Lê Viết Mẫn on 7/23/15.
//  Copyright (c) 2015 Lê Viết Mẫn. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {
    
    @IBAction func nothing(sender: UIButton) {
        performSegueWithIdentifier("nothing", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let button = sender as! UIButton
        
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "sad":
                    hvc.happiness = 0
                    hvc.titleView = button.currentTitle!
                case "happy":
                    hvc.happiness = 100
                    hvc.titleView = button.currentTitle!
                case "nothing":
                    hvc.happiness = 25
                    hvc.titleView = button.currentTitle!
                default:
                    hvc.happiness = 50
                    hvc.titleView = button.currentTitle!
                }
            }
        }
    }

}

