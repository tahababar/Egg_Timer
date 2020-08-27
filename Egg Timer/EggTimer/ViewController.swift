//
//  ViewController.swift
//  EggTimer
//

//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let softTime = 3;
    let mediumTime = 7;
    let hardTime = 12;
    var timer = Timer();
    var totalTime = 0;
    var secondsPassed = 0;
    var player: AVAudioPlayer!;
    
   @IBAction func hardnessSelected(_ sender: UIButton) {
    
    timer.invalidate();
    topTitle.text = "How do you like your eggs?";
    secondsPassed = 0;
    
    
    let hardness = sender.currentTitle;
    if (hardness == "Soft")
    {
        totalTime = softTime * 60;
    }
    else if (hardness == "Medium")
    {
        totalTime = mediumTime * 60;
    }
    else if (hardness == "Hard")
    {
        totalTime = hardTime * 60;
    }
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true);
    
    }
    
    @objc func updateCounter() {
        
    if (secondsPassed < totalTime) {
        progressBar.progress = Float(secondsPassed) / Float(totalTime);
        secondsPassed += 1;
    }
    else{
        topTitle.text = "Done!";
        playSound();
    }
}
    func playSound() {
          let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3");
          player = try! AVAudioPlayer(contentsOf: url!);
          player.play();
                  
      }

}

/*
 "Optionals" Lecture:
 You use optionals in situations where a value may be absent. An optional represents two possibilities: Eitherthere is a value, and you can unwrap the optional to access that value, or there isn't a value at all.
 For example, if we declare a variable i.e. "var player : String = "taha"" (we use : to specify a data type for a particular variable), it means that no other data type other than string can be used for player..if we dont add string, then we will be allowed to use any data tyope for that variable, BUT if we use an optional i.e.
 var player : String? = nil, it means that there can be 2 options. i.e nil (nothing in variable) or a string. We will be able to add a string later to the variable.
We can do a lot of things with nil, like if(player == nil) //do something, REMEMBER IF WE TRY TO PRINT A NIL VARIABLE, ERROR WILL COME (JUST LIKE DEFERENECING NULL IN C++)
 To change an optional string to normal string, we can force unwrap it (!) by writing var unwrappedplayer = player!
 */
/*
 "Dictionaries" Lecture:
 let eggTimes = ["Soft": 5, "Medium": 7, "Hard", 12]  //key:value
 let hardness = sender.currentTitle!;  //Soft, Medium, Hard
 print (eggTimes[hardness]); //! added above with currentTitle because sender.currentTitle is String?, and it needs to be converted to a normal string as eggTimes keys are strings (if we dont do this, then we will get an error)
 */
