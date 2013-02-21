component extends="mura.bean.beanORM"  table="tapprovalrequests"{

	property name="requestID" fieldtype="id";
    property name="created" type="timestamp";
    property name="approvalChain" fieldtype="many-to-one" cfc="approvalChainBean" fkcolumn="chainID";
    property name="content" fieldtype="many-to-one" cfc="approvalChainBean" fkcolumn="contentHistID";
    property name="user" fieldtype="many-to-one" cfc="user" fkcolumn="userID";
    property name="site" fieldtype="many-to-one" cfc="settingBean" fkcolumn="siteID";
    property name="group" fieldtype="many-to-one" cfc="user" fkcolumn="groupID";

}