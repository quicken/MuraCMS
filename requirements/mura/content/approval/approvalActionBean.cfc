component extends="mura.bean.bean" table="tapprovalactions" {

	property name="actiontID" ormtype="char" length="35" fieldtype="id";
    property name="parentID" ormtype="char" length="35";
    property name="requestID" ormtype="char" length="35";
    property name="chainID" ormtype="char" length="35";
    property name="groupID" ormtype="char" length="35";
    property name="userID" ormtype="char" length="35" default="" required=true;
    property name="siteID" ormtype="varchar" length="25" default="" required=true;
    property name="actionType" ormtype="varchar" length="50" default="" required=true;
    property name="created" ormtype="timestamp";
    property name="comments" ormtype="text";

    function init() {
    	super.init();
    	variables.actiontID=createUUID();

    	if(not isDate(variables.created)){
    		variables.instance.created=now();
    	}
  
    }

}