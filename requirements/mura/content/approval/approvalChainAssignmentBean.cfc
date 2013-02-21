component extends="mura.bean.beanORM" table="tapprovalassignments" {

	property name="assignmentID" fieldtype="id";
    property name="approvalChain" fieldtype="many-to-one" cfc="approvalChainBean" fkcolumn="chainID";
    property name="content" fieldtype="many-to-one" cfc="approvalChainBean" fkcolumn="contentID"; 
    property name="site" fieldtype="many-to-one" cfc="user" fkcolumn="siteID";

}