name := "OPQHub"

version := "1.0-SNAPSHOT"

libraryDependencies ++= Seq(
  "mysql" % "mysql-connector-java" % "5.1.21",
  "org.apache.commons" % "commons-email" % "1.3.2",
  "org.jsoup" % "jsoup" % "1.8.1",
  javaJdbc,
  javaEbean,
  cache
)     

play.Project.playJavaSettings
