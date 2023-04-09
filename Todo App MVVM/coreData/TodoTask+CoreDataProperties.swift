//
//  TodoTask+CoreDataProperties.swift
//  Todo App MVVM
//
//  Created by Ayush Santri on 09/04/23.
//
//

import Foundation
import CoreData


extension TodoTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoTask> {
        return NSFetchRequest<TodoTask>(entityName: "TodoTask")
    }

    @NSManaged public var title: String?
    @NSManaged public var detailedTask: String?
    @NSManaged public var priority: Int16

}

extension TodoTask : Identifiable {

}
