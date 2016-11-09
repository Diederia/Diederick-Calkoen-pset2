//
//  inputViewController.swift
//  Diederick-Calkoen-pset2
//
//  Created by Diederick Calkoen on 07/11/16.
//  Copyright © 2016 Diederick Calkoen. All rights reserved.
//

import UIKit

class inputViewController: UIViewController {

    var story: Story!
    var counter = 0
    
    
    @IBOutlet weak var wordsInputField: UITextField!
    @IBOutlet weak var nextWord: UIButton!
    @IBOutlet weak var toStoryField: UIButton!
    @IBOutlet weak var counterWords: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let storyVC = segue.destination as? StoryViewController{
            storyVC.words += .story
        }
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
