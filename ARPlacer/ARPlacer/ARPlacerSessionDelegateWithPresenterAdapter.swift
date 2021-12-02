//
//  ARPlacerSessionDelegateWithPresenterAdapter.swift
//  ARPlacer
//
//  Created by alok subedi on 30/11/2021.
//

import ARKit

public class ARPlacerSessionDelegateWithPresenterAdapter: NSObject, ARSCNViewDelegate {
    private var delegate: ARPlacerSessionDelegate!
    private var presenter: ARPlacerInformationPresenter!
    
    override init() {
        super.init()
    }
    
    public convenience init(delegate: ARPlacerSessionDelegate, presenter: ARPlacerInformationPresenter) {
        self.init()
        self.delegate = delegate
        self.presenter = presenter
        adaptToPresenter()
    }
    
    private func adaptToPresenter() {
        delegate.onLimited = { [weak self] in
            self?.presenter.showLimitedTrackingInformation()
        }
        delegate.onNormal = { [weak self] in
            self?.presenter.showPlacingInformation()
        }
        delegate.onNotAvailable = { [weak self] in
            self?.presenter.showScanningInformation()
        }
        delegate.sessionFailedWithError = { [weak self] error in
            self?.presenter.sessionFailed(with: error)
        }
    }
    
    public func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
        self.delegate.session(session, cameraDidChangeTrackingState: camera)
    }
    
    public func session(_ session: ARSession, didFailWithError error: Error) {
        self.delegate.session(session, didFailWithError: error)
    }
}
