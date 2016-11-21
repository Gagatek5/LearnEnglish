//
//  MenuViewController.swift
//  LearnEnglish
//
//  Created by Tomasz Twardowski on 05/11/2016.
//  Copyright © 2016 Tomasz Twardowski. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuTitle: UINavigationBar!
    @IBOutlet weak var learnButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var hiNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaults()
        language()
                
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    func language()  {
     
        menuTitle.topItem?.title = Language.s.translate(word: "Menu", scope: nil)
        learnButton.setTitle(Language.s.translate(word: "Learn", scope: nil), for: .normal)
        settingButton.setTitle(Language.s.translate(word: "Settings", scope: nil), for: .normal)
        self.hiNameLabel.text = Language.s.translate(word: "Hi", scope: nil)
    }
    func userDefaults()
    {
        if UserDefaults.standard.value(forKey: "Language") as? String == nil
        {
            UserDefaults.standard.setValue("EN", forKey: "Language")
        }
        if UserDefaults.standard.value(forKey: "userName") != nil
        {
            hiNameLabel.text?.append(UserDefaults.standard.value(forKey: "userName") as! String)
            
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
