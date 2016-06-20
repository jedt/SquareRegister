/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  Linking,
  NativeModules
} from 'react-native';

var SquareManager = NativeModules.SquareManager;

class SquareRegister extends Component {
  componentDidMount() {
  }

  render() {
    return (
      <View style={styles.container}>
        <TouchableOpacity onPress={()=>{
          SquareManager.createSquarePayment('10000', 'USD', 'Rental Fee');

          // var json = {
          //   "amount_money": {
          //     "amount": "10000",
          //     "currency_code": "USD"
          //   },
          //   //"callback_url": "my-square-register://payment-complete",
          //   "client_id": "sq0idp-Vw0gCInu2spnTqooMxSMeA",
          //   "notes": "Rental fee",
          //   "options": {
          //     "supported_tender_types": [
          //       "CREDIT_CARD"
          //     ]
          //   }
          // };

          // var url = 'square-commerce-v1://payment/create?data='+encodeURIComponent(JSON.stringify(json));

          // Linking.openURL(url).catch(err => console.error('An error occurred', err));
        }}>
          <Text>Open Square Link</Text>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('SquareRegister', () => SquareRegister);
