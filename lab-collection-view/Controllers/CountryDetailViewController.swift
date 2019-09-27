//
//  CountryDetailViewController.swift
//  lab-collection-view
//
//  Created by Levi Davis on 9/26/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    var oneCountry: Country!
    var currency: [String: Double]!

    @IBOutlet weak var flagImageViewOutlet: UIImageView!
    @IBOutlet weak var countryInfoTextViewOutlet: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        // Do any additional setup after loading the view.
    }
    

    private func setViews() {
        countryInfoTextViewOutlet.text = "Country: \(oneCountry.name)\nPopulation: \(oneCountry.population)\nCurrency: \(oneCountry.currencies[0].symbol)\(oneCountry.currencies[0].code)\nExchange rate pegged to Euro: \(currency[oneCountry.currencies[0].code]!)"
    }

}
