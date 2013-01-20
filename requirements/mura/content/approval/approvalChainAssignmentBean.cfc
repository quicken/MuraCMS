component extends="mura.bean.beanORM"  table="tapprovalassignments" {

	property name="assignmentID" type="string" length="35" fieldtype="id";
	property name="chainID" type="string" ormtype="char" length="35" fieldtype="index";
    property name="groupID" type="string" ormtype="char" length="35" fieldtype="index";
    property name="siteID" type="string" length="25";
    property name="orderno" type="int" default="1";
    property name="created" type="timestamp";

    property name="approvalChain" fieldtype="many-to-one" cfc="approvalChainBean";
    property name="group" fieldtype="many-to-one" cfc="user" column="groupID" fkcolumn="userID";


}