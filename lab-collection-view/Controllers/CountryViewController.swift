//
//  CountryViewController.swift
//  lab-collection-view
//
//  Created by Levi Davis on 9/26/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class CountryViewController: UIViewController {
    
    var countries = [Country]() {
        didSet {
            countryCollectionView.reloadData()
        }
    }
    
    var currency = [String: Double]() {
        didSet {
            countryCollectionView.reloadData()
        }
    }
    
    let cellSpacing: CGFloat = 5.0

    @IBOutlet weak var countryCollectionView: UICollectionView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is CountryDetailViewController {
            guard let indexPath = countryCollectionView.indexPath(for: sender as! UICollectionViewCell),
                let countryVC = segue.destination as? CountryDetailViewController else {return}
            let oneCountry = countries[indexPath.row]
            countryVC.oneCountry = oneCountry
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        // Do any additional setup after loading the view.
    }

    private func setCollectionView() {
        countryCollectionView.delegate = self
        countryCollectionView.dataSource = self
        loadCountryData()
    }
    
    private func loadCountryData() {
        CountryAPIClient.manager.getCountries { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let countries):
                self.countries = countries
            }
        }
    }
    
    private func loadCurrencyData() {
        CurrencyAPIClient.manager.getCurrency { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let currency):
                self.currency = currency.rates
                
            }
        }
    }

}

extension CountryViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let oneCountry = countries[indexPath.row]
        if let cell = countryCollectionView.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath) as? CountryCollectionViewCell {
            cell.countryTextViewOutlet.text = "Name: \(oneCountry.name)\nCapital: \(oneCountry.capital)\nPopulation: \(oneCountry.population)\nCurrency: \(oneCountry.currencies[0].symbol) \(oneCountry.currencies[0].code)\nExchange: \(currency[oneCountry.currencies[0].code])"
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension CountryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numCells: CGFloat = 3
        let numSpaces: CGFloat = numCells + 1
        
        let screenWidth = UIScreen.main.bounds.width
        let screenheight = UIScreen.main.bounds.height
        
        return CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numCells, height: screenheight / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: 0, right: cellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
}

