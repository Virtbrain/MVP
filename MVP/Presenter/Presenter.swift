//
//  Presenter.swift
//  MVP
//
//  Created by Alexey Manankov on 26.08.2023.
//

protocol GreetingPresenter {
    init(view: GreetingView, person: Person)
    func showGreeting()
}

class Presenter: GreetingPresenter {
    unowned let view: GreetingView
    let person: Person
    
    required init(view: GreetingView, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = "Hello" + " " + self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting)
    }
}
