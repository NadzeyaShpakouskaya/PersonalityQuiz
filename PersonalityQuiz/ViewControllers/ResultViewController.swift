//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Public properties
    var answers: [Answer]!
    
    // MARK: - Private properties
    private var popularAnimal: Animal = .dog
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false)
        updateUI()
    }
    
    // MARK: - Private methods
    private func defineMostPopularAnimal() {
        var countAnswerDictionary: [Animal: Int] = [:]
        
        for answer in answers {
            if let counter = countAnswerDictionary[answer.animal] {
                countAnswerDictionary[answer.animal] = counter + 1
            } else {
                countAnswerDictionary[answer.animal] = 1
            }
        }
        
        let sortedAnswers = countAnswerDictionary.sorted { $0.1 > $1.1 }
        
        guard let animal = sortedAnswers.first?.key else { return }
        popularAnimal = animal
    }
    
    private func updateUI() {
        defineMostPopularAnimal()
        titleLabel.text = "Вы - \(popularAnimal.rawValue)!"
        descriptionLabel.text = popularAnimal.definition
    }
    
}
