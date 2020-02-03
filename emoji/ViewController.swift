//
//  ViewController.swift
//  emoji
//
//  Created by Dhruvil on 1/28/20.
//  Copyright © 2020 Dhruvil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var emojiTextfield: UITextField!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button16: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button11: UIButton!
    
    var emojis:[String] = []
    var count = 0
    var setTimer: Timer?
    var selectedEmoji: String = ""
    var defaulEmoji:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adjustingButtonFont()
        fetchEmojiFromServer()
    }
    
    func fetchEmojiFromServer()
    {
        let session = URLSession.shared
        guard let url = URL(string: "https://emojigenerator.herokuapp.com/emojis/api/v1?count=16") else { return }
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            guard error == nil else
            {
                for element in 0x1F601...0x1F610 {
                    self.defaulEmoji.append(String(UnicodeScalar(element) ?? "-"))
                }
                DispatchQueue.main.async {
                    self.emojis = self.defaulEmoji
                    self.labelingEmoji()
                }
                return
            }
            do
            {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                let jsonArray: NSDictionary = json as! NSDictionary
                let convertJson = jsonArray["emojis"] as! NSArray
                for element in convertJson
                {
                    self.emojis.append(element as! String)
                }
                DispatchQueue.main.async {
                    self.labelingEmoji()
                }
            } catch
            {
                print("JSON error: \(error.localizedDescription)")
            }
        })
        task.resume()
    }
    
    @IBAction func calculateButtonClicked(_ sender: Any) {
        stopTimer()
    }
    
    
    func timer()
    {
       setTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fire), userInfo: nil, repeats: true)
    }
    
    @objc func fire()
    {
        count = count + 1
    }
    
    func stopTimer()
    {
        setTimer?.invalidate()
        answer.text = String((selectedEmoji.count * 60) / count)
    }
    
    
    
    @IBAction func button1Clicked(_ sender: Any) {
        selectedEmoji = selectedEmoji + emojis[0]
        emojiTextfield.text = selectedEmoji
        if setTimer == nil
        {
            timer()
        }
    }
    
    @IBAction func button2Clicked(_ sender: Any) {
        selectedEmoji = selectedEmoji + emojis[1]
        emojiTextfield.text = selectedEmoji
        if setTimer == nil
        {
            timer()
        }
    }
    
    @IBAction func button3Clicked(_ sender: Any) {
        selectedEmoji = selectedEmoji + emojis[2]
        emojiTextfield.text = selectedEmoji
        if setTimer == nil
        {
            timer()
        }
    }
    
    @IBAction func button4Clicked(_ sender: Any) {
        selectedEmoji = selectedEmoji + emojis[3]
        emojiTextfield.text = selectedEmoji
        if setTimer == nil
        {
            timer()
        }
    }

    @IBAction func button5Clicked(_ sender: Any) {
        selectedEmoji = selectedEmoji + emojis[4]
        emojiTextfield.text = selectedEmoji
        if setTimer == nil
        {
            timer()
        }
    }
    
    @IBAction func button6Clicked(_ sender: Any) {
        selectedEmoji = selectedEmoji + emojis[5]
        emojiTextfield.text = selectedEmoji
        if setTimer == nil
        {
            timer()
        }
    }
    
    @IBAction func button7Clicked(_ sender: Any) {
        selectedEmoji = selectedEmoji + emojis[6]
        emojiTextfield.text = selectedEmoji
        if setTimer == nil
        {
            timer()
        }
    }
    
    @IBAction func button8Clicked(_ sender: Any) {
        selectedEmoji = selectedEmoji + emojis[7]
        emojiTextfield.text = selectedEmoji
        if setTimer == nil
        {
            timer()
        }
    }
    
    @IBAction func button9Clicked(_ sender: Any) {
        selectedEmoji = selectedEmoji + emojis[8]
        emojiTextfield.text = selectedEmoji
        if setTimer == nil
        {
            timer()
        }
    }
    
    @IBAction func button10Clicked(_ sender: Any) {
        selectedEmoji = selectedEmoji + emojis[9]
        emojiTextfield.text = selectedEmoji
        if setTimer == nil
        {
            timer()
        }
    }
    
    @IBAction func button11Clicked(_ sender: Any) {
        selectedEmoji = selectedEmoji + emojis[10]
        emojiTextfield.text = selectedEmoji
        if setTimer == nil
        {
            timer()
        }
    }
    
    @IBAction func button12Clicked(_ sender: Any) {
        selectedEmoji = selectedEmoji + emojis[11]
        emojiTextfield.text = selectedEmoji
        if setTimer == nil
        {
            timer()
        }
    }
    
    @IBAction func button13Clicked(_ sender: Any) {
        selectedEmoji = selectedEmoji + emojis[12]
        emojiTextfield.text = selectedEmoji
        if setTimer == nil
        {
            timer()
        }
    }
    
    @IBAction func button14Clicked(_ sender: Any) {
        selectedEmoji = selectedEmoji + emojis[13]
        emojiTextfield.text = selectedEmoji
        if setTimer == nil
        {
            timer()
        }
    }
    
    @IBAction func button15Clicked(_ sender: Any) {
        selectedEmoji = selectedEmoji + emojis[14]
        emojiTextfield.text = selectedEmoji
        if setTimer == nil
        {
            timer()
        }
    }
    
    @IBAction func button16Clicked(_ sender: Any) {
        selectedEmoji = selectedEmoji + emojis[15]
        emojiTextfield.text = selectedEmoji
        if setTimer == nil
        {
            timer()
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        selectedEmoji = String(selectedEmoji.dropLast())
        emojiTextfield.text = selectedEmoji
    }
    
    func convertingEmoji()
    {
        emojis[0] = String(UnicodeScalar(emojis[0]) ?? "-")
        emojis[1] = String(UnicodeScalar(emojis[1]) ?? "-")
    }
    
    func labelingEmoji()
    {
        button1.setTitle(emojis[0], for: .normal)
        button2.setTitle(emojis[1], for: .normal)
        button3.setTitle(emojis[2], for: .normal)
        button4.setTitle(emojis[3], for: .normal)
        button5.setTitle(emojis[4], for: .normal)
        button6.setTitle(emojis[5], for: .normal)
        button7.setTitle(emojis[6], for: .normal)
        button8.setTitle(emojis[7], for: .normal)
        button9.setTitle(emojis[8], for: .normal)
        button10.setTitle(emojis[9], for: .normal)
        button11.setTitle(emojis[10], for: .normal)
        button12.setTitle(emojis[11], for: .normal)
        button13.setTitle(emojis[12], for: .normal)
        button14.setTitle(emojis[13], for: .normal)
        button15.setTitle(emojis[14], for: .normal)
        button16.setTitle(emojis[15], for: .normal)
    }
    
    func adjustingButtonFont()
    {
        button1.titleLabel?.adjustsFontSizeToFitWidth = true
        button2.titleLabel?.adjustsFontSizeToFitWidth = true
        button3.titleLabel?.adjustsFontSizeToFitWidth = true
        button4.titleLabel?.adjustsFontSizeToFitWidth = true
        button5.titleLabel?.adjustsFontSizeToFitWidth = true
        button6.titleLabel?.adjustsFontSizeToFitWidth = true
        button7.titleLabel?.adjustsFontSizeToFitWidth = true
        button8.titleLabel?.adjustsFontSizeToFitWidth = true
        button9.titleLabel?.adjustsFontSizeToFitWidth = true
        button10.titleLabel?.adjustsFontSizeToFitWidth = true
        button11.titleLabel?.adjustsFontSizeToFitWidth = true
        button12.titleLabel?.adjustsFontSizeToFitWidth = true
        button13.titleLabel?.adjustsFontSizeToFitWidth = true
        button14.titleLabel?.adjustsFontSizeToFitWidth = true
        button15.titleLabel?.adjustsFontSizeToFitWidth = true
        button16.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}

