//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Zeki Gökler on 2.04.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var mySimpson = [Simpson]()
    var choseSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // Simpson Objects
        let Lisa = Simpson(name: "Lisa", job: "Student", image: UIImage(named: "Lisa")!)
        let Cent = Simpson(name: "50_Cent", job: "Student", image: UIImage(named: "50_Cent")!)
        let Ben = Simpson(name: "Ben", job: "Student", image: UIImage(named: "Ben")!)
        let Chris = Simpson(name: "Chris", job: "Student", image: UIImage(named: "Chris")!)
        let Fyvush = Simpson(name: "Fyvush", job: "Student", image: UIImage(named: "Fyvush")!)
        
        
        mySimpson.append(Lisa)
        mySimpson.append(Cent)
        mySimpson.append(Ben)
        mySimpson.append(Chris)
        mySimpson.append(Fyvush)
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpson[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        choseSimpson = mySimpson[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = choseSimpson
        }
    }
}

