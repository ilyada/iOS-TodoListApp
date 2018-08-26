//
//  AddNewNote.swift
//  ToDoListApp
//
//  Created by Berdil İlyada Karacam on 23.08.2018.
//  Copyright © 2018 Berdil İlyada Karacam. All rights reserved.
//


import UIKit


protocol SendNewNoteProtocol {
    
        func setNewNote(myNote : Note)
    
    }

class AddNewNote: UIViewController {

    var themeColor : String = "white"
    var selectedNote : Note?
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    var delegeteForVC : ViewController?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.


        setThemeColor(color: themeColor)
        setTitleAndDescriptionTexts()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setThemeColor (color : String) {
        
        if color == "red" {
            
            self.view.backgroundColor = UIColor.red
            
        }
        else if color == "green" {
            
            self.view.backgroundColor = UIColor.green
            
        }
        else if color == "blue" {
            
            self.view.backgroundColor = UIColor.blue
            
        }
        else {
            self.view.backgroundColor = UIColor.white
        }
    
    }

    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        
        guard let _ = selectedNote else  {

        let newNote = Note()
        newNote.title = txtTitle.text
        newNote.description = txtDescription.text
        
        delegeteForVC?.setNewNote(myNote: newNote)
        
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
        
        return
        }
        
        
        selectedNote?.title = txtTitle.text
        selectedNote?.description = txtDescription.text
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    func setTitleAndDescriptionTexts () {
        
        txtTitle.text = selectedNote?.title
        txtDescription.text = selectedNote?.description
        
        guard let _ = selectedNote else  { return }
        addButton.setTitle("Set", for: .normal)
        self.title = "Set Your Note "
 
    }
 
    
    
    

}


