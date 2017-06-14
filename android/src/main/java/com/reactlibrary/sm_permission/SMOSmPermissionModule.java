
package com.reactlibrary.sm_permission;

import android.Manifest;
import android.content.pm.PackageManager;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;

public class SMOSmPermissionModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public SMOSmPermissionModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "SMOSmPermission";
  }
  
  @ReactMethod
  public void getLocationEnable(ReadableMap params, Callback callback){
    WritableMap response = Arguments.createMap();
    if(checkPermission(Manifest.permission.ACCESS_COARSE_LOCATION))
    {
      response.putInt("enable", 0);
    }else{
      response.putInt("enable", 1);
    }
    callback.invoke(response);
  }

  @ReactMethod
  public void getAlbumEnable(ReadableMap params, Callback callback){
    WritableMap response = Arguments.createMap();
    if(checkPermission(Manifest.permission.READ_EXTERNAL_STORAGE) || checkPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE))
    {
      response.putInt("enable", 0);
    }else{
      response.putInt("enable", 1);
    }
    callback.invoke(response);
  }

  @ReactMethod
  public void getCameraEnable(ReadableMap params, Callback callback){
    WritableMap response = Arguments.createMap();
    if(checkPermission(Manifest.permission.CAMERA) || checkPermission(Manifest.permission.READ_EXTERNAL_STORAGE)
            || checkPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE))
    {
      response.putInt("enable", 0);
    }else{
      response.putInt("enable", 1);
    }
    callback.invoke(response);
  }

  @ReactMethod
  public void getInformEnable(ReadableMap params, Callback callback){
    WritableMap response = Arguments.createMap();
    response.putInt("enable", 1);
    callback.invoke(response);
  }

  @ReactMethod
  public void getRecordEnable(ReadableMap params, Callback callback){
    WritableMap response = Arguments.createMap();
    if(checkPermission(Manifest.permission.RECORD_AUDIO))
    {
      response.putInt("enable", 0);
    }else{
      response.putInt("enable", 1);
    }
    callback.invoke(response);
  }

  @ReactMethod
  public void getPhoneEnable(ReadableMap params, Callback callback){
    WritableMap response = Arguments.createMap();
    if(checkPermission(Manifest.permission.CALL_PHONE))
    {
      response.putInt("enable", 0);
    }else{
      response.putInt("enable", 1);
    }
    callback.invoke(response);
  }

  @ReactMethod
  public void getAddressEnable(ReadableMap params, Callback callback){
    WritableMap response = Arguments.createMap();
    if(checkPermission(Manifest.permission.READ_CONTACTS) || checkPermission(Manifest.permission.WRITE_CONTACTS))
    {
      response.putInt("enable", 0);
    }else{
      response.putInt("enable", 1);
    }
    callback.invoke(response);
  }

  @ReactMethod
  public void getReadStorage(ReadableMap params, Callback callback){
    WritableMap response = Arguments.createMap();
    if(checkPermission(Manifest.permission.READ_EXTERNAL_STORAGE) || checkPermission(Manifest.permission.WRITE_EXTERNAL_STORAGE))
    {
      response.putInt("enable", 0);
    }else{
      response.putInt("enable", 1);
    }
    callback.invoke(response);
  }

  public boolean checkPermission(String permission)
  {
    if(ContextCompat.checkSelfPermission(getCurrentActivity(), permission) != PackageManager.PERMISSION_GRANTED
            && ActivityCompat.shouldShowRequestPermissionRationale(getCurrentActivity(), permission))
    {
      return true;
    }
    return false;
  }
}