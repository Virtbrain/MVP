//
//  Presenter.swift
//  MVP
//
//  Created by Alexey Manankov on 26.08.2023.
//

protocol PresenterProtocol: AnyObject {
    func showGreeting()
}

class Presenter: PresenterProtocol {
    
    weak var view: GreetingViewProtocol?
    var model: Person?
    
    func showGreeting() {
        guard let firstName = self.model?.firstName else {return}
        guard let lastName = self.model?.lastName else {return}
        let greeting = "Hello \(firstName) \(lastName)"
        self.view?.setGreeting(greeting: greeting)
    }
}
