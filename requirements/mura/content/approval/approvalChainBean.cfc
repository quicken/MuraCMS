component extends="mura.bean.beanMuraORM"  table="tapprovalchains"{

	property name="chainID" type="string" ormtype="char" length=35 nullable=false default="" fieldtype="id";
    property name="siteID" type="string" length=25 fieldtype="index";
    property name="name" type="string" length="100";
    property name="description" type="text";
    property name="created" type="timestamp";
    property name="lastupdate" type="timestamp";
    property name="lastupdateby" type="string" length=50;
    property name="lastupdatebyid" type="string" dataType="char" length=35;

    property name="assignments" fieldtype="one-to-many" cfc="approvalChainAssignmentBean"
        fkcolumn="chainID" orderby="orderno asc"
        cascade="delete";

    property name="requests" fieldtype="one-to-many" cfc="approvalRequestBean"
        fkcolumn="chainID" orderby="created asc"
        cascade="delete";
    


}