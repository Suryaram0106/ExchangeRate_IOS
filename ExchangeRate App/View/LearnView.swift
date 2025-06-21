//
//  LearnView.swift
//  ExchangeRate App
//
//  Created by Surya on 20/06/25.
//

import SwiftUI

import SwiftUI

struct LearnView: View {
    
    let facts: [CurrencyFact] = [
        CurrencyFact(code: "USD", country: "United States", fact: "The U.S. dollar is the most traded currency in the world.", website: "https://www.treasury.gov"),
        CurrencyFact(code: "EUR", country: "Eurozone", fact: "The Euro is used by 20 EU countries as of 2023.", website: "https://europa.eu/euro"),
        CurrencyFact(code: "JPY", country: "Japan", fact: "The Yen is the most traded currency in Asia.", website: "https://www.mof.go.jp/english/"),
        CurrencyFact(code: "GBP", country: "United Kingdom", fact: "The British Pound is the oldest currency still in use.", website: "https://www.bankofengland.co.uk"),
        CurrencyFact(code: "AUD", country: "Australia", fact: "Australia was the first to introduce polymer banknotes.", website: "https://www.rba.gov.au"),
        CurrencyFact(code: "CAD", country: "Canada", fact: "The Canadian dollar is nicknamed the 'Loonie'.", website: "https://www.bankofcanada.ca"),
        CurrencyFact(code: "CHF", country: "Switzerland", fact: "The Swiss Franc is known for its stability.", website: "https://www.snb.ch"),
        CurrencyFact(code: "CNY", country: "China", fact: "The Yuan is also called Renminbi.", website: "http://www.pbc.gov.cn"),
        CurrencyFact(code: "INR", country: "India", fact: "The symbol ₹ was officially adopted in 2010.", website: "https://www.rbi.org.in"),
        CurrencyFact(code: "BRL", country: "Brazil", fact: "The Brazilian Real was introduced in 1994.", website: "https://www.bcb.gov.br"),
        CurrencyFact(code: "ZAR", country: "South Africa", fact: "The Rand is named after the Witwatersrand ridge.", website: "https://www.resbank.co.za"),
        CurrencyFact(code: "SGD", country: "Singapore", fact: "Singapore's currency is interchangeable with Brunei's.", website: "https://www.mas.gov.sg"),
        CurrencyFact(code: "KRW", country: "South Korea", fact: "The Won was reintroduced in 1962.", website: "https://www.bok.or.kr"),
        CurrencyFact(code: "SEK", country: "Sweden", fact: "Sweden uses Krona instead of Euro despite EU membership.", website: "https://www.riksbank.se"),
        CurrencyFact(code: "NZD", country: "New Zealand", fact: "The NZ dollar is nicknamed the 'Kiwi'.", website: "https://www.rbnz.govt.nz"),
        CurrencyFact(code: "MXN", country: "Mexico", fact: "The Peso symbol comes from the Spanish dollar.", website: "https://www.banxico.org.mx"),
        CurrencyFact(code: "TRY", country: "Turkey", fact: "The Lira was revalued in 2005, dropping six zeros.", website: "https://www.tcmb.gov.tr"),
        CurrencyFact(code: "NOK", country: "Norway", fact: "Norwegian Krone has been stable since 1875.", website: "https://www.norges-bank.no"),
        CurrencyFact(code: "RUB", country: "Russia", fact: "Rubles have been used since the 13th century.", website: "https://www.cbr.ru"),
        CurrencyFact(code: "PLN", country: "Poland", fact: "The Polish Zloty means 'golden'.", website: "https://www.nbp.pl"),
        CurrencyFact(code: "THB", country: "Thailand", fact: "The Baht is subdivided into 100 satang.", website: "https://www.bot.or.th"),
        CurrencyFact(code: "DKK", country: "Denmark", fact: "The Krone is pegged to the Euro.", website: "https://www.nationalbanken.dk"),
        CurrencyFact(code: "IDR", country: "Indonesia", fact: "Indonesia's Rupiah has seen multiple redenominations.", website: "https://www.bi.go.id"),
        CurrencyFact(code: "CZK", country: "Czech Republic", fact: "The Czech Koruna was introduced in 1993.", website: "https://www.cnb.cz"),
        CurrencyFact(code: "HUF", country: "Hungary", fact: "The Forint was introduced in 1946.", website: "https://www.mnb.hu"),
        CurrencyFact(code: "ILS", country: "Israel", fact: "The Shekel replaced the Israeli Pound in 1980.", website: "https://www.boi.org.il"),
        CurrencyFact(code: "PHP", country: "Philippines", fact: "The Peso sign is ₱.", website: "https://www.bsp.gov.ph"),
        CurrencyFact(code: "MYR", country: "Malaysia", fact: "The Ringgit means 'jagged' in Malay.", website: "https://www.bnm.gov.my"),
        CurrencyFact(code: "SAR", country: "Saudi Arabia", fact: "The Riyal is pegged to the US dollar.", website: "https://www.sama.gov.sa"),
        CurrencyFact(code: "COP", country: "Colombia", fact: "The Colombian Peso is abbreviated as COL$.", website: "https://www.banrep.gov.co"),
        CurrencyFact(code: "AED", country: "United Arab Emirates", fact: "The Dirham is pegged to the US dollar.", website: "https://www.centralbank.ae"),
        CurrencyFact(code: "RON", country: "Romania", fact: "The Leu means 'lion'.", website: "https://www.bnr.ro"),
        CurrencyFact(code: "CLP", country: "Chile", fact: "The Chilean Peso has no cent coins in use.", website: "https://www.bcentral.cl"),
        CurrencyFact(code: "TWD", country: "Taiwan", fact: "The New Taiwan dollar was introduced in 1949.", website: "https://www.cbc.gov.tw"),
        CurrencyFact(code: "ARS", country: "Argentina", fact: "Argentina's Peso replaced the Austral in 1992.", website: "https://www.bcra.gob.ar"),
        CurrencyFact(code: "VND", country: "Vietnam", fact: "The Dong has one of the lowest values globally.", website: "https://www.sbv.gov.vn"),
        CurrencyFact(code: "EGP", country: "Egypt", fact: "The Pound is called 'Geneih' locally.", website: "https://www.cbe.org.eg"),
        CurrencyFact(code: "BDT", country: "Bangladesh", fact: "The Taka sign is ৳.", website: "https://www.bb.org.bd"),
        CurrencyFact(code: "PKR", country: "Pakistan", fact: "The Rupee symbol is Rs.", website: "https://www.sbp.org.pk"),
        CurrencyFact(code: "NGN", country: "Nigeria", fact: "The Naira was introduced in 1973.", website: "https://www.cbn.gov.ng"),
        CurrencyFact(code: "KES", country: "Kenya", fact: "The Shilling replaced the East African Shilling.", website: "https://www.centralbank.go.ke"),
        CurrencyFact(code: "UAH", country: "Ukraine", fact: "The Hryvnia was introduced in 1996.", website: "https://bank.gov.ua"),
        CurrencyFact(code: "LKR", country: "Sri Lanka", fact: "The Rupee replaced the Indian Rupee in 1948.", website: "https://www.cbsl.gov.lk"),
        CurrencyFact(code: "GHS", country: "Ghana", fact: "The Cedi is named after cowry shells.", website: "https://www.bog.gov.gh"),
        CurrencyFact(code: "QAR", country: "Qatar", fact: "The Riyal has been pegged to the dollar since 2001.", website: "https://www.qcb.gov.qa"),
        CurrencyFact(code: "MAD", country: "Morocco", fact: "The Dirham was reintroduced in 1960.", website: "https://www.bkam.ma")
    ]

    func flag(for code: String) -> String {
        let currencyToCountryCode: [String: String] = [
            "USD": "US", "EUR": "EU", "JPY": "JP", "GBP": "GB", "AUD": "AU", "CAD": "CA", "CHF": "CH",
            "CNY": "CN", "INR": "IN", "BRL": "BR", "ZAR": "ZA", "SGD": "SG", "KRW": "KR", "SEK": "SE",
            "NZD": "NZ", "MXN": "MX", "TRY": "TR", "NOK": "NO", "RUB": "RU", "PLN": "PL", "THB": "TH",
            "DKK": "DK", "IDR": "ID", "CZK": "CZ", "HUF": "HU", "ILS": "IL", "PHP": "PH", "MYR": "MY",
            "SAR": "SA", "COP": "CO", "AED": "AE", "RON": "RO", "CLP": "CL", "TWD": "TW", "ARS": "AR",
            "VND": "VN", "EGP": "EG", "BDT": "BD", "PKR": "PK", "NGN": "NG", "KES": "KE", "UAH": "UA",
            "LKR": "LK", "GHS": "GH", "QAR": "QA", "MAD": "MA"
        ]
        let base: UInt32 = 127397
        let countryCode = currencyToCountryCode[code] ?? String(code.prefix(2))
        return countryCode.uppercased().unicodeScalars
            .compactMap { UnicodeScalar(base + $0.value) }
            .map { String($0) }
            .joined()
    }

    var body: some View {
        NavigationStack {
            List(facts) { fact in
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(flag(for: fact.code))
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            Text("\(fact.country) (\(fact.code))")
                                .font(.headline)
                            Text(fact.fact)
                                .font(.subheadline)
                        }
                    }
                    if let url = URL(string: fact.website) {
                        Link("Visit official site", destination: url)
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Learn")
        }
    }
}

struct CurrencyFact: Identifiable {
    let id = UUID()
    let code: String
    let country: String
    let fact: String
    let website: String
}
