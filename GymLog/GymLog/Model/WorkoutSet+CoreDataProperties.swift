//
//  WorkoutSet+CoreDataProperties.swift
//  GymLog
//
//  Created by Вика on 8/29/22.
//
//

import Foundation
import CoreData


extension WorkoutSet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkoutSet> {
        return NSFetchRequest<WorkoutSet>(entityName: "WorkoutSet")
    }

    @NSManaged public var reps: Int64
    @NSManaged public var weight: Int64
    @NSManaged public var workout: Workout?

}

extension WorkoutSet : Identifiable {

}
