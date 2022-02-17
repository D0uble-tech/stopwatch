//
//  ViewController.swift
//  StopWatch
//
//  Created by Motonari Sakuma on 2022/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()
    
    @IBOutlet var hanteiLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @objc func up() {
        //countを0.01足していく
        count = count + 0.01
        //ラベルに小数点以下２桁まで表示
        label.text = String(format: "%.2f", count)
    }
    
    @IBAction func start(){
        if !timer.isValid{
            //タイマーが動作しなかったら以下の指示を動かす
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
            )
        }
        hanteiLabel.text = ""
    }
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
        }
        //hentaiメソッドを呼び出して、結果を表示する
        self.hantei()
    }
    func hantei(){
        if count == 10.00{
            hanteiLabel.text = "PERFECT!"
        }else if count > 9.00 && count < 10.20{
            hanteiLabel.text = "Oshii"
        }
    }
    
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
        }
        count = 0.0
        label.text = String(format: "%.2f", count)
    }
}

