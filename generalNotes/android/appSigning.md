## Overview
When you use app signing by Google Play, your keys are stored on the same infrastructure that Google uses to store its own keys. Keys are protected by Google’s Key Management Service.

Android apps are signed with a private key. To ensure that app updates are trustworthy, the devices and services use the associated public certificate to verify that the app is from a trusted source. Devices only accept updates when its signature matches the installed app’s signature. 

**Note:** Using app signing by Google Play is optional. We can still upload an APK and manage our own keys instead of using an app bundle. However, if we lose your keystore or it becomes compromised, we won’t be able to update your app without publishing a new app with a new package name.

## Signing Process
1. Sign your app bundle or APK and upload it to your Play Console.
2. Depending on what you upload, here’s how the signing process differs:
2a. App bundle: Google generates optimized APKs from your app bundle and signs them with the app signing key. ← This is our Approach
2b. APK signed with upload key: Google verifies and strips your signature from the APK, and then resigns the APK with the app signing key.
2c. APK signed with app signing key: Google verifies the signature.
3. Google delivers signed APKs to users.

## On Google Play Console
Opt-In to AppSigning by Google for the chosen App
