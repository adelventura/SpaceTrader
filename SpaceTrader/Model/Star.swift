//
//  Star.swift
//  SpaceTrader
//
//

import UIKit

private let StarNames = [
    "Acamar",
    "Adahn",
    "Aldea",
    "Andevian",
    "Antedi",
    "Annabelle",
    "Balosnee",
    "Baratas",
    "Brax",
    "Bretel",
    "Beasley",
    "Calondia",
    "Campor",
    "Capellius",
    "Carzon",
    "Castor",
    "Cestus",
    "Cheron",
    "Courteney",
    "Daled",
    "Damast",
    "Davlos",
    "Deneb",
    "Deneva",
    "Devidia",
    "Dryalon",
    "Drema",
    "Endor",
    "Esmee",
    "Exo",
    "Ferris",
    "Festen",
    "Fourmi",
    "Frolix",
    "Gemulon",
    "Guinivere",
    "Hades",
    "Hamlet",
    "Helena",
    "Hulst",
    "Iodine",
    "Iralius",
    "Janus",
    "Japori",
    "Jarada",
    "Jason",
    "Kaylon",
    "Kratomicus",
    "Khefka",
    "Kira",
    "Kiatu",
    "Klaestron",
    "Kravat",
    "Krios",
    "Laertes",
    "Largo",
    "Lave",
    "Ligon",
    "Lowry",
    "Magrat",
    "Malcoria",
    "Ashley",
    "Brayden",
    "Caroline",
    "Ila",
    "William",
    "Melina",
    "Mentar",
    "Merik",
    "Mintaka",
    "Montor",
    "Mordan",
    "Myrthe",
    "Nelvana",
    "Nix",
    "Nyle",
    "Tommy",
    "Karl",
    "Henry",
    "Odet",
    "Og",
    "Omegasus",
    "Galactavapecus",
    "Othello",
    "Omphalos",
    "Orias",
    "Penthara",
    "Picardicus",
    "Pollux",
    "Quator",
    "Rakhar",
    "Ramzeus",
    "Rasperus",
    "Regulus",
    "Relva",
    "Rhymus",
    "Rochani",
    "Rubicum",
    "Rutia",
    "Sarpeidon",
    "Sefalla",
    "Shimilaka",
    "Seltrice",
    "Sigma",
    "Sol",
    "Somari",
    "Stakoron",
    "Styris",
    "Talani",
    "Tamus",
    "Tantalos",
    "Tanuga",
    "Tungaska",
    "Triacus",
    "Tarin",
    "Royazmuth",
    "Modthovan",
    "Thera",
    "Terosa",
    "Umberlyke",
    "Vagra",
    "Vadera",
    "Vandor",
    "Ventaxus",
    "Xenon",
    "Rufaas",
    "Xerxes",
    "Yewl",
    "Sourin",
    "Yojimbo",
    "Zalcon",
    "Zejuul",
    "Where's Bob",
    "Fezzik"
]


class Star: Codable {
    let name: String
    let starType: StarType
    let coordinates: CGPoint
    var planets: [Planet]
    
    static func random() -> Star {
        let name = StarNames.random()
        
        return Star(
            name: name,
            starType: StarType.allCases.random(),
            coordinates: CGPoint(
                x: Int.random(in: 0..<500),
                y: Int.random(in: 0..<500)
            ),
            planets: [
                Planet(
                    name: "\(name)-1",
                    techLevel: TechLevel.allCases.random(),
                    politicalSystem: PoliticalSystem.allCases.random(),
                    resource: ResourceModifier.allCases.random()
                )
            ]
        )
    }
    
    init(name: String, starType: StarType, coordinates: CGPoint, planets: [Planet]) {
        self.name = name
        self.starType = starType
        self.coordinates = coordinates
        self.planets = planets
    }
    
    func distance(to: Star) -> Int {
        return Int(sqrt(
            pow(coordinates.x - to.coordinates.x, 2)
                + pow(coordinates.y - to.coordinates.y, 2)
        ))
    }
}