component extends="mura.bean.beanMuraORM"  table="tapprovalassignments" {

	property name="assignmentID" type="string" length="35" fieldtype="id";
	property name="chainID" type="string" length="35";
    property name="groupID" type="string" length="35";
    property name="siteID" type="string" length="25" default="" required=true;
    property name="orderno" type="int";
    property name="created" type="timestamp";

    function init() {
    	super.init();
    	variables.instance.assignmentID=createUUID();
    }


}