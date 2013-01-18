component extends="mura.bean.beanMuraORM"  table="tapprovalrequests"{

	property name="requestID" type="string" ormtype="char" length="35" fieldtype="id";
	property name="chainID" type="string" ormtype="char" length="35" fieldtype="index";
    property name="contentHistID" type="string" ormtype="char" length="35" fieldtype="index";
    property name="siteID" type="string" ormtype="varchar" length="25" fieldtype="index";
    property name="created" type="timestamp";
    property name="lastupdate" type="timestamp";
    property name="lastupdateby" type="string" length=50;
    property name="lastupdatebyid" type="string" dataType="char" length=35;


}