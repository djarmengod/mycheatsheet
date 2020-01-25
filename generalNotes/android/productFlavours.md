## Example from app/build.gradle

```
android {
    productFlavors{
        devpf{

        }
        qapf{

        }
        prodpf{

        }
    }

}
```

## Directory Structure
```
ζ tree app/src
├── prodpf
│   └── java
│       └── com
│           └── colnny
│               └── app
│                   └── customer
│                       └── Constants.kt
├── qapf
│   └── java
│       └── com
│           └── colnny
│               └── app
│                   └── customer
│                       └── Constants.kt
└── test
    └── java
        └── com
            └── colnny
                └── app
                    └── customer
                        ├── ExampleUnitTest.kt
                        └── UtilsTest.kt
```

## App Bundle Build
```
assemble{flavourName}{BuildType}
```
