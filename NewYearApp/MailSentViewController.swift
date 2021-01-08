//
//  MailSentViewController.swift
//  NewYearApp
//
//  Created by Егор Костюхин on 05.01.2021.
//

import UIKit

class MailSentViewController: UIViewController {
    
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var paperView: UIView!
    var gift = ""
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let mails = [
            "   Ёлки у меня нет, поэтому положи мой подарок на стол. Не забудь закрыть за собой форточку. На столе лежит коробка конфет - все не ешь. Это мой подарок из садика.\n\n    Ах, да! Хочу \(gift)!",
            "   Поздравляю вас с наступающим Новым годом! Как быстро пролетают годы! Уже 2021 год.\n На этот год я хотела аквариум, куклу и домик для нее, но я окончательно решила: я хочу \(gift)! Ну и, конечно, подарок для Вани. Можно ему машинку? Не большую.\n\n    Ну, в общем все, до свидания!",
            "   Сделай так, чтобы родители меня слушались. Хотя бы в Новый год.\n\n А еще я хочу \(gift)."]
        
        mailLabel.text = mails.randomElement()
        
        paperView.layer.backgroundColor = CGColor(red: 205 / 255, green: 205 / 255, blue: 205 / 255, alpha: 1)
        paperView.layer.shadowColor = UIColor.black.cgColor
        paperView.layer.shadowOpacity = 0.7
        paperView.layer.shadowRadius = 10
        paperView.layer.shadowOffset = .zero
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    } 
}
