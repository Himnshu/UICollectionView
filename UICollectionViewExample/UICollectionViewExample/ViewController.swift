//
//  ViewController.swift
//  UICollectionViewExample
//
//  Created by osx on 15/03/17.
//  Copyright © 2017 com.domain.UICollectionViewExample. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet var mImageView: UIImageView!
    
    @IBOutlet var mCollectionView: UICollectionView!
    
    var reuseIdentifier = "Cell"
    
    var mListArray = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mListArray = ["Egg Benedict", "Mushroom Risotto", "Full Breakfast", "Hamburger", "Ham and Egg Sandwich", "Creme Brelee", "White Chocolate Donut", "Starbucks Coffee", "Vegetable Curry", "Instant Noodle with Egg", "Noodle with BBQ Pork", "Japanese Noodle with Pork", "Green Tea", "Thai Shrimp Cake", "Angry Birds Cake", "Ham and Cheese Panini"]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mListArray.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        var screenRect = UIScreen.mainScreen().bounds
        var screenWidth: CGFloat = screenRect.size.width
        var cellWidth: CGFloat = screenWidth / 3.0
        //Replace the divisor with the column count requirement. Make sure to have it in float.
        var screenheight: CGFloat = screenRect.size.width
        var cellheight: CGFloat = screenheight / 4.0
        var size = CGSizeMake(cellWidth, cellheight)
        return size
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        // get a reference to our storyboard cell
        let cell = self.mCollectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath as NSIndexPath) as! Cell
        
        var mImage = cell.viewWithTag(1)! as! UIImageView
        
        var name = mListArray[indexPath.row] as! String
        
        var image = UIImage.init(named: "feed.png")
        mImage.contentMode = UIViewContentMode.ScaleAspectFit
        mImage.clipsToBounds = true
        mImage.image = image
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAt indexPath: NSIndexPath)
    {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }


}

