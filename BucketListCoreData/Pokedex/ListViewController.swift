//
//  tableViewController.swift
//  Pokedex
//
//  Created by Daniel Ra on 7/22/16.
//  Copyright © 2016 Daniel Ra. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ListViewController: UITableViewController, CancelButtonDelegate, PokedexDetailsViewControllerDelegate {
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
    var pokemonList = [Pokedex]()
    func cancelButtonPressedFrom(_ controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    func fetchAllPokemon() {
        let userRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Pokedex")
        do {
            let results = try managedObjectContext.fetch(userRequest)
            pokemonList = results as! [Pokedex]
        } catch {
            print("\(error)")
        }
    }
    func savePokemon() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
                print("Success")
                fetchAllPokemon()
            } catch {
                print("\(error)")
            }
        }
        tableView.reloadData()
    }
    func pokedexDetailsViewController(_ controller: PokedexDetailsViewController, didFinishAddingMission new_pokemonentry: String) {
        dismiss(animated: true, completion: nil)
        let newPokemon = NSEntityDescription.insertNewObject(forEntityName: "Pokedex", into: managedObjectContext) as! Pokedex
        newPokemon.pokemonName = new_pokemonentry
        savePokemon()
        tableView.reloadData()
    }
    func pokedexDetailsViewController(_ controller: PokedexDetailsViewController, didFinishEditingMission new_pokemonentry: String, atIndexPath indexPath: Int){
        dismiss(animated: true, completion: nil)
        pokemonList[indexPath].pokemonName = new_pokemonentry
        savePokemon()
        tableView.reloadData()
    }
    override func viewDidLoad() {
            let userRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Pokedex")
            do {
                let results = try managedObjectContext.fetch(userRequest)
                pokemonList = results as! [Pokedex]
            } catch {
                print("\(error)")
            }
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditPokemon", sender: tableView.cellForRow(at: indexPath))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")!
       cell.textLabel?.text = pokemonList[indexPath.row].pokemonName
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            let deletepokemon = pokemonList[indexPath.row]
            managedObjectContext.delete(deletepokemon)
            savePokemon()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (sender! as AnyObject).text == nil {
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! PokedexDetailsViewController
            controller.cancelButtonDelegate = self
            controller.delegate = self
            controller.hideButton = true
        } else if (sender! as AnyObject).text != nil{
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! PokedexDetailsViewController
            controller.cancelButtonDelegate = self
            controller.delegate = self
          if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
            controller.pokemonToEdit = pokemonList[indexPath.row].pokemonName
            controller.pokemonToEditIndexPath = indexPath.row
            }
        }
    }
}
