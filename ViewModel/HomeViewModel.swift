//
//  HomeViewModel.swift
//  PlanMyTrip
//
//  Created by Milana Shakhbieva on 21.10.2024.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var destinations: [Destination] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchDestinations()
    }
    
    private func fetchDestinations() {
            destinations = [
                Destination(name: "Париж", description: "Столица Франции",
                            imageUrl: URL(string: "https://7d9e88a8-f178-4098-bea5-48d960920605.selcdn.net/6311e6de-da61-4882-ad6b-4f1c7f068fed/")),
                Destination(name: "Рим", description: "Столица Италии",
                            imageUrl: URL(string: "https://media.istockphoto.com/id/539115110/ru/%D1%84%D0%BE%D1%82%D0%BE/%D0%BA%D0%BE%D0%BB%D0%B8%D0%B7%D0%B5%D0%B9-%D0%B2-%D1%80%D0%B8%D0%BC%D0%B5-%D0%B8%D1%82%D0%B0%D0%BB%D0%B8%D1%8F-%D1%83%D1%82%D1%80%D0%B5%D0%BD%D0%BD%D0%B5%D0%B5-%D1%81%D0%BE%D0%BB%D0%BD%D1%86%D0%B5.jpg?s=1024x1024&w=is&k=20&c=FcNRVbDud3wE9lTlrJVeV3371WMP8yj5IK-aBRG6tq0=")),
                Destination(name: "Париж", description: "Столица Франции",
                            imageUrl: URL(string: "https://7d9e88a8-f178-4098-bea5-48d960920605.selcdn.net/6311e6de-da61-4882-ad6b-4f1c7f068fed/")),
                Destination(name: "Рим", description: "Столица Италии",
                            imageUrl: URL(string: "https://media.istockphoto.com/id/539115110/ru/%D1%84%D0%BE%D1%82%D0%BE/%D0%BA%D0%BE%D0%BB%D0%B8%D0%B7%D0%B5%D0%B9-%D0%B2-%D1%80%D0%B8%D0%BC%D0%B5-%D0%B8%D1%82%D0%B0%D0%BB%D0%B8%D1%8F-%D1%83%D1%82%D1%80%D0%B5%D0%BD%D0%BD%D0%B5%D0%B5-%D1%81%D0%BE%D0%BB%D0%BD%D1%86%D0%B5.jpg?s=1024x1024&w=is&k=20&c=FcNRVbDud3wE9lTlrJVeV3371WMP8yj5IK-aBRG6tq0=")),
                Destination(name: "Париж", description: "Столица Франции",
                            imageUrl: URL(string: "https://7d9e88a8-f178-4098-bea5-48d960920605.selcdn.net/6311e6de-da61-4882-ad6b-4f1c7f068fed/")),
                Destination(name: "Рим", description: "Столица Италии",
                            imageUrl: URL(string: "https://media.istockphoto.com/id/539115110/ru/%D1%84%D0%BE%D1%82%D0%BE/%D0%BA%D0%BE%D0%BB%D0%B8%D0%B7%D0%B5%D0%B9-%D0%B2-%D1%80%D0%B8%D0%BC%D0%B5-%D0%B8%D1%82%D0%B0%D0%BB%D0%B8%D1%8F-%D1%83%D1%82%D1%80%D0%B5%D0%BD%D0%BD%D0%B5%D0%B5-%D1%81%D0%BE%D0%BB%D0%BD%D1%86%D0%B5.jpg?s=1024x1024&w=is&k=20&c=FcNRVbDud3wE9lTlrJVeV3371WMP8yj5IK-aBRG6tq0=")),
                Destination(name: "Париж", description: "Столица Франции",
                            imageUrl: URL(string: "https://7d9e88a8-f178-4098-bea5-48d960920605.selcdn.net/6311e6de-da61-4882-ad6b-4f1c7f068fed/")),
                Destination(name: "Рим", description: "Столица Италии",
                            imageUrl: URL(string: "https://media.istockphoto.com/id/539115110/ru/%D1%84%D0%BE%D1%82%D0%BE/%D0%BA%D0%BE%D0%BB%D0%B8%D0%B7%D0%B5%D0%B9-%D0%B2-%D1%80%D0%B8%D0%BC%D0%B5-%D0%B8%D1%82%D0%B0%D0%BB%D0%B8%D1%8F-%D1%83%D1%82%D1%80%D0%B5%D0%BD%D0%BD%D0%B5%D0%B5-%D1%81%D0%BE%D0%BB%D0%BD%D1%86%D0%B5.jpg?s=1024x1024&w=is&k=20&c=FcNRVbDud3wE9lTlrJVeV3371WMP8yj5IK-aBRG6tq0=")),
                Destination(name: "Париж", description: "Столица Франции",
                            imageUrl: URL(string: "https://7d9e88a8-f178-4098-bea5-48d960920605.selcdn.net/6311e6de-da61-4882-ad6b-4f1c7f068fed/")),
                Destination(name: "Рим", description: "Столица Италии",
                            imageUrl: URL(string: "https://media.istockphoto.com/id/539115110/ru/%D1%84%D0%BE%D1%82%D0%BE/%D0%BA%D0%BE%D0%BB%D0%B8%D0%B7%D0%B5%D0%B9-%D0%B2-%D1%80%D0%B8%D0%BC%D0%B5-%D0%B8%D1%82%D0%B0%D0%BB%D0%B8%D1%8F-%D1%83%D1%82%D1%80%D0%B5%D0%BD%D0%BD%D0%B5%D0%B5-%D1%81%D0%BE%D0%BB%D0%BD%D1%86%D0%B5.jpg?s=1024x1024&w=is&k=20&c=FcNRVbDud3wE9lTlrJVeV3371WMP8yj5IK-aBRG6tq0=")),
                Destination(name: "Париж", description: "Столица Франции",
                            imageUrl: URL(string: "https://7d9e88a8-f178-4098-bea5-48d960920605.selcdn.net/6311e6de-da61-4882-ad6b-4f1c7f068fed/")),
                Destination(name: "Рим", description: "Столица Италии",
                            imageUrl: URL(string: "https://media.istockphoto.com/id/539115110/ru/%D1%84%D0%BE%D1%82%D0%BE/%D0%BA%D0%BE%D0%BB%D0%B8%D0%B7%D0%B5%D0%B9-%D0%B2-%D1%80%D0%B8%D0%BC%D0%B5-%D0%B8%D1%82%D0%B0%D0%BB%D0%B8%D1%8F-%D1%83%D1%82%D1%80%D0%B5%D0%BD%D0%BD%D0%B5%D0%B5-%D1%81%D0%BE%D0%BB%D0%BD%D1%86%D0%B5.jpg?s=1024x1024&w=is&k=20&c=FcNRVbDud3wE9lTlrJVeV3371WMP8yj5IK-aBRG6tq0="))
            ]
        }
    }
