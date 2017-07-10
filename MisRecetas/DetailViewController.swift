//
//  DetailViewController.swift
//  MisRecetas
//
//  Created by Usuario on 19/06/17.
//  Copyright © 2017 Rafael Torres. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var recipeImage: UIImageView!
    
    @IBOutlet var nameRecipe: UILabel!
    

    var recipe : Recipe!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.recipeImage.image = self.recipe.image
        self.nameRecipe.text = self.recipe.name
        
    }
    
   // override func didReceiveMemoryWarning() {
   //     super.didReceiveMemoryWarning()
   //     // Dispose of any resources that can be recreated.
   // }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func close(segue:UIStoryboardSegue){
        
    
    }
    
    
    
}

    
    extension DetailViewController : UITableViewDataSource{
    
        func numberOfSections(in tableView: UITableView) -> Int{
            return 3
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            switch section {
            case 0:
                return 3
            case 1:
                return self.recipe.ingredients.count
            case 2:
                return self.recipe.steps.count
            default:
                return 0
            }
        }
        
        
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailViewCell
        
           
            switch indexPath.section {
            case 0:
                switch indexPath.row {
                case 0:
                    cell.keyLabel.text = "Nombre:"
                    cell.valueLabel.text = self.recipe.name
                case 1:
                    cell.keyLabel.text = "Tiempo:"
                    cell.valueLabel.text = "\(self.recipe.time!)min"
                case 2:
                    cell.keyLabel.text = "Favorita:"
                    
                    if self.recipe.isFavourite {
                        cell.valueLabel.text = "Si"
                    }else{
                        cell.valueLabel.text = "No"
                    }
                default:
                    break
                }
            case 1:
                if indexPath.row == 0 {
                    cell.keyLabel.text = "Ingredientes:"
                } else {
                    cell.keyLabel.text = ""
                }
                cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
                
            case 2:
                if indexPath.row == 0 {
                    cell.keyLabel.text = "Pasos:"
                } else {
                   cell.keyLabel.text = ""
                }
                cell.valueLabel.text = self.recipe.steps[indexPath.row]
            default:
                break
            }
            
            
            return cell
        }
    
    }
    
    
    extension DetailViewController : UITableViewDelegate {
    
    
    
    }



















