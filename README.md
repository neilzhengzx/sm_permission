
# react-native-sm-permission

## Getting started

`$ npm install react-native-sm-permission --save`

### Mostly automatic installation

`$ react-native link react-native-sm-permission`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-sm-permission` and add `SMOSmPermission.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libSMOSmPermission.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.sm_permission.SMOSmPermissionPackage;` to the imports at the top of the file
  - Add `new SMOSmPermissionPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-sm-permission'
  	project(':react-native-sm-permission').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-sm-permission/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-sm-permission')
  	```


## Usage
```javascript
import SMOSmPermission from 'react-native-sm-permission';

// TODO: What to do with the module?
SMOSmPermission;
```
  