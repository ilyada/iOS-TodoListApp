//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Berdil İlyada Karacam on 23.08.2018.
//  Copyright © 2018 Berdil İlyada Karacam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , SendNewNoteProtocol {

    var itemArray = ["not1","not2","not3"]
    var noteArray = [Note]()
    @IBOutlet weak var tableView: UITableView!
    var backgroundColor : String = "white"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
  
            setNavigationItems()
        
        Utils.addSomeNotes(noteArray : &noteArray)
        
        // to catch long pressed
     
        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
        longPressGesture.minimumPressDuration = 1.0 // 1 second press
        //longPressGesture.delegate = self.de
        self.tableView.addGestureRecognizer(longPressGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setNavigationItems () {
        //   navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add Note", style: .plain, target: self, action: #selector(addNewNote))
        
    }


    
    //MARK -- BACKGROUND COLOR SETTINGS
    @IBAction func backgroundButtonPressed(_ sender: UIButton) {
        
        switch sender.tag {
            
        case 0: //green button pressed
            self.view.backgroundColor = UIColor.green
            tableView.backgroundColor = UIColor.green
            backgroundColor = "green"
            
            
        case 1: //red button pressed
            self.view.backgroundColor = UIColor.red
            tableView.backgroundColor = UIColor.red
            backgroundColor = "red"

        
        case 2: //blue button pressed
            self.view.backgroundColor = UIColor.blue
            tableView.backgroundColor = UIColor.blue
            backgroundColor = "blue"
        
        default:
            self.view.backgroundColor = UIColor.white
            tableView.backgroundColor = UIColor.white
            
            backgroundColor = "white"
        }
          tableView.reloadData()
        
    }
    
    
    
    func setTableViewBackgroundColor(color : String, for cell: UITableViewCell){
        
        switch color {
            
        case "green": //green button pressed
            cell.backgroundColor = UIColor.green
            tableView.backgroundColor = UIColor.green
            
            
        case "red": //red button pressed
            cell.backgroundColor = UIColor.red
            tableView.backgroundColor = UIColor.red
            
            
        case "blue": //blue button pressed
            cell.backgroundColor = UIColor.blue
            tableView.backgroundColor = UIColor.blue
            
        default:
            cell.backgroundColor = UIColor.white
            tableView.backgroundColor = UIColor.white
        }
    }
        
        
        //MARK -- ADD NOTE BUTTON PRESSED
    @objc func addNewNote() {
        
        performSegue(withIdentifier: "addNewNote", sender: self)
        
    }
    
        
        
        //MARK -- PREPARE FOR SEGUES ! - Send Data!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! AddNewNote

        
        if segue.identifier == "addNewNote"  {
            
            
            destinationVC.selectedNote = nil
            
        }
        
        if segue.identifier == "selectedNote" {
            
            destinationVC.selectedNote = sender as? Note
            
        }
        
        destinationVC.delegeteForVC = self
        destinationVC.themeColor = backgroundColor

        
        
    }
    
    
    
    //MARK -- Tableview Datasource Methods
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath as IndexPath)
        cell.textLabel?.text = noteArray[indexPath.row].title
        setTableViewBackgroundColor(color : backgroundColor, for: cell)
        
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
                performSegue(withIdentifier: "selectedNote", sender: noteArray[indexPath.row] )
    }
    
    
    //catch long click on a row for checkmark
    @objc func longPress(_ longPressGestureRecognizer: UILongPressGestureRecognizer) {
        
        if longPressGestureRecognizer.state == UIGestureRecognizerState.began {
            
            //catching long pressed
            
            let touchPoint = longPressGestureRecognizer.location(in: self.tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {

                //get cell
                let cell = tableView.cellForRow(at: indexPath)
                
                if cell?.accessoryType == .checkmark
                {
                    cell?.accessoryType = .none
                }
               
                else
                {
                    cell?.accessoryType = .checkmark
                }
            
            }
        }
    }


    
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            
            // handle delete (by removing the data from your array and updating the tableview)
            noteArray.remove(at: indexPath.row)
            tableView.reloadData()
            
            
            
        }
        
        
    }
        
  
     
     
     
        //MARK -- SET NEW NOTE FROM AddNewNote SEGUE !
        
        func setNewNote(myNote : Note) {
            
            let newNote = myNote
            
            //itemArray.append(newNote.title!)
            noteArray.append(newNote)
            
            tableView.reloadData()
            print("set new note!")
            
        }
    
    
    
  
}

