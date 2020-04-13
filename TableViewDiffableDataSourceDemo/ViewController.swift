//
//  ViewController.swift
//  TableViewDiffableDataSourceDemo
//
//  Created by apple on 13/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit


enum GuitarsSection {
    case gibson
   // case martin
}

struct GuitarModel: Hashable {
    let name: String
    let year: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    var datasource: UITableViewDiffableDataSource<GuitarsSection, GuitarModel>!

    var guitarArr = [GuitarModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureDataSource()
        guitarArr = getAllData()
        createSnapshot(data: guitarArr)
    }
    
    func configureDataSource(){
        
        datasource = UITableViewDiffableDataSource<GuitarsSection, GuitarModel>(tableView: tblView, cellProvider: { (tableview, indexpath, model) -> UITableViewCell? in
            let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexpath)
            cell.textLabel?.text = model.name
            cell.detailTextLabel?.text = model.year
            return cell
        })
    }
    
    func getAllData() -> [GuitarModel] {
        return [
        GuitarModel(name: "Meenal", year: "09/09/2fgd009"),
             GuitarModel(name: "Meenal", year: "09/0fdg9/2009"),
             GuitarModel(name: "Meenalww", year: "09fvd/09/2009"),
             GuitarModel(name: "Meendfal", year: "09gf/09/2009"),
             GuitarModel(name: "Meejkjnal", year: "09/09/as2009"),
             GuitarModel(name: "Meehgnhgnal", year: "09/0sa9/2009")
        ]
    }
    
    func createSnapshot(data:[GuitarModel]){
        var snapshot = NSDiffableDataSourceSnapshot<GuitarsSection, GuitarModel>()
        snapshot.appendSections([.gibson])
        snapshot.appendItems(data)
        datasource.apply(snapshot, animatingDifferences: true, completion: nil)
    }
    

}

