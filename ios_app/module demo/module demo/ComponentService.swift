import Foundation

public protocol ComponentService {
    
    func registerFeature(_ feature: FeatureContract)
    
    func getFeatures(featureIdentifier: [String]) -> [FeatureContract]
}


public protocol ComponentServiceProvider {
    func getComponentService() -> ComponentService
}

extension ComponentServiceProvider {
    func getComponentService() -> ComponentService {
        return ComponentServiceServiceImpl.Instance
    }
}

fileprivate class ComponentServiceServiceImpl: ComponentService {
    private var features: [FeatureContract] = []
    
    fileprivate static let Instance = ComponentServiceServiceImpl()
    
    func registerFeature(_ feature: FeatureContract) {
        features.append(feature)
    }
    
    func getFeatures(featureIdentifier: [String]) -> [FeatureContract] {
        var enabledFeatures: [FeatureContract] = []
        
        for feature in features {
            if featureIdentifier.contains(feature.identifier()) {
                enabledFeatures.append(feature)
            }
        }
        
        return enabledFeatures
    }
}
