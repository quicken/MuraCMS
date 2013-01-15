component persistent="true" extends="mura.bean.bean" {

	property name="chainID" type="string" length="35" fieldtype="id";
    property name="siteID" type="string" length="25" default="" required=true;
    property name="name" type="string" length="100" required=true;
    property name="description" type="text";
    property name="created" type="timestamp";
    property name="lastupdate" type="timestamp";
    property name="lastupdateby" type="string" length="50";
    property name="lastupdatebyid" type="string" length="35";
    function init() {
    	super.init();
    	variables.chainID=createUUID();
    }

}