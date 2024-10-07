include "console.iol"
include "ui/ui.iol"
include "ui/swing_ui.iol"
include "interface.iol"

outputPort BankService {
	Location: "socket://localhost:8000"
	Protocol: sodep
	Interfaces: BankAccountInterface
}

main
{
	showInputDialog@SwingUI( "Insert your name" )( request.username );
	keepRunning = true;
	login@BankService( request )( response );
	opMessage.sid = response.sid;
	println@Console( "Server Responded: " + response.message + "\t sid: "+opMessage.sid )();
	while( keepRunning ){
		showInputDialog@SwingUI( "Insert a message or type \"logout\" for logging out." )( BankOperation.operation );
		if( BankOperation.operation == "deposit" ){
            showInputDialog@SwingUI( "" )()
			deposit@BankService( opMessage )()
		}
        if( BankOperation.operation == "withdraw" ){
            withdraw@BankService( opMessage )()
        }
        if( BankOperation.operation == "balance" ){
            balance@BankService( opMessage )()
        }
        if( BankOperation.operation == "logout" ){
			logout@BankService( opMessage );
			keepRunning = false
		}
	}
}