//
//  ViewController.swift
//  MVP
//
//  Created by Alexey Manankov on 26.08.2023.
//

import UIKit

protocol GreetingViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

class GreetingView: UIViewController {
    
    weak var presenter: PresenterProtocol?
    
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Model View Presenter"
        setupView()
    }
    
    private func setupView() {
        [greetingLabel, showGreetingButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        greetingLabel.font = UIFont.boldSystemFont(ofSize: 25)
        showGreetingButton.backgroundColor = .green
        showGreetingButton.setTitle("Show greeting", for: .normal)
        showGreetingButton.setTitleColor(.black, for: .normal)
        showGreetingButton.setTitleColor(UIColor.init(white: 1, alpha: 0.3), for: .highlighted)
        showGreetingButton.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            greetingLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            showGreetingButton.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 40),
            showGreetingButton.widthAnchor.constraint(equalToConstant: 200),
            showGreetingButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            showGreetingButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        showGreetingButton.addTarget(self, action: #selector(didTapGreetingButton), for: .touchUpInside)
    }
        
    @objc private func didTapGreetingButton() {
        self.presenter?.showGreeting()
    }
}

extension GreetingView: GreetingViewProtocol {
    func setGreeting(greeting: String) {
        greetingLabel.text = greeting
    }
}
