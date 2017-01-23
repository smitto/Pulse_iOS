//
//  Post.swift
//  Pulse
//
//  Created by Ian Kumar Mukherjee on 5/11/16.
//  Copyright © 2016 Ian Kumar Mukherjee. All rights reserved.
//

//
//  Post.swift
//  Pulse
//  Not a real .swift class
//  Specifically for UI layout purposes.
//  Created by Ian Kumar Mukherjee on 2/29/16.
//  Copyright © 2016 Ian Kumar Mukherjee. All rights reserved.
//

import UIKit

class Post {
    var answer: String
    
    init?(answer: String) {
        self.answer = answer
        
        if answer.isEmpty {
            return nil
        }
    }
}
