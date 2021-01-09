import Quick
@testable import RibsDog

class LoggedInInteractorTests: QuickSpec {
    override func spec() {
        // Given
        var interactor: LoggedInInteractor!
        describe("LoggedIninteractor 테스트") {
            beforeEach {
                // prepare
                interactor = LoggedInInteractor()
                interactor.listener 
                interactor.router
            }
            // When
            context("액티브를 호출하면") {
                // Then
                it("내부 변수 초기화가 되었는지 확인 해야 함.") {
                }
            }
        }
        
        // Given
        describe("LoggedIninteractor 테스트") {
            beforeEach {
                // prepare
            }
            // When
            context("requestStart 호출하면") {
                // Then
                it("TicTacToe로 라우팅 돼야 함") {
                }
            }
        }
    }
}
