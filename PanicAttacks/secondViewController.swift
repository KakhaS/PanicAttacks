//
//  secondViewController.swift
//  PanicAttacks
//
//  Created by Kakha Sepashvili on 19.01.21.
//

import UIKit

//    var tuple: [(title: String, note: String)] = []



class secondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CreateNoteDelegate {
    private var IDgenerator: Int = 0
    var notes: [NoteItem] = []
    
    func getNewId() -> Int {
        IDgenerator += 1
        return IDgenerator
    }
    
    @IBOutlet var table: UITableView!
    @IBOutlet var label : UILabel!
    

    
        func createNote(_ note: NoteItem) {
            let note = note
            if note.ID < 0 {
                note.ID = self.getNewId()
                self.notes.append(note)
            }
            self.table.isHidden = false
            self.label.isHidden = true
            self.table.reloadData()
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = notes[indexPath.row].title
        cell.detailTextLabel?.text = notes[indexPath.row].note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let note = notes[indexPath.row]
        editOrCreateNote(pageTitle: "Note", note: note)
    }
    
  // ნოუთის წაშლა
    
    func deleteNote(indexPath: IndexPath) {
        notes.remove(at: indexPath.row)
        table.deleteRows(at: [indexPath], with: .fade)
    }
    
     func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteACtion = UIContextualAction.init(style: .destructive, title: "წაშალე") { (Action, View, complition) in
            self.deleteNote(indexPath: indexPath)
        }
        
        //ediT დროს თითის გასმა
        
    let editAction = UIContextualAction.init(style: .normal, title: "Edit") { (_, _, _) in
        let note = self.notes[indexPath.row]
        self.editOrCreateNote(pageTitle: "Note", note: note)
    }
   return  UISwipeActionsConfiguration(actions: [editAction, deleteACtion])
}

//    var createdNotes: [(title: String, note: String)] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        
        title = "დღიური"
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Edit", style: UIBarButtonItem.Style.plain, target: self, action: #selector(didTapNewNote))
        
    }
    
    //ახალი ნოუთის დამატება
    @IBAction func didTapNewNote() {
editOrCreateNote(pageTitle: "ახალი ნოუთი", note: nil)
    }
    
    func editOrCreateNote(pageTitle: String, note: NoteItem?){
        
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? CreateViewController else {return}
        vc.note = note
        vc.title = pageTitle
        vc.delegate = self
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = {note in
        }
        vc.completion = createNote
        navigationController?.pushViewController(vc, animated: true)
    }
}

