## Signing

### Creating Unsigned APKs
./gradlew assembleRelease

```
~/Documents/GIT/project/app/build/outputs on  develop! ⌚ 15:53:36
$ tree
.
├── apk
│   ├── debug
│   │   ├── app-debug.apk
│   │   └── output.json
│   └── release
│       ├── app-release-unsigned.apk
│       └── output.json
└── logs
    ├── manifest-merger-debug-report.txt
    └── manifest-merger-release-report.txt

4 directories, 6 files

~/Documents/GIT/project/app/build/outputs on  develop! ⌚ 15:53:41
```

### Launcher Icon Name
<string name="app_name" translatable="false">waterji</string> in app/src/main/res/values/strings.xml

### Create Keys and Keystore
```
$ keytool -genkey -v -keystore service.keystore -alias service -keyalg RSA -keysize 4096 -validity 3650
Enter keystore password:
Re-enter new password:
What is your first and last name?
  [Unknown]:  MASKED
What is the name of your organizational unit?
  [Unknown]:  MASKED
What is the name of your organization?
  [Unknown]:  MASKED
What is the name of your City or Locality?
  [Unknown]:  MASKED
What is the name of your State or Province?
  [Unknown]:  MASKED
What is the two-letter country code for this unit?
  [Unknown]:  MASKED
Is CN=Waterji, OU=MASKED, O=MASKED, L=MASKED, ST=MASKED, C=MASKED correct?
  [no]:  Yes

Generating 4,096 bit RSA key pair and self-signed certificate (SHA256withRSA) with a validity of 3,650 days
	for: CN=MASKED, OU=MASKED, O=MASKED, L=MASKED, ST=MASKED, C=MASKED
Enter key password for <service>
	(RETURN if same as keystore password):
Re-enter new password:
[Storing service.keystore]

Warning:
The JKS keystore uses a proprietary format. It is recommended to migrate to PKCS12 which is an industry standard format using "keytool -importkeystore -srckeystore service.keystore -destkeystore service.keystore -deststoretype pkcs12".
```

### Sign APK
#### Adapt Source Code Repo (for Build with Signing)
Place the keystore generated in the previous step into $PROJECT_HOME/app.

Note: Line #9 below.
```
~/Documents/GIT/projwar/projrji-mobile-android on  develop! ⌚ 16:24:54
$ ls -lart app/
total 32
-rw-r--r--   1 kiran  staff     7 26 Jul 10:36 .gitignore
-rw-r--r--   1 kiran  staff   751 26 Jul 10:36 proguard-rules.pro
drwxr-xr-x   5 kiran  staff   160 26 Jul 10:36 src
drwxr-xr-x   3 kiran  staff    96  8 Aug 13:53 .gradle
drwxr-xr-x  10 kiran  staff   320  8 Aug 13:57 build
-rw-r--r--   1 kiran  staff  3905  8 Aug 16:04 projwar.keystore
drwxr-xr-x  28 kiran  staff   896  8 Aug 16:12 ..
-rw-r--r--   1 kiran  staff  2346  8 Aug 16:13 build.gradle
drwxr-xr-x   9 kiran  staff   288  8 Aug 16:13 .

~/Documents/GIT/projwar/projrji-mobile-android on  develop! ⌚ 16:25:15
```

#### Adapt the gradle properties to define keys that needs to be used for APK signing.

Note: Line #21 to #24 below.
```
~/Documents/GIT/projwar/projrji-mobile-android on  develop! ⌚ 16:16:49
$ cat gradle.properties
# Project-wide Gradle settings.
# IDE (e.g. Android Studio) users:
# Gradle settings configured through the IDE *will override*
# any settings specified in this file.
# For more details on how to configure your build environment visit
# http://www.gradle.org/docs/current/userguide/build_environment.html
# Specifies the JVM arguments used for the daemon process.
# The setting is particularly useful for tweaking memory settings.
org.gradle.jvmargs=-Xmx1536m
# When configured, Gradle will run in incubating parallel mode.
# This option should only be used with decoupled projects. More details, visit
# http://www.gradle.org/docs/current/userguide/multi_project_builds.html#sec:decoupled_projects
# org.gradle.parallel=true
# Kotlin code style for this project: "official" or "obsolete":
kotlin.code.style=official
gradle=build -x lint -x lintVitalRelease


PROJWAR_RELEASE_STORE_FILE=projwar.keystore
PROJWAR_RELEASE_KEY_ALIAS=projwar
PROJWAR_RELEASE_STORE_PASSWORD=MASKED
PROJWAR_RELEASE_KEY_PASSWORD=MASKED

~/Documents/GIT/projwar/projrji-mobile-android on  develop! ⌚ 16:16:51

#### Update your build.gradle to define and use the signing config.

Note: Line #23 to #32 and line #37 below.
```
~/Documents/GIT/projwar/projrji-mobile-android on  develop! ⌚ 16:16:51
$ cat app/build.gradle
apply plugin: 'com.android.application'

apply plugin: 'kotlin-android'

apply plugin: 'kotlin-android-extensions'

apply plugin: 'com.amazonaws.appsync'


android {
    compileSdkVersion 28
    defaultConfig {
        applicationId "com.projr.app.projrji"
        minSdkVersion 19
        targetSdkVersion 28
        versionCode 1
        versionName "1.0"
        testInstrumentationRunner "android.support.test.runner.AndroidJUnitRunner"
        vectorDrawables.useSupportLibrary = true
    }
    signingConfigs {
        release {
            if (project.hasProperty('PROJWAR_RELEASE_STORE_FILE')) {
                storeFile file(PROJWAR_RELEASE_STORE_FILE)
                storePassword PROJWAR_RELEASE_STORE_PASSWORD
                keyAlias PROJWAR_RELEASE_KEY_ALIAS
                keyPassword PROJWAR_RELEASE_KEY_PASSWORD
            }
        }
    }
    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
	        signingConfig signingConfigs.release
        }
    }
 lintOptions {
        checkReleaseBuilds false
        abortOnError false
    }


}

repositories {
    maven { url 'https://jitpack.io' }
}

dependencies {
    implementation fileTree(dir: 'libs', include: ['*.jar'])
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"
    implementation 'com.android.support:appcompat-v7:28.0.0'
    implementation 'com.android.support:design:28.0.0'
    implementation 'com.android.support.constraint:constraint-layout:1.1.3'
    implementation 'com.github.PhilJay:MPAndroidChart:v3.0.2'
    implementation 'com.android.support:support-vector-drawable:28.0.0'
    implementation 'com.android.support:support-v4:28.0.0'
    implementation 'com.google.android.gms:play-services-plus:16.0.0'
    //Base SDK
    implementation 'com.amazonaws:aws-android-sdk-core:2.13.+'
    //AppSync SDK
    implementation 'com.amazonaws:aws-android-sdk-appsync:2.8.+'
    implementation 'org.eclipse.paho:org.eclipse.paho.client.mqttv3:1.2.0'
    implementation 'org.eclipse.paho:org.eclipse.paho.android.service:1.1.1'
    testImplementation 'junit:junit:4.12'
    androidTestImplementation 'com.android.support.test:runner:1.0.2'
    androidTestImplementation 'com.android.support.test.espresso:espresso-core:3.0.2'
}

~/Documents/GIT/projwar/projrji-mobile-android on  develop! ⌚ 16:19:59
$
```

#### Run Build (with Signing)
```
~/Documents/GIT/projwar/projrji-mobile-android on  develop! ⌚ 16:14:35
$ ./gradlew assembleRelease

Deprecated Gradle features were used in this build, making it incompatible with Gradle 6.0.
Use '--warning-mode all' to show the individual deprecation warnings.
See https://docs.gradle.org/5.1.1/userguide/command_line_interface.html#sec:command_line_warnings

BUILD SUCCESSFUL in 7s
56 actionable tasks: 8 executed, 48 up-to-date

~/Documents/GIT/projwar/projrji-mobile-android on  develop! ⌚ 16:14:44
```

#### The Signed APK is now created in the Build Outputs Release directory.

```
~/Documents/GIT/projwar/projrji-mobile-android on  develop! ⌚ 16:15:05
$ ls -lart app/build/outputs/apk/release
total 25296
drwxr-xr-x  4 kiran  staff      128  8 Aug 13:56 ..
-rw-r--r--  1 kiran  staff  6425033  8 Aug 13:56 app-release-unsigned.apk
drwxr-xr-x  5 kiran  staff      160  8 Aug 16:14 .
-rw-r--r--  1 kiran  staff  6519767  8 Aug 16:14 app-release.apk
-rw-r--r--  1 kiran  staff      234  8 Aug 16:14 output.json

~/Documents/GIT/projwar/projrji-mobile-android on  develop! ⌚ 16:15:11
```
