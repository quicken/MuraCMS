component extends="mura.bean.beanORM"  table="tapprovalmemberships" {

	property name="membershipID" fieldtype="id";
    property name="orderno" type="int" default="1";
    property name="created" type="timestamp";
    property name="approvalChain" fieldtype="many-to-one" cfc="approvalChainBean" fkcolumn="chainID";   
    property name="group" fieldtype="many-to-one" cfc="user" fkcolumn="groupID";
    property name="site" fieldtype="many-to-one" cfc="user" fkcolumn="siteID";

}