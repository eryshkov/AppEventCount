//
//  ViewController.swift
//  AppEventCount
//
//  Created by Evgeniy Ryshkov on 17.03.2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

protocol VCDelegate: class {
    func vcSend(viewController: UIViewController)
}

extension Int{
    subscript(digitIndex: Int) -> Int{//return particular digit
        var decimalBase = 1
        var digitIndex = digitIndex
        while digitIndex > 0 {
            decimalBase *= 10
            digitIndex -= 1
        }
        return (self / decimalBase) % 10
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    var didFinishLaunchingCount = 0
    
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    var didBecomeActiveCount = 0
    
    @IBOutlet weak var willResignActiveLabel: UILabel!
    var willResignActiveCount = 0
    
    @IBOutlet weak var didEnterBackgroundLabel: UILabel!
    var didEnterBackgroundCount = 0
    
    @IBOutlet weak var willTerminateLabel: UILabel!
    var willTerminateCount = 0
    
    @IBOutlet weak var willEnterForegroundLabel: UILabel!
    var willEnterForegroundCount = 0
    
    weak var delegateVC: VCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.viewController = self
        delegateVC = UIApplication.shared.delegate as? VCDelegate
        delegateVC?.vcSend(viewController: self)
        
        updateView()
    }

    func updateView(){
        didFinishLaunchingLabel.text = "За всё время приложение было запущено \(didFinishLaunchingCount) \(decWord(num: didFinishLaunchingCount))"
        didBecomeActiveLabel.text = "Переходов в активное состояние  \(didBecomeActiveCount) \(decWord(num: didBecomeActiveCount)) за текущую сессию"
        willResignActiveLabel.text = "Количество исходов из активного состояния \(willResignActiveCount) \(decWord(num: willResignActiveCount))  за текущую сессию"
        didEnterBackgroundLabel.text = "Переходов в фон \(didEnterBackgroundCount) \(decWord(num: didEnterBackgroundCount))  за текущую сессию"
        willEnterForegroundLabel.text = "Количество выходов из фона \(willEnterForegroundCount) \(decWord(num: willEnterForegroundCount))  за текущую сессию"
        willTerminateLabel.text = "За всё время количество завершений приложения \(willTerminateCount) \(decWord(num: willTerminateCount))"
    }

    func decWord(num: Int) -> String{
        switch (num[1], num[0]) {
        case (0, 2...4):
            return "раза"
        case (2..., 2...4):
            return "раза"
        default:
            return "раз"
        }
    }

}

