//
//  TaskViewController.swift
//  firstProject
//
//  Created by Владислав Баранов on 19.03.2024.
//
import UIKit

var presentAnswer = AnswerViewController()
var currentNumber : Int = 0


class TaskViewController: UIViewController {
    
    
    var currentView = UIView()
    var currentImage = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationController settings
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: ThemeColors.shared.color(for: "text") ?? .red]
        navigationController?.navigationBar.tintColor = ThemeColors.shared.color(for: "text")
        UINavigationBar.appearance().barTintColor = UIColor.white
        title = forGameData[currentNumber].name
        
        
        //view constraints
        view.addSubview(currentView)
        currentView.translatesAutoresizingMaskIntoConstraints = false
        currentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        currentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        currentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        currentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        var backgroundColor = forGameData[currentNumber].color
        backgroundColor = backgroundColor?.withAlphaComponent(0.93)
        currentView.backgroundColor = backgroundColor
        createShowAnswerBtn()
        createImageView()
        
        //statusBar settings
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = ThemeColors.shared.color(for: "background")
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
    }

    
    func createLabels(taskLabelFromTable: Int) {
        currentNumber = taskLabelFromTable
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
        taskLabel.text = forGameData[currentNumber].task
        backForLabelView.addSubview(taskLabel)
        taskLabel.textColor = ThemeColors.shared.color(for: "text")
        taskLabel.font = UIFont.systemFont(ofSize: 20)
       // taskLabel.numberOfLines = 10
       // taskLabel.lineBreakMode = .byWordWrapping
        taskLabel.clipsToBounds = true
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        taskLabel.textAlignment = .justified
        
        NSLayoutConstraint.activate([
            taskLabel.topAnchor.constraint(equalTo: backForLabelView.topAnchor, constant: 16),
            taskLabel.bottomAnchor.constraint(equalTo: backForLabelView.bottomAnchor, constant: -16),
            //taskLabel.topAnchor.constraint(equalTo: backForLabelView.topAnchor, constant: -16),
            
            taskLabel.leftAnchor.constraint(equalTo: backForLabelView.leftAnchor, constant: 16),
            taskLabel.rightAnchor.constraint(equalTo: backForLabelView.rightAnchor, constant: -16),
       //     taskLabel.bottomAnchor.constraint(equalTo:backForLabelView.bottomAnchor, constant: -16)
        ])
        
        taskLabel.isEditable = false
        
        //Осторожно, костыль!
        

        
    }

    
    
    
    func createImageView() {
        //     var imageView = UIImageView()
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
    }
    
    func createShowAnswerBtn() {
        let showAnswerButton = UIButton()
        currentView.addSubview(showAnswerButton)
        showAnswerButton.setTitle("Показать ответ", for: .normal)
        showAnswerButton.setTitleColor(ThemeColors.shared.color(for: "previewText"), for: .normal) // Добавить эту строку
//        showAnswerButton.backgroundColor =  UIColor(red: 255, green: 255, blue: 255, alpha: 50)
        showAnswerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showAnswerButton.bottomAnchor.constraint(equalTo: currentView.bottomAnchor, constant: -16),
            showAnswerButton.centerXAnchor.constraint(equalTo: currentView.centerXAnchor),
            showAnswerButton.widthAnchor.constraint(equalToConstant: 200),
            showAnswerButton.heightAnchor.constraint(equalToConstant: 200),
            showAnswerButton.centerXAnchor.constraint(equalTo: currentView.centerXAnchor)
            ]
        )
        
        showAnswerButton.addTarget(self, action: #selector(showAnswerFunc), for: .touchUpInside)
    }
    
    
    @objc func showAnswerFunc() {
        presentAnswer = AnswerViewController()
        presentAnswer.createLabels(taskLabelFromTable: currentNumber)
        navigationController?.pushViewController(presentAnswer, animated: true)
    }
}


