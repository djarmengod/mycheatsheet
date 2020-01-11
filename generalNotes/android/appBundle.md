## Overview
An Android App Bundle is a new upload format that includes all your app’s compiled code and resources, but defers APK generation and signing to Google Play. Unlike an APK, you can't deploy an app bundle directly to a device. So, if you want to quickly test or share an APK with someone else, you should instead build an APK.

## Benefits
Google Play’s new app serving model, called **Dynamic Delivery**, then uses your app bundle to generate and serve optimized APKs for each user’s device configuration, so they download only the code and resources they need to run your app. You no longer have to build, sign, and manage multiple APKs to support different devices, and users get smaller, more optimized downloads.

## Building App Bundle
```
~/Documents/GIT/watewar/sample-mobile-android on  develop! ⌚ 16:32:20
$ ./gradlew :app:bundleRelease
 
Deprecated Gradle features were used in this build, making it incompatible with Gradle 6.0.
Use '--warning-mode all' to show the individual deprecation warnings.
See https://docs.gradle.org/5.1.1/userguide/command_line_interface.html#sec:command_line_warnings
 
BUILD SUCCESSFUL in 6s
35 actionable tasks: 6 executed, 29 up-to-date
 
~/Documents/GIT/watewar/sample-mobile-android on  develop! ⌚ 16:32:38

~/Documents/GIT/watewar/sample-mobile-android/app/build/outputs/bundle/release on  develop! ⌚ 16:51:51
$ ls -lart
total 12672
drwxr-xr-x  3 kiran  staff       96  9 Aug 16:32 ..
-rw-r--r--  1 kiran  staff  6277915  9 Aug 16:32 app.aab
drwxr-xr-x  3 kiran  staff       96  9 Aug 16:32 .
```
