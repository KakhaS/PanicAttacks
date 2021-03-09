//
//  NoteItem.swift
//  PanicAttacks
//
//  Created by Kakha Sepashvili on 24.01.21.
//

import Foundation
import UIKit

class NoteItem {
    var title: String
    var note: String
    var ID: Int
    
    init(title: String, note: String, ID: Int) {
        self.title = title
        self.note = note
        self.ID = ID
    }
}
