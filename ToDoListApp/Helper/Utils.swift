//
//  Utils.swift
//  ToDoListApp
//
//  Created by Berdil İlyada Karacam on 26.08.2018.
//  Copyright © 2018 Berdil İlyada Karacam. All rights reserved.
//

import Foundation

class Utils {
    
    
    //MARK - Add some Notes in my NoteArray
    static func addSomeNotes(noteArray:inout Array<Note>){
        
        let firstNote = Note()
        firstNote.title = "First Note Title"
        firstNote.description = "First Note Description"
        
        let secondNote = Note()
        secondNote.title = "Second Note Title"
        secondNote.description = "Second Note Description"
        
        let thirdNote = Note()
        thirdNote.title = "Third Note Title"
        thirdNote.description = "Third Note Description"
        
        
        noteArray.append(firstNote)
        noteArray.append(secondNote)
        noteArray.append(thirdNote)
        
        
    }
    
    
    
    
}
