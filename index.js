'use strict';

// Import the Node.js modules
var objF5 = require('f5-nodejs');
var funStr = require('string');

// Create a new RPC server for listening to TCL iRule calls
var objILX = new objF5.ILXServer();

// Add a method that change DNS Flags
objILX.addMethod('SET_RD_BIT', function(objArgs, objResponse) {
	//console.log('Method Invoked, Arguments:', objArgs.params());
    var Original_Payload = objArgs.params()[0];
    if(Original_Payload[16] === "0"){
        Original_Payload = replaceAt(Original_Payload,23, "1");
        //console.log("bit 23 : " + Original_Payload);
        //console.log("bit 23 : " + Original_Payload[23]);
        //console.log("modified payload " + Original_Payload);
    }
    else {
        Original_Payload = replaceAt(Original_Payload,23, "0");
        Original_Payload = replaceAt(Original_Payload,24, "0");
        //console.log("bit 23 : " + Original_Payload);
        //console.log("bit 23 : " + Original_Payload[23]);
        //console.log("modified payload " + Original_Payload);
    }
    var New_Payload =  Original_Payload;
	objResponse.reply(New_Payload);
}); //.addMethod

// Start listening for ILX::call events
objILX.listen();
//console.log('Running index.js, RPC Server Started.');


console.log("Node.js is running");

function replaceAt(string, index, replace) {
  return string.substring(0, index) + replace + string.substring(index + 1);
}
