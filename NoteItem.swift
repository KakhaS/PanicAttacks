//
//  NoteItem.swift
//  PanicAttacks
//
//  Created by Kakha Sepashvili on 29.01.21.
//

import Foundation
import UIKit

class NoteItem {
    var title: String
    var note: String
    var note2: String
    var note3: String
    var ID: Int
    
    init(title: String, note: String, note2: String, note3: String, ID: Int) {
        self.title = title
        self.note = note
        self.note2 = note
        self.note3 = note
        self.ID = ID
    }
}
