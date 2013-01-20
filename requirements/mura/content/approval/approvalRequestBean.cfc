component extends="mura.bean.beanORM"  table="tapprovalrequests"{

	property name="requestID" type="string" ormtype="char" length="35" fieldtype="id";
	property name="chainID" type="string" ormtype="char" length="35" fieldtype="index";
    property name="contentHistID" type="string" ormtype="char" length="35" fieldtype="index";
    property name="siteID" type="string" ormtype="varchar" length="25" fieldtype="index";
    property name="created" type="timestamp";
    property name="userID" type="string" dataType="char" length=35;

    property name="approvalChain" fieldtype="many-to-one" cfc="approvalChainBean" 
    	column="chainID" fkcolumn="chainID";

    property name="content" fieldtype="many-to-one" cfc="approvalChainBean" 
    	column="contentHistID" fkcolumn="contentHistID";
    	
    property name="user" fieldtype="many-to-one" cfc="user" 
    	column="userID" fkcolumn="userID";


}