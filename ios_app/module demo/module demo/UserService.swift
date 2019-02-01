import Foundation

public protocol UserService {
    //TODO: user user object instead
    func setUser(user: String)
    
    func getFeatureIdentifiers() -> [String]
}


public protocol UserServiceProvider {
    func getUserService() -> UserService
}

extension UserServiceProvider {
    func getUserService() -> UserService {
        return UserServiceServiceImpl.Instance
    }
}

fileprivate class UserServiceServiceImpl: UserService {
   
    fileprivate static let Instance = UserServiceServiceImpl()
    
    fileprivate var user: String?
    
    func setUser(user: String) {
        self.user = user
    }
    
    func getFeatureIdentifiers() -> [String] {
        //TODO: get from backed
        
        if let user = self.user, user.lowercased() == "hat" {
            return ["A", "B"]
        } else {
            return ["B", "C"]
        }
    }
}
