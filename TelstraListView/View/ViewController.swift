//
//  ViewController.swift
//  TelstraListView
//
//  Created by Aabasaheb Deshpande on 1/30/19.
//  Copyright © 2019 wipro.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var userArray : [UserDataDisplayViewModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userDataNetworkCall()
    }
    
    func userDataNetworkCall() {
        
        activityIndicator.startAnimating()
        self.view.bringSubviewToFront(activityIndicator)
        let networkObj = NetworkManager()
        networkObj.getDataFromJson { [unowned self] (userDataArray) in
            self.userArray = userDataArray
            
            DispatchQueue.main.async {
               // self.activityIndicator.stopAnimating()
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
            }
        }
    }
    
    func downloadLazyImage(imageURL : String, imgView : UIImageView) {
        
        guard let url = URL(string: imageURL) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                imgView.image = image
            }
            }.resume()
    }
    
    @IBAction func refreshTableData(_ sender: Any) {
        
        self.userDataNetworkCall()
        
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userArray!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : FirstDescriptionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FirstDescriptionTableViewCell", for: indexPath) as! FirstDescriptionTableViewCell
        let userobject : UserDataDisplayViewModel = (userArray?[indexPath.row])!
        cell.titleLabel.text = userobject.country
        cell.descriptionLabel.text = userobject.population
        downloadLazyImage(imageURL: userobject.flagImage, imgView: cell.profileImage)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
