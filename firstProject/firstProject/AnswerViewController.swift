//
//  TaskViewController.swift
//  firstProject
//
//  Created by Владислав Баранов on 19.03.2024.
//
import UIKit

class AnswerViewController: UIViewController {
    
    
    var currentNumber : Int = 0
   // let update = UINavigationController(rootViewController: mainView)
    
    
    var compliteButton = UIButton()
    
    override func viewDidLoad() {
        print("creating answer")
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ThemeColors.shared.color(for: "text") ?? ""]
        navigationController?.navigationBar.tintColor = ThemeColors.shared.color(for: "text")
        title = forGameData[currentNumber].name
        view.addSubview(currentView)
        currentView.translatesAutoresizingMaskIntoConstraints = false
        currentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        currentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        currentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        currentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        currentView.backgroundColor = forGameData[currentNumber].color
        compliteButton = createCompliteButton()
        currentView.addSubview(compliteButton)
        compliteButton.setTitleColor(ThemeColors.shared.color(for: "previewText"), for: .normal)
        
        compliteButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            compliteButton.bottomAnchor.constraint(equalTo: currentView.bottomAnchor, constant: -16),
            compliteButton.centerXAnchor.constraint(equalTo: currentView.centerXAnchor),
            compliteButton.widthAnchor.constraint(equalToConstant: 200),
            compliteButton.heightAnchor.constraint(equalToConstant: 200),
            compliteButton.centerXAnchor.constraint(equalTo: currentView.centerXAnchor)
            ])
        
        createImageView()
        
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = ThemeColors.shared.color(for: "background")
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
        
        
        let image = UIImageView(image: forGameData[currentNumber].image)
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.rightAnchor.constraint(equalTo: currentView.leftAnchor, constant: -16),
            image.leftAnchor.constraint(equalTo: currentView.leftAnchor, constant: 16),
            image.topAnchor.constraint(equalTo: currentView.topAnchor, constant: 80),
            image.centerXAnchor.constraint(equalTo: currentView.centerXAnchor),
            image.bottomAnchor.constraint(equalTo: currentView.centerYAnchor)
        ])
        currentImage = image
        
            let taskLabel = UITextView()
            let backForLabelView = UIView()
            currentView.addSubview(backForLabelView)
            backForLabelView.backgroundColor = ThemeColors.shared.color(for: "background")
            backForLabelView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                backForLabelView.centerXAnchor.constraint(equalTo: currentView.centerXAnchor),
                backForLabelView.topAnchor.constraint(equalTo: currentView.centerYAnchor, constant: 32),
                backForLabelView.leftAnchor.constraint(equalTo: currentView.leftAnchor, constant: 16),
                backForLabelView.rightAnchor.constraint(equalTo: currentView.rightAnchor, constant: -16),
                backForLabelView.heightAnchor.constraint(equalToConstant: 240)
            ])
            
            backForLabelView.layer.cornerRadius = 20
            backForLabelView.clipsToBounds = true
            //label settings
            taskLabel.text = forGameData[currentNumber].answer
            backForLabelView.addSubview(taskLabel)
            taskLabel.textColor = ThemeColors.shared.color(for: "text")
            taskLabel.font = UIFont.systemFont(ofSize: 20)
           // taskLabel.numberOfLines = 10
           // taskLabel.lineBreakMode = .byWordWrapping
            taskLabel.clipsToBounds = true
            taskLabel.translatesAutoresizingMaskIntoConstraints = false
            taskLabel.textAlignment = .justified
            taskLabel.isEditable = false
            NSLayoutConstraint.activate([
                taskLabel.topAnchor.constraint(equalTo: backForLabelView.topAnchor, constant: 16),
                taskLabel.bottomAnchor.constraint(equalTo: backForLabelView.bottomAnchor, constant: -16),
                //taskLabel.topAnchor.constraint(equalTo: backForLabelView.topAnchor, constant: -16),
                
                taskLabel.leftAnchor.constraint(equalTo: backForLabelView.leftAnchor, constant: 16),
                taskLabel.rightAnchor.constraint(equalTo: backForLabelView.rightAnchor, constant: -16),
           //     taskLabel.bottomAnchor.constraint(equalTo:backForLabelView.bottomAnchor, constant: -16)
            ])
            
            
            //Осторожно, костыль!
            

            
        }


    
    
    
    var currentView = UIView()
    var currentImage = UIImageView()
    
    func createLabels(taskLabelFromTable: Int) {
        currentNumber = taskLabelFromTable

    }
    
    
    func createImageView() {
        //     var imageView = UIImageView()
    }
    
    func createCompliteButton() -> UIButton {
        let compliteButton = UIButton()
  //      currentView.addSubview(showAnswerButton)
        compliteButton.setTitleColor(.black, for: .normal) // Добавить эту строку
            print("currentNumberOfName")
        if forGameData[currentNumber].checked == false { //если загадка не разгадана
            compliteButton.setTitle("Загадка разгадана", for: .normal)
            compliteButton.addTarget(self, action: #selector(yesNoComplite), for: .touchUpInside)
        } else {
            compliteButton.setTitle("Загадка не разгадана", for: .normal)
            compliteButton.addTarget(self, action: #selector(yesNoSetNoComplite), for: .touchUpInside)
        }
        return compliteButton
    }
    
    @objc func yesNoComplite() {
        setToComplite(currentData: currentNumber)
        compliteButton.setTitle("Загадка не разгадана", for: .normal)
        compliteButton.removeTarget(self, action: #selector(yesNoComplite), for: .touchUpInside)
        compliteButton.addTarget(self, action: #selector(yesNoSetNoComplite), for: .touchUpInside)
        navigationController?.popViewController(animated: true)
        navigationController?.popViewController(animated: true)
        mainView.forReloadData()
    }
    
    @objc func yesNoSetNoComplite() {
        setToUncomplite(currentData: currentNumber)
      //  forGameData[currentNumber].checked = false
        compliteButton.removeTarget(self, action: #selector(yesNoSetNoComplite), for: .touchUpInside)
        compliteButton.addTarget(self, action: #selector(yesNoComplite), for: .touchUpInside)
        compliteButton.setTitle("Загадка разгадана", for: .normal)
      //  presentAnswer.currentView.reloadData()
        mainView.forReloadData()
        
        // Implement the function
    }
    
    
}
