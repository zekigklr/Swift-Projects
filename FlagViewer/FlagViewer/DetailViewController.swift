//
//  DetailViewController.swift
//  FlagViewer
//
//  Created by Michele Galvagno on 25/02/2019.
//  Copyright © 2019 Michele Galvagno. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Properties
    var selectedImage: String?
    
    // MARK: - Outlets & Actions
    @IBOutlet var imageView: UIImageView!
    
    // MARK: - Navigation & Views
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
        
    // MARK: - Methods
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        let imageName = selectedImage?.fileName().uppercased()
        let activityViewController = UIActivityViewController(activityItems: [image, "Whose country is this flag?It's ISO country code is \(imageName!)"], applicationActivities: [])
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityViewController, animated: true)
    }
}
