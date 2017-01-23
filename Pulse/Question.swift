//
//  Question.swift
//  Pulse
//
//  Created by Ian Kumar Mukherjee on 3/1/16.
//  Copyright © 2016 Ian Kumar Mukherjee. All rights reserved.
//

import UIKit

class Question {
    var question: String
    
    init?(question: String) {
        self.question = question
    
    if question.isEmpty {
            return nil
        }
    }
}
