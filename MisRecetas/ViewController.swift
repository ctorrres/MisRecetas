//
//  ViewController.swift
//  MisRecetas
//
//  Created by Usuario on 01/06/17.
//  Copyright © 2017 Rafael Torres. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UITableViewController {
    
    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var recipe = Recipe(name: "Tortillas de patatas",
                          imageName: "A.png",
                          time: 20,
                          ingredients: ["Patatas","Huevo","Cebolla"],
                          steps: ["Pelar patatas y cebollas",
                                  "Costar las patatas y cebolla",
                                  "Batir los huevos e iniciar cuesión",
                                  "Djat a 35 grados de temperatura"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza margarita",
                       imageName: "B.png",
                       time: 60,
                       ingredients: ["Queso", "Tomate", "Albaca", "Peperoni"],
                       steps: ["Abrir la pasta",
                               "Agregar a pasta la salsa",
                               "Agregar quesos",
                               "Agregar condimentos y albaca",
                               "Meter a Horno por 8 minutos"])
        recipes.append(recipe)
        
        
        recipe = Recipe(name: "Haburguesa con queso",
                       imageName: "C.png",
                       time: 38,
                       ingredients:["Hamburguesa", "Pan al Corte", "Lechuga", "Gitomate", "Queso"],
                       steps:["Azar la carne con termino 3/4",
                              "Agregar al pan condimentos",
                              "Agregar carne y salsa",
                              "Agregar rodajas de verdura"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Ensalda César",
                       imageName:"D.png",
                       time: 25,
                       ingredients:["Lechuga","Aderezo","Pepinos", "Gitomate"],
                       steps:["Picar las lechugas",
                              "Picar verdura",
                              "revolver y aderezar"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Paella",
                        imageName:"E.png",
                        time: 65,
                        ingredients:["Arroz","Mariscos","Azafran", "Sal"],
                        steps:["Coser el arroz",
                               "Colocar los Mariscos",
                               "Colocar el azafran",
                               "Agregar Especias al gusto"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Mole Poblano",
                        imageName:"F.png",
                        time: 48,
                        ingredients:["Piloncillo","Chile","Ccahuate", "Chocolate", "Canela"],
                        steps:["Se tuesta la Tortilla",
                               "Se tuesta la Canela",
                               "Se tuesta y muele ajonjolin",
                               "A fuejo lento se cuese"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Tacos de Pastor",
                        imageName:"G.png",
                        time: 48,
                        ingredients:["Pastor","Piña","Tortillas", "Salsa"],
                        steps:["Se cose la carne",
                               "Se revana y se coloca en la tortilla",
                               "Se agrega la piña",
                               "Se agrega salsa al gusto"])
        recipes.append(recipe)
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Para ocultar la barra del head del celular
    override var prefersStatusBarHidden: Bool{
        return true
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        
        cell.thumbnailImageView.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = "\(recipe.time!) min"   // ! quitar la posibilidad de ser opcional
        cell.ingredientsLabel.text = "Ingredientes : \(recipe.ingredients.count)"
        
        // Hacer la vista de las imagenes circular
        //cell.thumbnailImageView.layer.cornerRadius = 42.0
        //cell.thumbnailImageView.clipsToBounds = true
        
        if recipe.isFavourite{
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        self.recipes.remove(at: indexPath.row)
        }
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        //self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //Compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            let shareDefaultText = "Me gusta esta receta \(self.recipes[indexPath.row].name) en la app iOS 10"
            let activityController = UIActivityViewController(activityItems: [[shareDefaultText], self.recipes[indexPath.row].image!], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        
        // Borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Borrar") { (action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        deleteAction.backgroundColor = UIColor(red: 2020.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
        return [shareAction, deleteAction]
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        /* Comentar Codigo popup de favorito
        // print("selecciono el numero \(indexPath.row)")
        let recipe = self.recipes[indexPath.row]
        let alertController = UIAlertController(title: recipe.name, message:"Valora esta receta", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title:"Cancelar", style: .cancel, handler: nil)
        
        var favoriteActionTitle = "Favorito"
        var favoriteActionStyle = UIAlertActionStyle.default
        if recipe.isFavourite{
            favoriteActionTitle = "No Favorito"
            favoriteActionStyle = UIAlertActionStyle.destructive
        }
        
        let favouriteAction = UIAlertAction(title: favoriteActionTitle, style: favoriteActionStyle){ (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavourite = !recipe.isFavourite
            self.tableView.reloadData()
        }
        
        alertController.addAction(favouriteAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)*/
    
    
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
               let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
                
                
            }
        
        }
    }
 
}















