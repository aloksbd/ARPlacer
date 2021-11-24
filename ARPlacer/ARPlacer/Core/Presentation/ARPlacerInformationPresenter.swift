//
//  ARPlacerInformationPresenter.swift
//  ARPlacer
//
//  Created by alok subedi on 24/11/2021.
//

public class ARPlacerInformationPresenter {
    private let informationView: InformationView
    private var scanningInformation: String {
        "Please move your camera slowly to scan the surrounding"
    }
    
    public init(informationView: InformationView) {
        self.informationView = informationView
    }
    
    public func showScanningInformation() {
        informationView.display(information: scanningInformation)
    }
}
