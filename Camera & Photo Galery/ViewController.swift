//
//  ViewController.swift
//  Camera & Photo Galery
//
//  Created by Christiawan Eko Saputro on 16/10/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnAmbilGambar(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        
        let alert = UIAlertController(title: "Info", message: "Ambil Gambar", preferredStyle: .actionSheet)
        
        let btnCamera = UIAlertAction(title: "Camera", style: .default) { (UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                picker.sourceType = .camera
                self.present(picker,animated: true,completion: nil)
            }else{
                print("tidak ada kamera")
            }
        }
        
        let btnGalery = UIAlertAction(title: "Galery", style: .default) { (UIAlertAction) in
            picker.sourceType = .photoLibrary
            self.present(picker,animated: true,completion: nil)
        }
       
        alert.addAction(btnCamera)
        alert.addAction(btnGalery)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let gambar = info[.originalImage]
        imgView.image = gambar as! UIImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}

