name := """dormitory"""

version := "1.0"

lazy val root = (project in file(".")).enablePlugins(PlayJava,PlayEbean)

scalaVersion := "2.11.6"

libraryDependencies ++= Seq(
  javaJdbc,
  cache,
  javaWs,
  "org.webjars" %% "webjars-play" % "2.4.0-1",
  "org.webjars" % "bootstrap" % "3.1.1-2",
  "org.postgresql" % "postgresql" % "9.3-1102-jdbc41",
  "be.objectify" %% "deadbolt-java" % "2.4.3",
   "mysql" % "mysql-connector-java" % "5.1.18"

)

// Play provides two styles of routers, one expects its actions to be injected, the
// other, legacy style, accesses its actions statically.
routesGenerator := InjectedRoutesGenerator
