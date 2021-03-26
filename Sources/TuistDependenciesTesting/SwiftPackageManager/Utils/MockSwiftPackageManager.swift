import TSCBasic
import TuistGraph

@testable import TuistDependencies

public final class MockSwiftPackageManager: SwiftPackageManaging {
    public init() {}
    
    var invokedResolve = false
    var invokedResolveCount = 0
    var invokedResolveParameters: AbsolutePath?
    var invokedResolveParametersList = [AbsolutePath]()
    var resolveStub: ((AbsolutePath) throws  -> Void)?
    
    public func resolve(at path: AbsolutePath) throws {
        invokedResolve = true
        invokedResolveCount += 1
        invokedResolveParameters = path
        invokedResolveParametersList.append(path)
        try resolveStub?(path)
    }
}