component persistent="true" extends="mura.bean.bean" {

	property name="requestID" type="string" length="35";
	property name="chainID" type="string" length="35";
    property name="contentHistID" type="string" length="35";
    property name="siteID" type="string" length="25" default="" required=true;

    function init() {
    	super.init();
    	variables.requestID=createUUID();
    }

}