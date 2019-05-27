//
//  NYTimesListingViewController.swift
//  NYTimes
//
//  Created by APPLE on 19/05/19.
//  Copyright © 2019 APPLE. All rights reserved.
//

import UIKit

class NYTimesListingViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var noInternetLbl: UILabel!
    
    let kNYTimesTableViewCell = "NYTimesProductTableViewCell"
    let nyTimesViewModel = NYTimesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NYTimes Top Items"
        setupTableView()
        if !(CheckNetworkUsability.sharedInstance().checkInternetConnection()){
            noInternetLbl.isHidden = false
            tblView.isHidden = true
            return
        }
        
        CustomLoader.showActivityView(view: self.view)
        nyTimesViewModel.getNYTimesProduct(completion: {
            DispatchQueue.main.async {
                self.noInternetLbl.isHidden = true
                self.tblView.isHidden = false
                CustomLoader.removeActivityIndicator(self.view)
                self.tblView.reloadData()
            }
        })
       CustomLoader.removeActivityIndicator(self.view)
    }
    
    static func loadFromNib() -> NYTimesListingViewController {
        return NYTimesListingViewController(nibName: "NYTimesListingViewController", bundle: nil)
    }
    
    func setupTableView() {
        //set up tableview other properties
        tblView.rowHeight = UITableView.automaticDimension
        tblView.estimatedRowHeight = 100
        tblView.separatorStyle = .none
        //register views to table view
        tblView.register(UINib(nibName: kNYTimesTableViewCell, bundle: nil),
                         forCellReuseIdentifier: kNYTimesTableViewCell)
        self.edgesForExtendedLayout = []
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
// MARK: - Table view data source
extension NYTimesListingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return nyTimesViewModel.getNumberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nyTimesViewModel.getNumberOfRowForSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kNYTimesTableViewCell,
                                                 for: indexPath) as! NYTimesProductTableViewCell
        cell.configureItemsCell(viewModel: nyTimesViewModel, indexPath: indexPath)
        return cell
    }
    
}

