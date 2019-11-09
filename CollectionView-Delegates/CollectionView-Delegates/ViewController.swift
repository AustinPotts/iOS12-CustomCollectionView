//
//  ViewController.swift
//  CollectionView-Delegates
//
//  Created by Austin Potts on 11/9/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

//MARK: - Add Model for Mock Data

struct CustomData {
    var title: String
    var image: UIImage
    var url: String
}



class ViewController: UIViewController {

    //MARK: - Declare array values for the Model Mock Data (Use Asset Images)
    
    let data = [
        CustomData(title: "London", image: #imageLiteral(resourceName: "Tokyo"), url: "part"),
        CustomData(title: "Hollywood", image: #imageLiteral(resourceName: "Egypt"), url: "part"),
        CustomData(title: "Moscow", image: #imageLiteral(resourceName: "Lodnon"), url: "part"),
        CustomData(title: "Paris", image: #imageLiteral(resourceName: "NewYork"), url: "part"),
        CustomData(title: "Tokyo", image: #imageLiteral(resourceName: "Paris"), url: "part"),
        CustomData(title: "Madrid", image: #imageLiteral(resourceName: "Hollywood"), url: "part"),
        CustomData(title: "Athens", image: #imageLiteral(resourceName: "Moscow"), url: "part")
    ]
    
    
    
    fileprivate let collectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
         let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
         cv.translatesAutoresizingMaskIntoConstraints = false
         cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
         return cv
     }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         view.addSubview(collectionView)
                collectionView.backgroundColor = .clear
                collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -0).isActive = true
                
          //collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
        
        
      //MARK: - Call the delegate
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    

}


    //MARK: Add Extension for the Delegation Process
extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.data = self.data[indexPath.row]
        
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ViewModalSegue" {
//            guard let indexPath = collectionView.indexPathsForSelectedItems?.first?.item,
//                let selectVC = segue.destination as? DetailViewController else { return }
//
//            let selectedCell = data.
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
              performSegue(withIdentifier: "ViewModalSegue", sender: indexPath)
          }
    
}



       //MARK: Create Custom Segue 







    //MARK: Add Class for Custom Cell

class CustomCell: UICollectionViewCell {
    
    var data: CustomData? {  // computer property
        didSet {
            guard let data = data else { return }
            bg.image = data.image
        }
    }
    
    fileprivate let bg: UIImageView = {
           let iv = UIImageView()
           iv.image = #imageLiteral(resourceName: "Tokyo")
           iv.translatesAutoresizingMaskIntoConstraints = false
           iv.contentMode = .scaleAspectFill
           iv.clipsToBounds = true
           iv.layer.cornerRadius = 10 // Adjust this number to configure the cells edges
           
           return iv
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(bg)
        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
