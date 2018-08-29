//
//  addPostVC.swift
//  my-hood
//
//  Created by Mehdi Silini on 25/05/2016.
//  Copyright © 2016 Mehdi Silini. All rights reserved.
//

import UIKit

class addPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func makePostPressed(_ sender: UIButton!) {
        if let title = titleField.text, titleField.text != "", let desc = descriptionField.text, descriptionField.text != "", let img = postImage.image {
            let imagePath = DataService.instance.saveImageAndCreatePath(img)
            let post = Post(imagePath: imagePath, title: title, description: desc)
            DataService.instance.addPost(post)
            dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func cancelPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addImagePressed(_ sender: AnyObject) {
        sender.setTitle("", for: UIControlState())
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismiss(animated: true, completion: nil)
        postImage.image = image
    }
}
