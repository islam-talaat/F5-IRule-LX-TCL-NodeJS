when SERVER_DATA {
    #read Payload length, HEX and binary
    set OLD_Length [UDP::payload length]
    binary scan [UDP::payload] H* HEX_Payload
    log local0.info "**********************************************************************"
    log local0.info "**********************************************************************"
    log local0.info "HEX_Payload: $HEX_Payload"
    log local0.info "Old Length: $OLD_Length"
    binary scan [binary format H* $HEX_Payload] B* Binary_Payload
    log local0.info "Binary_Payload: $Binary_Payload"
    #set New_Bin_Payload 0
    #set BIN_RD_Flag 0
    
    #rpc_handle
    set rpc_handle [ILX::init DNS-RD-Plugin DNS-RD-Extention]
    
    set rpc_resp [ILX::call $rpc_handle -timeout 3000 SET_RD_BIT $Binary_Payload]
    
    
    log local0.info "result of Nodejs : $rpc_resp"
    
    #EMpty Paylaod
    set empty_variable [binary format B* 0 ]
    UDP::payload replace 0 [UDP::payload length] $empty_variable
    
    # Send New Payload
    binary scan [UDP::payload] B* HHEX_Payload
    log local0.info "empty HEX_Payload: $HHEX_Payload"
    set packetdata [binary format B* $rpc_resp ]
    #log local0.info "Packet-date: $packetdata"
    UDP::payload replace 0 1 $packetdata
    #binary scan [binary format B* $BIN_RD_Flag] H* HEX_RD_Flag
    binary scan [UDP::payload] B* HHHEX_Payload
    log local0.info "HHHEX_Payload: $HHHEX_Payload"

    
    
    #log local0.info "New Binary_Payload : $New_Bin_Payload"


}
