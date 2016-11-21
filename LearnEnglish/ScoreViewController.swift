//
//  ScoreViewController.swift
//  LearnEnglish
//
//  Created by Tomasz Twardowski on 28/10/2016.
//  Copyright © 2016 Tomasz Twardowski. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var Score: UILabel!
    var scoreLabel = String()
    var wrongAnswer = [String]()
    var wrongAnswer2 = [String]()
    var currentWrongAnswer = " "
    override func viewDidLoad() {
        super.viewDidLoad()
        Score.text = scoreLabel
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return wrongAnswer.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       
        let cell = UITableViewCell(style: .default, reuseIdentifier: "userCell")
        cell.textLabel?.text = wrongAnswer[indexPath.row]
        if wrongAnswer2[indexPath.row] == "t" {
            
            cell.backgroundColor = UIColor.green
        }
        else
        {
           cell.backgroundColor = UIColor.red
           
        }
        return (cell)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        currentWrongAnswer = (selectedCell.textLabel?.text)!

        print(currentWrongAnswer)
        
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
