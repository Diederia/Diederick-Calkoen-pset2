//
//  StoryViewController.swift
//  Diederick-Calkoen-pset2
//
//  Created by Diederick Calkoen on 07/11/16.
//  Copyright © 2016 Diederick Calkoen. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    
    var words: String?
    var name: String?
    
    @IBOutlet weak var storyName: UILabel!
    @IBOutlet weak var storyField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the right title and fill in the full story
        storyName.text = name! + " story"
        storyField.text = words
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
