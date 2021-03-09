//
//  CreateViewController.swift
//  PanicAttacks
//
//  Created by Kakha Sepashvili on 24.01.21.
//

import Foundation
import UIKit

protocol CreateNoteDelegate {
    func createNote(_ note: NoteItem)
}

class CreateViewController: UIViewController {

    @IBOutlet var titleField: UITextField!
    @IBOutlet var notetField: UITextView!
    

    public var note: NoteItem?
    public var delegate: CreateNoteDelegate?
    
    public var completion: ((NoteItem) -> Void)?
        
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        
        

        titleField.text = note?.title
        notetField.text = note?.note
       
    }
    
    @objc func didTapSave () {

        if let text = titleField.text, !text.isEmpty, !notetField.text.isEmpty {
            
            let note = self.note ?? NoteItem(title: text, note: notetField.text, ID: -1)
            note.title = text
            note.note = notetField.text
            completion?(note)
            delegate?.createNote(note)
            self.navigationController?.popViewController(animated: true)
        }
    }
}




