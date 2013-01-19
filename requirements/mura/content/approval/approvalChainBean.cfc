component extends="mura.bean.beanORM"  table="tapprovalchains"{

	property name="chainID" type="string" ormtype="char" length=35 nullable=false default="" fieldtype="id";
    property name="siteID" type="string" length=25 fieldtype="index";
    property name="name" type="string" length="100";
    property name="description" type="text";
    property name="created" type="timestamp";
    property name="lastupdate" type="timestamp";
    property name="lastupdateby" type="string" length=50;
    property name="lastupdatebyid" type="string" dataType="char" length=35;

    property name="assignments" singularname="assignment" fieldtype="one-to-many" 
        cfc="approvalChainAssignmentBean" orderby="orderno asc" cascade="delete";

    property name="requests" singularname="assignment" fieldtype="one-to-many" 
        cfc="approvalRequestBean" orderby="created asc" cascade="delete";
    
}