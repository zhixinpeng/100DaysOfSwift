//
//  DetailViewController.swift
//  Project1
//
//  Created by 彭智鑫 on 2022/8/8.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var selectedIndex: Int?
    var total: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \((selectedIndex ?? 0) + 1) Of \(total ?? 0)"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageLoaded = selectedImage {
            imageView.image = UIImage(named: imageLoaded)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image Found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image, selectedImage ?? ""], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
