//
//  ViewController.swift
//  Morpion
//
//  Created by Serge Miguet on 28/02/2025.
//

import UIKit

class ViewController: UIViewController {
    var joueur : Int = 0 // le numéro du joueur qui doit jouer
    var tableau : [Int] = Array(repeating: 2, count: 9) // 9 fois la valeur 2
    var noms : [String] = ["Toto", "Lulu"]
    let croix = UIImage(named: "croix.png")!
    let rond = UIImage(named: "rond.png")!
    let vide = UIImage(named: "vide.png")!
    var contenu : [UIImage] = []

    @IBOutlet weak var invitation: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var pion: UIImageView!
    
    @IBOutlet var boutons: [UIButton]!
    
    @IBAction func clic(_ sender: UIButton) {
        message.text = ""
        print ("Le bouton numéro \(sender.tag) a été cliqué")
        if tableau[sender.tag] != 2 { // case déjà jouée !
            message.text = "Veuillez cliquer sur une case vide !"
        } else { // case vide
            tableau[sender.tag] = joueur // on mémorise le code du joueur dans cette case
            sender.setImage(contenu[joueur],
                            for: UIControl.State.normal)
            let gain = testVictoire(plateau : tableau)
            if gain != 2 { // l'un des joueurs a gagné
                message.text = "\(noms[gain]) a gagné !"
                desactiveBoutons()
            } else { // personne n'a gagné
                if tableau.contains(2) { // il reste au moins une case vide
                    joueur = 1 - joueur // passe au joueur suivant
                } else { // il n'y a plus de case vide
                    message.text = "Partie nulle !"
                    desactiveBoutons()
                }
            }
        }
        afficheTour()
    }
    
    func desactiveBoutons () {
        for b in boutons {
            b.isEnabled = false // désactive tous les boutons
        }
    }
    
    func testVictoire(plateau : [Int]) -> Int {
        let lignes = [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [2,4,6]
        ]
        for ligne in lignes {
            if plateau[ligne[0]] == 1 && plateau[ligne[1]] == 1 && plateau[ligne[2]] == 1 {
                return 1
            } else if plateau[ligne[0]] == 0 && plateau[ligne[1]] == 0 && plateau[ligne[2]] == 0 {
                return 0
            }
        }
        return 2  // Aucun gagnant
    }
    
    func afficheTour() {
        invitation.text = "C'est à \(noms[joueur]) de jouer !"
        pion.image = contenu[joueur]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        contenu = [croix, rond, vide]
        message.text = ""
        afficheTour() // permet d'effacer l'erreur et d'afficher le nom et le symbole du prochain joueur
    }


}

