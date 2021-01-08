//
//  thirdViewController.swift
//  NewYearApp
//
//  Created by Егор Костюхин on 05.01.2021.
//

import UIKit

class ThirdViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textFieldOutlet: UITextField!
    var gift = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    // MARK: Private Functions
    
    // Нажатие кнопки "Отправить"
    
    private func sendMailButtonPressed() {
        gift = textFieldOutlet.text ?? ""
        guard let text = textFieldOutlet.text else { return }
        if text.count > 0 {
            performSegue(withIdentifier: "sendMailSegue", sender: nil)
        } else {
            showAlert(title: "Не указан желаемый подарок",
                  message: "Напиши, какой подарок ты хочешь получить от Санты?")
        }
    }
    
    // Оповещение
    
    private func showAlert(title: String, message: String) {
                    let alert = UIAlertController(title: title,
                                                  message: message,
                                                  preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(okAction)
                    present(alert, animated: true)
    }
    
    // MARK:

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "sendMailSegue" else { return }
        guard let mailSentVC = segue.destination as? MailSentViewController else { return }
        mailSentVC.gift = gift
    }
    
    // Скрытие клавиатуры тачем в другой части экрана
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // Нажатие кнопки Return на клавиатуре
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldOutlet {
            sendMailButtonPressed()
        }
        return true
    }

    
    // MARK: IB Actions
    
    @IBAction func sendMailButton(_ sender: UIButton) {
        sendMailButtonPressed()
    }
    
    // Возврат на экран "Желание" (ThirdViewController)
    
    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        textFieldOutlet.text = ""
    }
}
