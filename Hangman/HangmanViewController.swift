//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {
    
    var newGame = Hangman()
    var countWrong = 0
    var currentPic = 0
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var guessButton: UIButton!
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var guessed: UILabel!
    @IBOutlet weak var IncorrectGuessed: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var knownString: UILabel!
    var wrongGuess = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func start() {
        newGame.start()
        currentPic = 0
        guessed.text = newGame.knownString
        image.image = nil

    }
    
    @IBAction func guess() {
        
        if (!(newGame.knownString!.containsString("_"))) {
            
            let controller = UIAlertController(title: "Winner", message:"Congradulation!", preferredStyle: UIAlertControllerStyle.Alert)
            controller.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default,handler: nil))
            presentViewController(controller, animated: true, completion: nil)
            return;
        }
        if (countWrong == 7) {
            let controller = UIAlertController(title: "Sorry", message:"You lost!", preferredStyle: UIAlertControllerStyle.Alert)
            controller.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default,handler: nil))
            presentViewController(controller, animated: true, completion: nil)
            return;
        }
        if (!newGame.guessLetter(Array(arrayLiteral: guessTextField.text!.uppercaseString)[0])) {
            currentPic += 1
            image.image = UIImage(named: "hangman\(currentPic).gif")
            countWrong++;
            if (!wrongGuess.containsString(Array(arrayLiteral: guessTextField.text!.uppercaseString)[0])) {
                wrongGuess += Array(arrayLiteral: guessTextField.text!.uppercaseString)[0]
            }
            IncorrectGuessed.text = wrongGuess
        }

        self.view.endEditing(true)
        guessTextField.text = ""
        guessed.text = newGame.knownString
        
        if (!(newGame.knownString!.containsString("_"))) {
           
            let controller = UIAlertController(title: "Winner", message:"Congradulation!", preferredStyle: UIAlertControllerStyle.Alert)
            controller.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default,handler: nil))
            presentViewController(controller, animated: true, completion: nil)
            return;
        }
        if (countWrong == 7) {
            let controller = UIAlertController(title: "Sorry", message:"You lost!", preferredStyle: UIAlertControllerStyle.Alert)
            controller.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default,handler: nil))
            presentViewController(controller, animated: true, completion: nil)
            return;
        }
    }
}




