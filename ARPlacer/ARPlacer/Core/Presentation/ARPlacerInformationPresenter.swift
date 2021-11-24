//
//  ARPlacerInformationPresenter.swift
//  ARPlacer
//
//  Created by alok subedi on 24/11/2021.
//

public class ARPlacerInformationPresenter {
    private let informationView: InformationView
    private let errorView: ErrorView
    private var scanningInformation: String {
        "Please move your camera slowly to scan the surrounding"
    }
    private var limitedTrackingInformation: String {
        "Camera Tracking is off. \nPlease move your camera slowly to scan the surrounding"
    }
    
    public init(informationView: InformationView, errorView: ErrorView) {
        self.informationView = informationView
        self.errorView = errorView
    }
    
    public func showScanningInformation() {
        informationView.display(information: scanningInformation)
    }
    
    public func showLimitedTrackingInformation() {
        informationView.display(information: limitedTrackingInformation)
    }
    
    public func sessionFailed(with error: String) {
        errorView.display(error: error)
    }
}
