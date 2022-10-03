//
//  ViewController.swift
//  NFS2022
//
//  Created by Роман Денисенко on 30.09.22.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - IBActions
    @IBAction func toFIrstGame(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "FirstGameViewController") as? FirstGameViewController,
              let navController = self.navigationController else {return}
        navController.pushViewController(destinationViewController, animated: true)
    }
    
    @IBAction func toSecondGame(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "SecondGameViewController") as? SecondGameViewController,
              let navController = self.navigationController else {return}
        navController.pushViewController(destinationViewController, animated: true)
    }
}

