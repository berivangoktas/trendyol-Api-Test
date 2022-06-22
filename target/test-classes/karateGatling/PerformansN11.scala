package karateGatling

import io.gatling.core.Predef.scenario
import io.gatling.core.scenario.Simulation
import com.intuit.karate.gatling.KarateProtocol
import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef.{Simulation, exec, openInjectionProfileFactory, rampUsers, scenario}
import io.gatling.core.structure.ScenarioBuilder

import scala.concurrent.duration.DurationInt
import scala.language.postfixOps

class PerformansN11 extends Simulation {
  val getAllScenarios: ScenarioBuilder = scenario("All Cases").exec(karateFeature("classpath:karateGatling/performans.feature"))

  val protocol: KarateProtocol = karateProtocol(
    "/karateGatling" -> pauseFor("get" -> 0, "post" -> 0)
  )

  setUp(
    getAllScenarios.inject(rampUsers(15) during (60 seconds)).protocols(protocol)
  )
}
