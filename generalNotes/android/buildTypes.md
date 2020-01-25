## Example from app/build.gradle

```
android {
    buildTypes {
        dev {
            getProps('./config/dev.props').each { p ->
               buildConfigField 'String', p.key, p.value
            }
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
            signingConfig signingConfigs.release
        }
        qa {
            getProps('./config/qa.props').each { p ->
               buildConfigField 'String', p.key, p.value
            }
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
            signingConfig signingConfigs.release
        }
        prod {
            getProps('./config/prod.props').each { p ->
               buildConfigField 'String', p.key, p.value
            }
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
            signingConfig signingConfigs.release
        }
        release {
            getProps('./config/prod.props').each { p ->
               buildConfigField 'String', p.key, p.value
            }
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
            signingConfig signingConfigs.release
        }
    }
}

def getProps(path) {
    Properties props = new Properties()
    props.load(new FileInputStream(file(path)))
    return props
}

```

## Config Params
```
ζ tree app/config                                                                                                                                                       [c6f413d]
app/config
├── dev.props
├── prod.props
└── qa.props

0 directories, 3 files

ζ cat app/config/*                                                                                                                                                      [c6f413d]
APIENDPOINT="https://dapi.company.com"
APIENDPOINT="https://api.company.com"
APIENDPOINT="https://tapi.company.com"
```

## App Bundle Build
```
assemble{flavourName}{BuildType}
```
