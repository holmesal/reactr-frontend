
#include <SPI.h>
#include <WiFi.h>
//#include <WebSocketClient.h>
#include "SocketIOClient.h"

byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
char server[] = "api.reactr.co";
int port = 3000;
//WebSocketClient client;
SocketIOClient client;

int status = WL_IDLE_STATUS;
char ssid[] = "Black Betty";      //  SSID
char pass[] = "skynetinc";      // pass

void setup() {
  
  Serial.begin(9600);
  
  while (WiFi.status() == WL_NO_SHIELD) {
    Serial.println("WiFi shield not present"); 
    // don't continue:
    while(true);
    
  } 
  
  Serial.println("attempting to connect to wifi...");
  
  Serial.println("Scanning available networks...");
  listNetworks();
  
   while ( status != WL_CONNECTED) { 
     
     Serial.print("Attempting to connect to WPA SSID: ");
      Serial.println(ssid);

    status = WiFi.begin(ssid, pass);

    // wait 1 second for connection:
    delay(10000);
  } 
  
  Serial.println("Sending data!");
  client.connect(server);
  client.setDataArrivedDelegate(dataArrived);
  client.send("Hello World!");
}

void loop() {
  client.monitor();
}

//void dataArrived(SocketIOClient client, String data) {
  void dataArrived(SocketIOClient client, char *data) {
  Serial.println(data);
}

void listNetworks() {
  // scan for nearby networks:
  Serial.println("** Scan Networks **");
  int numSsid = WiFi.scanNetworks();
  if (numSsid == -1)
  { 
    Serial.println("Couldn't get a wifi connection");
    while(true);
  } 

  // print the list of networks seen:
  Serial.print("number of available networks:");
  Serial.println(numSsid);

  // print the network number and name for each network found:
  for (int thisNet = 0; thisNet<numSsid; thisNet++) {
    Serial.print(thisNet);
    Serial.print(") ");
    Serial.print(WiFi.SSID(thisNet));
    Serial.print("\tSignal: ");
    Serial.print(WiFi.RSSI(thisNet));
    Serial.print(" dBm");
    Serial.print("\tEncryption: ");
    printEncryptionType(WiFi.encryptionType(thisNet));
  }
}

void printEncryptionType(int thisType) {
  // read the encryption type and print out the name:
  switch (thisType) {
  case ENC_TYPE_WEP:
    Serial.println("WEP");
    break;
  case ENC_TYPE_TKIP:
    Serial.println("WPA");
    break;
  case ENC_TYPE_CCMP:
    Serial.println("WPA2");
    break;
  case ENC_TYPE_NONE:
    Serial.println("None");
    break;
  case ENC_TYPE_AUTO:
    Serial.println("Auto");
    break;
  } 
}
