//
//  Pokedex+CoreDataProperties.swift
//  Pokedex
//
//  Created by Daniel Ra on 7/24/16.
//  Copyright © 2016 Daniel Ra. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Pokedex {

    @NSManaged var pokemonName: String?
    @NSManaged var pokemonLocation: NSNumber?

}
