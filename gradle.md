## General Notes


### Gradle Properties
Setting up a consistent environment for your build is as simple as placing these settings into a gradle.properties file. The configuration is a combination of all your gradle.properties files, but if an option is configured in multiple locations, the first one wins:

1. system properties, e.g. when -Dgradle.user.home is set on the command line.

2. gradle.properties in GRADLE_USER_HOME directory.

3. gradle.properties in project root directory.

4. gradle.properties in Gradle installation directory.

### Stop Gradle Daemon
```
./gradlew --stop
```

### no-daemon
```
java -Dorg.gradle.appname=gradlew -classpath /home/ubuntu/workspace/<redacted> org.gradle.wrapper.GradleWrapperMain MyTests --no-daemon -Dgeb.env=<redacted>
```

The process run by Gradle to execute a build is the same whether or not you enable or disable the daemon. The behavior of the process after a build completes is the difference.

With the daemon enabled, the process will continue running in the background and can reused for a subsequent build. With the daemon disabled, the process is terminated at the end of the build. Even with the daemon disabled, you will still see a process labeled as a daemon. It doesn’t mean it will continue running in the background like a daemon.


