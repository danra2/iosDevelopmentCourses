//
//  PokedexDetailsViewControllerDelegate.swift
//  Pokedex
//
//  Created by Daniel Ra on 7/23/16.
//  Copyright © 2016 Daniel Ra. All rights reserved.
//

import Foundation
protocol PokedexDetailsViewControllerDelegate: class {
    func pokedexDetailsViewController(_ controller: PokedexDetailsViewController, didFinishAddingMission pokemon: String)
    func pokedexDetailsViewController(_ controller: PokedexDetailsViewController, didFinishEditingMission pokemon: String, atIndexPath indexPath: Int)
}
