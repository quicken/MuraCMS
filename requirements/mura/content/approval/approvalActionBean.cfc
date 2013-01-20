component extends="mura.bean.beanORM" table="tapprovalactions" {

	property name="actiontID" fieldtype="id";
    property name="parentID" ormtype="char" length="35";
    property name="requestID" ormtype="char" length="35";
    property name="chainID" ormtype="char" length="35";
    property name="groupID" ormtype="char" length="35";
    property name="userID" ormtype="char" length="35" default="" required=true;
    property name="siteID" ormtype="varchar" length="25" default="" required=true;
    property name="actionType" ormtype="varchar" length="50" default="" required=true;
    property name="created" ormtype="timestamp";
    property name="comments" ormtype="text";

    property name="approvalChain" fieldtype="many-to-one" 
        cfc="approvalChainBean" column="chainID" fkcolumn="chainID";
    
    property name="request" fieldtype="many-to-one" 
        cfc="approvalRequestBean" column="requestID" fkcolumn="requestID";
    
    property name="parent" fieldtype="many-to-one" 
        cfc="approvalActionBean" column="parentID" fkcolumn="actionID";

    property name="kids" singularname='kid' fieldtype="one-to-many" 
        cfc="approvalActionBean" column="actionID" fkcolumn="parentID";

    property name="group" fieldtype="many-to-one" cfc="user" 
        column="groupID" fkcolumn="userID";

    property name="user" fieldtype="many-to-one" cfc="user" 
        column="userID" fkcolumn="userID";
    

}