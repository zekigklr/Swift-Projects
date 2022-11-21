//
//  ViewController.swift
//  FlagViewer
//
//  Created by Michele Galvagno on 24/02/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    // MARK: - Properties
    var flags = [String]()
    
    // MARK: - Outlets & Actions
    
    // MARK: - Navigation
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "World Flag Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Retrieve images from file manager and store them into the array.
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("png") {
                flags.append(item)
            }
        }
        flags.sort()
        print(flags) // just for test purposes.
    }
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let flagName = flags[indexPath.row].fileName().uppercased()
        cell.textLabel?.text = flagName
        cell.imageView?.image = UIImage(named: flags[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailViewController.selectedImage = flags[indexPath.row]
            
            let flagName = flags[indexPath.row].fileName().uppercased()
            detailViewController.title = "\(flagName)"
            
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    // MARK: - Methods

}

extension String {
    func fileName() -> String {
        return NSURL(fileURLWithPath: self).deletingPathExtension?.lastPathComponent ?? ""
    }
    
    func fileExtension() -> String {
        return NSURL(fileURLWithPath: self).pathExtension ?? ""
    }
}

