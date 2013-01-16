component extends="mura.bean.bean"  table="tapprovalrequests"{

	property name="requestID" ormtype="char" length="35" fieldtype="id";
	property name="chainID" ormtype="char" length="35";
    property name="contentHistID" ormtype="char" length="35";
    property name="siteID" ormtype="vachar" length="25" default="" required=true;

    function init() {
    	super.init();
    	variables.instance.requestID=createUUID();
    }

}