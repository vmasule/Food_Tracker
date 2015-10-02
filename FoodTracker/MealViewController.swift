//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Bhaidas Masule on 26/09/2015.
//  Copyright © 2015 Mastek. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: properties
    
    @IBOutlet weak var nameTextFiled: UITextField!
    //@IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal = Meal?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Handle the text filed user input input through callbacks
        nameTextFiled.delegate = self
        
        //checkValidMealName()
    }

    //MARK: NAvigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if saveButton === sender{
        
            let name = nameTextFiled.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            meal = Meal(name: name, photo: photo, rating: rating)
        }
    }
    
    //MARK: Actions

    @IBAction func setDefaultLabelText(sender: UIButton) {
    
        //mealNameLabel.text = "Default Text"
        nameTextFiled.text = ""
    }
    
    @IBAction func selectPhotoFromLibrary(sender: UITapGestureRecognizer) {
        print("User taped image")
        nameTextFiled.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        print("Should return called")
        //Hide the keyboard
        nameTextFiled.resignFirstResponder()
        //checkValidMealName()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        print("Did end editing called!")
        //mealNameLabel.text = nameTextFiled.text
        navigationItem.title = textField.text
        //checkValidMealName()
    
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        saveButton.enabled = true
    }
    
    func checkValidMealName() {
        // Disable the Save button if the text field is empty.
        let text = nameTextFiled.text ?? ""
        print("Text is \(text)")
        
        if text.characters.count > 0 {
            
            saveButton.enabled = true//!text.isEmpty
        
        } else {
        
            saveButton.enabled = false
        
        }
    }
    
    //MARK: ImagePickerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.image = selectedImage
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

}

