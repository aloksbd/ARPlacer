//
//  RandomObjectCreator.swift
//  ARPlacer
//
//  Created by alok subedi on 25/11/2021.
//

public class RandomObjectCreator {
    private static let creators: [Int: ObjectCreator] = [
        1: SphereCreator(),
        2: BoxCreator(),
        3: TorusCreator()
    ]
    
    private(set) public static var randomNumberGenerator = { Int.random(in: 1...creators.count) }
    
    public static func create(randomNumberGenerator: () -> Int = randomNumberGenerator) -> Object {
        let randomNumber = randomNumberGenerator()
        guard let objectCreator = creators[randomNumber] else { return Object() }
        return objectCreator.create()
    }
}
