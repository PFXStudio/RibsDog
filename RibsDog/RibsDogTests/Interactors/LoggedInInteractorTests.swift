import Quick
import Nimble
@testable import RibsDog

class LoggedInInteractorTests: QuickSpec {
    override func spec() {
        // Given
        var interactor: LoggedInInteractor!
        var listener: LoggedInListenerMock!
        var router: LoggedInRouterMock!
        describe("LoggedIninteractor 테스트") {
            beforeEach {
                // prepare
                interactor = LoggedInInteractor()
                listener = LoggedInListenerMock()
                interactor.listener = listener
                router = LoggedInRouterMock(interactor: interactor)
                interactor.router = router
            }
            // When
            context("requestStart 호출하면") {
                // Then
                it("TicTacToe로 라우팅 돼야 함") {
                    interactor.requestStart()
                    expect(router.setRouteToTicTacToeCount).to(equal(1))
                }
            }
        }
    }
}
