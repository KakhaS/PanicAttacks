//
//  CreateViewController.swift
//  PanicAttacks
//
//  Created by Kakha Sepashvili on 24.01.21.
//

import UIKit

protocol CreateNoteDelegate {
    func createNote(_ note: NoteItem)
}

class CreateViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var noteField: UITextView!
    @IBOutlet weak var noteField2: UITextView!
    @IBOutlet weak var noteField3: UITextView!
    var placeHolder: UILabel!
    var placeHolder2: UILabel!
    var placeHolder3: UILabel!
    
    public var note: NoteItem?
    public var delegate: CreateNoteDelegate?
    public var completion: ((NoteItem) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.becomeFirstResponder()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        titleField.text = note?.title
        noteField.text = note?.note
        noteField2.text = note?.note2
        noteField3.text = note?.note3
    
        //notefield ის ფონური ტექსტი
        noteField.delegate = self
        placeHolder = UILabel()
        placeHolder.numberOfLines = 5
        placeHolder.text = "(აქ ჩაწერე): როდესაც რაღაც მოხდა... [მაგალითად: როდესაც თანამშრომელმა გადამოაგდო ჭიქა...] "
        placeHolder.frame = CGRect(x: 350, y: 300, width: 400, height: 3000)
        placeHolder.numberOfLines = 3
        placeHolder.sizeToFit()
        noteField.addSubview(placeHolder)
        placeHolder.frame.origin = CGPoint(x: 5, y: (noteField.font?.pointSize)! / 2)
        
        placeHolder.textColor = UIColor.lightGray
        placeHolder.isHidden = !noteField.text.isEmpty
        
        //notefield2 ის ფონური ტექსტი
        noteField2.delegate = self
        placeHolder2 = UILabel()
        placeHolder2.text = "(აქ ჩაწერე): რა იგრძენი... [მაგალითად: ვიგრძენი სუნთქვის აჩქარება და გულში სიმძიმე]"
        placeHolder2.frame = CGRect(x: 650, y: 200, width: 400, height: 3000)
        placeHolder2.numberOfLines = 3
        placeHolder2.sizeToFit()
        noteField2.addSubview(placeHolder2)
        placeHolder2.frame.origin = CGPoint(x: 5, y: (noteField2.font?.pointSize)! / 2)
        placeHolder2.textColor = UIColor.lightGray
        placeHolder2.isHidden = !noteField2.text.isEmpty
        //notefield3 ის ფონური ტექსტი
        noteField3.delegate = self
        placeHolder3 = UILabel()
        placeHolder3.text = "(აქ ჩაწერე): რა იგრძენი (ემოციის სახელი).. [მაგალითად: რასაც ჩვენ ვეძახით ბრაზს]"
        placeHolder3.frame = CGRect(x: 850, y: 300, width: 400, height: 3000)
        placeHolder3.numberOfLines = 4
        placeHolder3.sizeToFit()
        noteField3.addSubview(placeHolder3)
        placeHolder3.frame.origin = CGPoint(x: 5, y: (noteField3.font?.pointSize)! / 2)
        placeHolder3.textColor = UIColor.lightGray
        placeHolder3.isHidden = !noteField3.text.isEmpty
        
        
        
    }
    @objc func didTapSave () {
        if let text = titleField.text, !text.isEmpty, !noteField.text.isEmpty, !noteField2.text.isEmpty, !noteField3.text.isEmpty {
            let note = self.note ?? NoteItem(title: text, note: noteField.text, note2: noteField2.text, note3: noteField3.text, ID: -1)
            note.title = text
            note.note = noteField.text
            note.note2 = noteField2.text
            note.note3 = noteField3.text
            completion?(note)
            delegate?.createNote(note)
            self.navigationController?.popViewController(animated: true)
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        placeHolder.isHidden = !noteField.text.isEmpty
        placeHolder2.isHidden = !noteField2.text.isEmpty
        placeHolder3.isHidden = !noteField3.text.isEmpty
    }
    
}


