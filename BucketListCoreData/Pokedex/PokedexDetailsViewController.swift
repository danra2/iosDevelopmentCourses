//
//  pokedexDetailsViewController.swift
//  Pokedex
//
//  Created by Daniel Ra on 7/23/16.
//  Copyright © 2016 Daniel Ra. All rights reserved.
//

import Foundation
import UIKit

class PokedexDetailsViewController: UITableViewController {
    var pokemonToEdit: String?
    var hideButton = false
    var pokemonToEditIndexPath: Int?
    weak var cancelButtonDelegate: CancelButtonDelegate?
    weak var delegate: PokedexDetailsViewControllerDelegate?
    @IBOutlet weak var newPokemonEntry: UITextField!
    @IBOutlet weak var btnDone: UIBarButtonItem!
    @IBAction func cancelBarButtonPressed(_ sender: UIBarButtonItem) {
        cancelButtonDelegate?.cancelButtonPressedFrom(self)
    }
    @IBAction func doneBarButtonPressed(_ sender: UIBarButtonItem) {
        if newPokemonEntry.text == nil {
            btnDone.isEnabled = false
        }
        if var pokemon = pokemonToEdit {
            pokemon = newPokemonEntry.text!
            delegate?.pokedexDetailsViewController(self, didFinishEditingMission: pokemon, atIndexPath: pokemonToEditIndexPath!)
        } else { // we are adding so run the "didFinishAddingMission" method
            let pokemon = newPokemonEntry.text!
            delegate?.pokedexDetailsViewController(self, didFinishAddingMission: pokemon)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newPokemonEntry.text = pokemonToEdit
    }
}
