//
//  Currency.swift
//  lab-collection-view
//
//  Created by Levi Davis on 9/26/19.
//  Copyright © 2019 Levi Davis. All rights reserved.
//

import Foundation

struct Currency: Codable {
   let rates: [String: Double]
    
    static func decodeElementsFromData(from jsonData: Data) throws -> Currency {
        let response = try JSONDecoder().decode(Currency.self, from: jsonData)
        return response
    }
}

//{
//    "success": true,
//    "timestamp": 1569515346,
//    "base": "EUR",
//    "date": "2019-09-26",
//    "rates": {
//        "AED": 4.015592,
//        "AFN": 85.496831,
//        "ALL": 121.792424,
//        "AMD": 520.405175,
//        "ANG": 1.92903,
//        "AOA": 405.995391,
//        "ARS": 62.499487,
//        "AUD": 1.618645,
//        "AWG": 1.967837,
//        "AZN": 1.863968,
//        "BAM": 1.955647,
//        "BBD": 2.206656,
//        "BDT": 92.346135,
//        "BGN": 1.96029,
//        "BHD": 0.412207,
//        "BIF": 2033.431586,
//        "BMD": 1.093243,
//        "BND": 1.506443,
//        "BOB": 7.557314,
//        "BRL": 4.540269,
//        "BSD": 1.092969,
//        "BTC": 0.00014,
//        "BTN": 77.442588,
//        "BWP": 12.075987,
//        "BYN": 2.263994,
//        "BYR": 21427.558653,
//        "BZD": 2.202997,
//        "CAD": 1.450367,
//        "CDF": 1820.248825,
//        "CHF": 1.08553,
//        "CLF": 0.028816,
//        "CLP": 795.11119,
//        "CNY": 7.797665,
//        "COP": 3763.816272,
//        "CRC": 637.442516,
//        "CUC": 1.093243,
//        "CUP": 28.970934,
//        "CVE": 110.416965,
//        "CZK": 25.825716,
//        "DJF": 194.290731,
//        "DKK": 7.466427,
//        "DOP": 57.072718,
//        "DZD": 131.681028,
//        "EGP": 17.833194,
//        "ERN": 16.398547,
//        "ETB": 32.305092,
//        "EUR": 1,
//        "FJD": 2.402237,
//        "FKP": 0.885735,
//        "GBP": 0.88527,
//        "GEL": 3.236015,
//        "GGP": 0.885312,
//        "GHS": 6.025301,
//        "GIP": 0.885751,
//        "GMD": 54.842557,
//        "GNF": 10085.164982,
//        "GTQ": 8.442783,
//        "GYD": 227.957552,
//        "HKD": 8.568066,
//        "HNL": 26.897596,
//        "HRK": 7.406501,
//        "HTG": 104.89938,
//        "HUF": 335.352336,
//        "IDR": 15506.555711,
//        "ILS": 3.822741,
//        "IMP": 0.885312,
//        "INR": 77.589083,
//        "IQD": 1300.958918,
//        "IRR": 46030.987427,
//        "ISK": 135.518099,
//        "JEP": 0.885312,
//        "JMD": 147.172806,
//        "JOD": 0.775076,
//        "JPY": 117.76853,
//        "KES": 113.484073,
//        "KGS": 76.279928,
//        "KHR": 4482.295685,
//        "KMF": 491.275996,
//        "KPW": 983.983593,
//        "KRW": 1314.033748,
//        "KWD": 0.332671,
//        "KYD": 0.91071,
//        "KZT": 423.315002,
//        "LAK": 9653.333921,
//        "LBP": 1648.118236,
//        "LKR": 198.718942,
//        "LRD": 228.487516,
//        "LSL": 16.387233,
//        "LTL": 3.228061,
//        "LVL": 0.661292,
//        "LYD": 1.541398,
//        "MAD": 10.602595,
//        "MDL": 19.399046,
//        "MGA": 4094.193911,
//        "MKD": 61.645225,
//        "MMK": 1673.204019,
//        "MNT": 2916.240848,
//        "MOP": 8.823727,
//        "MRO": 390.288053,
//        "MUR": 39.796768,
//        "MVR": 16.836611,
//        "MWK": 794.388521,
//        "MXN": 21.474426,
//        "MYR": 4.574674,
//        "MZN": 67.661103,
//        "NAD": 16.387364,
//        "NGN": 394.661028,
//        "NIO": 36.672286,
//        "NOK": 9.929662,
//        "NPR": 123.902677,
//        "NZD": 1.73437,
//        "OMR": 0.420899,
//        "PAB": 1.09286,
//        "PEN": 3.676193,
//        "PGK": 3.720906,
//        "PHP": 57.045285,
//        "PKR": 171.453406,
//        "PLN": 4.387675,
//        "PYG": 6981.01867,
//        "QAR": 3.98077,
//        "RON": 4.746636,
//        "RSD": 117.463507,
//        "RUB": 70.166403,
//        "RWF": 1009.074026,
//        "SAR": 4.101464,
//        "SBD": 8.973172,
//        "SCR": 15.000386,
//        "SDG": 49.304147,
//        "SEK": 10.672685,
//        "SGD": 1.51043,
//        "SHP": 1.444061,
//        "SLL": 10276.482652,
//        "SOS": 634.081248,
//        "SRD": 8.153419,
//        "STD": 23571.17818,
//        "SVC": 9.563033,
//        "SYP": 563.019791,
//        "SZL": 16.387615,
//        "THB": 33.497291,
//        "TJS": 10.589969,
//        "TMT": 3.837282,
//        "TND": 3.132523,
//        "TOP": 2.544905,
//        "TRY": 6.18677,
//        "TTD": 7.408305,
//        "TWD": 33.938086,
//        "TZS": 2513.966221,
//        "UAH": 26.494723,
//        "UGX": 4013.239432,
//        "USD": 1.093243,
//        "UYU": 40.220615,
//        "UZS": 10306.209539,
//        "VEF": 10.918756,
//        "VND": 25364.325934,
//        "VUV": 128.699843,
//        "WST": 2.93877,
//        "XAF": 655.890683,
//        "XAG": 0.061111,
//        "XAU": 0.000725,
//        "XCD": 2.954543,
//        "XDR": 0.801019,
//        "XOF": 657.03885,
//        "XPF": 119.65513,
//        "YER": 273.636062,
//        "ZAR": 16.395854,
//        "ZMK": 9840.495138,
//        "ZMW": 14.440663,
//        "ZWL": 352.024179
//    }
//}