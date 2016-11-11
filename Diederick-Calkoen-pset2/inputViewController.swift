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
    var textStory: String?
    var finalStory: String?
    var finalTitle: String?
    var storyTitle: String?
    
    
    @IBOutlet weak var wordsInputField: UITextField!
    @IBOutlet weak var nextWord: UIButton!
    @IBOutlet weak var nextView: UIButton!
    @IBOutlet weak var inputCounter: UILabel!
    
    @IBAction func nextWordPress(_ sender: Any) {
        
        // If input is filled in, safe input and get the right inputCounter.
        if (wordsInputField.text == "") {
            return
        }
        else {
            story.fillInPlaceholder(word: wordsInputField.text!)
            
            if (story.getPlaceholderRemainingCount() < 2) {
                inputCounter.text = "Almost done!"
            }
            else {
                inputCounter.text = String(story.getPlaceholderRemainingCount()) + " words left"
            }
            
            // Empty field
            wordsInputField.text = ""
            wordsInputField.placeholder = story.getNextPlaceholder()
            
            // If all input is filled in, change the 4 ellements.
            if (wordsInputField.placeholder == "") {
                inputCounter.text = "You are done! Click 'go to story!' to see the story!"
                nextView.isHidden = false
                wordsInputField.isHidden = true
                nextWord.isHidden = true
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hidde button to next view.
        nextView.isHidden = true
        
        // Get the title of the file the and location of file to load.
        let rand = arc4random_uniform(5)
        let randTitle = Int(rand)
        let filesNames = ["Simple", "Tarzan", "University", "Clothes", "Dance"]
        storyTitle = filesNames[randTitle]
        let randStory = String(rand)
        let storyName = "madlib" + randStory
        let locationFile = Bundle.main.path(forResource: storyName, ofType: "txt")

        // If the file not is loadable print a error
        do {
            textStory = try String(contentsOfFile: locationFile!)
            story = Story(stream: textStory!)
            wordsInputField.placeholder = story.getNextPlaceholder()
            inputCounter.text = String(story.getPlaceholderRemainingCount()) + " words left"
        } catch {
            print("Could not read file")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Segue to send all words and the story title to the next field.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        finalStory = story.toString()
        finalTitle = storyTitle
        if let storyVC = segue.destination as? StoryViewController {
            storyVC.words = finalStory!
            storyVC.name = finalTitle
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
