//
//  ViewController.swift
//  LearnEnglish
//
//  Created by Tomasz Twardowski on 27/10/2016.
//  Copyright © 2016 Tomasz Twardowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     
     var arrayButton = [UIButton]()
    var counter = 5
    var trueAnswerLabel:String = " "
    var currentWord = 0
    var trueAnswer:UInt32 = 0
    var rndAns:UInt32 = 0
    
    var selectTable = 0
    var score = 0
    var currentList:Int = 0
    var listD = WordsDictionary.d.getWordsForCategory(category: "animal", primaryLanguage: "EN", secondaryLanguage: "PL")
    var list:NSDictionary = [String:Array<String>]() as NSDictionary
  //  word chicken
    var but:UIButton = UIButton()
    var value = Array<[String]>()
    var key = [String]()
    var wrongAnswer = [String]()
    var wrongAnswer2 = [String]()
    var wrongAnswer3 = [String]()
    var button:UIButton = UIButton()
    @IBOutlet weak var Word: UILabel!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBAction func pushAnswer(_ sender: UIButton)
    {
    
   
       if(sender.tag == Int(trueAnswer))
        {
            score += 1
            wrongAnswer2.append(Word.text! + " " + (sender.titleLabel?.text)! )
            wrongAnswer3.append("t")
        }
       //else{
        /*
        button = view.viewWithTag(Int(trueAnswer)) as! UIButton
        var text = button.titleLabel?.text
         wrongAnswerTest.append(text!)
        
       for i in 1...4
        {
          buttonBadAns = view.viewWithTag(i) as! UIButton
            if buttonBadAns.isTouchInside == true
            {
            wrongAnswer.append( (buttonBadAns.titleLabel?.text)!)
                print(wrongAnswer)
            }
        }*/
        
        
        //if sender.tag != Int(trueAnswer)
        else
        {
            print(sender.titleLabel?.text)
            
           wrongAnswer2.append(Word.text! + " Your Answer: " + (sender.titleLabel?.text)! )
            wrongAnswer3.append("f")
            //sender.titleLabel?.text
           print(wrongAnswer2)
        }
        
        //}
        for i in 1...4
        {
             but = arrayButton[i-1]
            //self.but.isEnabled = = false
        but.isEnabled = false
        
        //Timer.scheduledTimer(timeInterval: 30 , target: self, selector: #selector(ViewController.enable), userInfo: nil, repeats: false)
        }
        Timer.scheduledTimer(timeInterval: 0.5 , target: self, selector: #selector(ViewController.enable), userInfo: nil, repeats: false)
        if(currentWord != currentList)
        {
        newWord()
        }
        else
        {
            performSegue(withIdentifier: "show", sender: self)
        }
    }
    func enable() {
        for i in 1...4
        {
            but = arrayButton[i-1]
            //self.but.isEnabled = = false
            
             self.but.isEnabled = true
            //Timer.scheduledTimer(timeInterval: 30 , target: self, selector: #selector(ViewController.enable), userInfo: nil, repeats: false)
        }

       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //currentList = whichDictionary()
        let ScoreView :ScoreViewController = segue.destination as! ScoreViewController
        let scoreText = "\(score)"
        let maxScore = "\(currentList)"
        ScoreView.scoreLabel = (scoreText + "/" + maxScore)
        ScoreView.wrongAnswer = wrongAnswer2
        ScoreView.wrongAnswer2 = wrongAnswer3
    }
    
    func whichDictionary()
    {
        
        
        for i in 0...counter
        {
           /* var keys = listD.allKeys as Array
            var unsignedArrayCount = UInt32(keys.count)
            var unsignedRandomNumber = arc4random_uniform(unsignedArrayCount)
            var randomNumber = Int(unsignedRandomNumber)
            var randomKey = keys[randomNumber] as! String
           
            //list = list[randomKey[listD[randomKey]!]]
            print(listD[randomKey]!)
            let index: Int = Int(arc4random_uniform(UInt32(listD.count - 1)))
            let randomVal = Array(listD.allValues)[index]
            let randomKey = Array(listD.allKeys)[index]
            //list[i][0] = listD[index][0] as Any?
            print("work")
            key[i] = listD.allKeys[index] as! String
            value[i] = [listD.allValues[index] as! Array<[String]> as! String]
            currentList = counter*/
           
        }
        
            key = listD.allKeys as! [String]
            value = listD.allValues as! Array<[String]>
            currentList = listD.count
           
    
    }
    override func viewDidAppear(_ animated: Bool)
    {
        newWord()
        
            }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        whichDictionary()
        
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that cand be recreated.
    }
    func newWord ()
{
    Word.text = key[currentWord]
    trueAnswer = arc4random_uniform(3)+1
    
    
     //trueAnswerLabel = Word.text!
    var x = 0
    var rnd = randNumber()
   
    for i in 1...4
    {
        button = view.viewWithTag(i) as! UIButton
        arrayButton.append(button)
       
        if (i == Int(trueAnswer))
        {
            button.setTitle(value[currentWord][0], for: .normal)
           // print(button.titleLabel?.text)
        }
        else
        {
            let rndAnswer = rnd[x]
            let intRandAns:Int = Int(rndAnswer)
            button.setTitle(value[intRandAns][0], for: .normal)
            wrongAnswer = [value[intRandAns][0]]
            x += 1
        }
        
        //button.setTitle(value[currentWord][x], for: .normal)
    }
    print(arrayButton)
    currentWord += 1
    }
    func randNumber()-> Array <Int>
        {
            var randAns:Array<Int> = []
           
            for i in 1...3{
                if i <= 3
                {
            rndAns = arc4random_uniform(UInt32(currentList))
                randAns.append(Int(rndAns))
                
                }
            }
            if randAns[0] != randAns[1] && randAns[0] != randAns[2] && randAns[1] != randAns[2] && randAns[0] != currentWord && randAns[1] != currentWord && randAns[2] != currentWord
            {
                
                return randAns
            }
            else
            {
               
                return randNumber()
            }
    

    }
}



