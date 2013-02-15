<!--- This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on 
Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with 
independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without 
Mura CMS under the license of your choice, provided that you follow these specific guidelines: 

Your custom code 

• Must not alter any default objects in the Mura CMS database and
• May not alter the default display of the Mura CMS logo within Mura CMS and
• Must not alter any files in the following directories.

 /admin/
 /tasks/
 /config/
 /requirements/mura/
 /Application.cfc
 /index.cfm
 /MuraProxy.cfc

You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work 
under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL 
requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your 
modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License 
version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS.
--->
<cfinclude template="js.cfm">
<cfset typeList="1^tusers^userID^tclassextenddatauseractivity,2^tusers^userID^tclassextenddatauseractivity,Address^tuseraddresses^addressID^tclassextenddatauseractivity,Page^tcontent^contentHistID^tclassextenddata,Folder^tcontent^contentHistID^tclassextenddata,File^tcontent^contentHistID^tclassextenddata,Calendar^tcontent^contentHistID^tclassextenddata,Gallery^tcontent^contentHistID^tclassextenddata,Link^tcontent^contentHistID^tclassextenddata,Component^tcontent^contentHistID^tclassextenddata,Custom^custom^ID^tclassextenddata,Site^tsettings^baseID^tclassextenddata,Base^tcontent^contentHistID^tclassextenddata"/>
<cfset subType=application.classExtensionManager.getSubTypeByID(rc.subTypeID)>
<h1><cfif len(rc.subTypeID)>Edit<cfelse>Add</cfif> Class Extension</h1>

<cfoutput>
<div id="nav-module-specific" class="btn-group">
<a class="btn" href="index.cfm?muraAction=cExtend.listSubTypes&siteid=#URLEncodedFormat(rc.siteid)#"><i class="icon-circle-arrow-left"></i> Back to Class Extensions</a>
</div>

<form class="fieldset-wrap" novalidate="novalidate" name="subTypeFrm" method="post" action="index.cfm" onsubit="return validateForm(this);">

	<div class="fieldset">
		<div class="control-group">
	<div class="span4">
		<label class="control-label">Base Type</label>
		<div class="controls"><select name="typeSelector" id="typeSelector" required="true" message="The BASE CLASS field is required." onchange="extendManager.setBaseInfo(this.value);">
			<option value="">Select</option>
			<cfloop list="#typeList#" index="t"><option value="#t#" <cfif listFirst(t,'^') eq subType.getType()>selected</cfif>>#application.classExtensionManager.getTypeAsString(listFirst(t,'^'))#</option></cfloop>
			</select>
			</div>
		</div>
		<div class="span4 subTypeContainer"<cfif subtype.getType() eq "Site"> style="display:none;"</cfif>>
			<label class="control-label">Sub Type</label>
			<div class="controls">
				<input class="span12" name="subType" id="subType" type="text" value="#HTMLEditFormat(subType.getSubType())#" required="true" maxlength="25"/>
			</div>
		</div>
		
		
	</div>
	
	<div class="control-group"<cfif subtype.getType() eq "Site"> style="display:none;"</cfif>>
		<div class="span4 SubTypeIconSelect">
			<label class="control-label">Icon</label>
              <div class="btn-group">
                <button class="btn"><i class="icon-flag icon-large"></i></button>
                <button class="btn dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>

				    <ul class="dropdown-menu">
				      <li><i class="icon-adjust icon-2x icon-border icon-2x icon-border"></i></li>
				      <li><i class="icon-asterisk icon-2x icon-border"></i></li>
				      <li><i class="icon-ban-circle icon-2x icon-border"></i></li>
				      <li><i class="icon-bar-chart icon-2x icon-border"></i></li>
				      <li><i class="icon-barcode icon-2x icon-border"></i></li>
				      <li><i class="icon-beaker icon-2x icon-border"></i></li>
				      <li><i class="icon-beer icon-2x icon-border"></i></li>
				      <li><i class="icon-bell icon-2x icon-border"></i></li>
				      <li><i class="icon-bell-alt icon-2x icon-border"></i></li>
				      <li><i class="icon-bolt icon-2x icon-border"></i></li>
				      <li><i class="icon-book icon-2x icon-border"></i></li>
				      <li><i class="icon-bookmark icon-2x icon-border"></i></li>
				      <li><i class="icon-bookmark-empty icon-2x icon-border"></i></li>
				      <li><i class="icon-briefcase icon-2x icon-border"></i></li>
				      <li><i class="icon-bullhorn icon-2x icon-border"></i></li>
				      <li><i class="icon-calendar icon-2x icon-border"></i></li>
				      <li><i class="icon-camera icon-2x icon-border"></i></li>
				      <li><i class="icon-camera-retro icon-2x icon-border"></i></li>
				      <li><i class="icon-certificate icon-2x icon-border"></i></li>
				      <li><i class="icon-check icon-2x icon-border"></i></li>
				      <li><i class="icon-check-empty icon-2x icon-border"></i></li>
				      <li><i class="icon-circle icon-2x icon-border"></i></li>
				      <li><i class="icon-circle-blank icon-2x icon-border"></i></li>
				      <li><i class="icon-cloud icon-2x icon-border"></i></li>
				      <li><i class="icon-cloud-download icon-2x icon-border"></i></li>
				      <li><i class="icon-cloud-upload icon-2x icon-border"></i></li>
				      <li><i class="icon-coffee icon-2x icon-border"></i></li>
				      <li><i class="icon-cog icon-2x icon-border"></i></li>
				      <li><i class="icon-cogs icon-2x icon-border"></i></li>
				      <li><i class="icon-comment icon-2x icon-border"></i></li>
				      <li><i class="icon-comment-alt icon-2x icon-border"></i></li>
				      <li><i class="icon-comments icon-2x icon-border"></i></li>
				      <li><i class="icon-comments-alt icon-2x icon-border"></i></li>
				      <li><i class="icon-credit-card icon-2x icon-border"></i></li>
				      <li><i class="icon-dashboard icon-2x icon-border"></i></li>
				      <li><i class="icon-desktop icon-2x icon-border"></i></li>
				      <li><i class="icon-download icon-2x icon-border"></i></li>
				      <li><i class="icon-download-alt icon-2x icon-border"></i></li>
				      <li><i class="icon-edit icon-2x icon-border"></i></li>
				      <li><i class="icon-envelope icon-2x icon-border"></i></li>
				      <li><i class="icon-envelope-alt icon-2x icon-border"></i></li>
				      <li><i class="icon-exchange icon-2x icon-border"></i></li>
				      <li><i class="icon-exclamation-sign icon-2x icon-border"></i></li>
				      <li><i class="icon-external-link icon-2x icon-border"></i></li>
				      <li><i class="icon-eye-close icon-2x icon-border"></i></li>
				      <li><i class="icon-eye-open icon-2x icon-border"></i></li>
				      <li><i class="icon-facetime-video icon-2x icon-border"></i></li>
				      <li><i class="icon-fighter-jet icon-2x icon-border"></i></li>
				      <li><i class="icon-film icon-2x icon-border"></i></li>
				      <li><i class="icon-filter icon-2x icon-border"></i></li>
				      <li><i class="icon-fire icon-2x icon-border"></i></li>
				      <li><i class="icon-flag icon-2x icon-border"></i></li>
				      <li><i class="icon-folder-close icon-2x icon-border"></i></li>
				      <li><i class="icon-folder-open icon-2x icon-border"></i></li>
				      <li><i class="icon-folder-close-alt icon-2x icon-border"></i></li>
				      <li><i class="icon-folder-open-alt icon-2x icon-border"></i></li>
				      <li><i class="icon-food icon-2x icon-border"></i></li>
				      <li><i class="icon-gift icon-2x icon-border"></i></li>
				      <li><i class="icon-glass icon-2x icon-border"></i></li>
				      <li><i class="icon-globe icon-2x icon-border"></i></li>
				      <li><i class="icon-group icon-2x icon-border"></i></li>
				      <li><i class="icon-hdd icon-2x icon-border"></i></li>
				      <li><i class="icon-headphones icon-2x icon-border"></i></li>
				      <li><i class="icon-heart icon-2x icon-border"></i></li>
				      <li><i class="icon-heart-empty icon-2x icon-border"></i></li>
				      <li><i class="icon-home icon-2x icon-border"></i></li>
				      <li><i class="icon-inbox icon-2x icon-border"></i></li>
				      <li><i class="icon-info-sign icon-2x icon-border"></i></li>
				      <li><i class="icon-key icon-2x icon-border"></i></li>
				      <li><i class="icon-leaf icon-2x icon-border"></i></li>
				      <li><i class="icon-laptop icon-2x icon-border"></i></li>
				      <li><i class="icon-legal icon-2x icon-border"></i></li>
				      <li><i class="icon-lemon icon-2x icon-border"></i></li>
				      <li><i class="icon-lightbulb icon-2x icon-border"></i></li>
				      <li><i class="icon-lock icon-2x icon-border"></i></li>
				      <li><i class="icon-unlock icon-2x icon-border"></i></li>
				      <li><i class="icon-magic icon-2x icon-border"></i></li>
				      <li><i class="icon-magnet icon-2x icon-border"></i></li>
				      <li><i class="icon-map-marker icon-2x icon-border"></i></li>
				      <li><i class="icon-minus icon-2x icon-border"></i></li>
				      <li><i class="icon-minus-sign icon-2x icon-border"></i></li>
				      <li><i class="icon-mobile-phone icon-2x icon-border"></i></li>
				      <li><i class="icon-money icon-2x icon-border"></i></li>
				      <li><i class="icon-move icon-2x icon-border"></i></li>
				      <li><i class="icon-music icon-2x icon-border"></i></li>
				      <li><i class="icon-off icon-2x icon-border"></i></li>
				      <li><i class="icon-ok icon-2x icon-border"></i></li>
				      <li><i class="icon-ok-circle icon-2x icon-border"></i></li>
				      <li><i class="icon-ok-sign icon-2x icon-border"></i></li>
				      <li><i class="icon-pencil icon-2x icon-border"></i></li>
				      <li><i class="icon-picture icon-2x icon-border"></i></li>
				      <li><i class="icon-plane icon-2x icon-border"></i></li>
				      <li><i class="icon-plus icon-2x icon-border"></i></li>
				      <li><i class="icon-plus-sign icon-2x icon-border"></i></li>
				      <li><i class="icon-print icon-2x icon-border"></i></li>
				      <li><i class="icon-pushpin icon-2x icon-border"></i></li>
				      <li><i class="icon-qrcode icon-2x icon-border"></i></li>
				      <li><i class="icon-question-sign icon-2x icon-border"></i></li>
				      <li><i class="icon-quote-left icon-2x icon-border"></i></li>
				      <li><i class="icon-quote-right icon-2x icon-border"></i></li>
				      <li><i class="icon-random icon-2x icon-border"></i></li>
				      <li><i class="icon-refresh icon-2x icon-border"></i></li>
				      <li><i class="icon-remove icon-2x icon-border"></i></li>
				      <li><i class="icon-remove-circle icon-2x icon-border"></i></li>
				      <li><i class="icon-remove-sign icon-2x icon-border"></i></li>
				      <li><i class="icon-reorder icon-2x icon-border"></i></li>
				      <li><i class="icon-reply icon-2x icon-border"></i></li>
				      <li><i class="icon-resize-horizontal icon-2x icon-border"></i></li>
				      <li><i class="icon-resize-vertical icon-2x icon-border"></i></li>
				      <li><i class="icon-retweet icon-2x icon-border"></i></li>
				      <li><i class="icon-road icon-2x icon-border"></i></li>
				      <li><i class="icon-rss icon-2x icon-border"></i></li>
				      <li><i class="icon-screenshot icon-2x icon-border"></i></li>
				      <li><i class="icon-search icon-2x icon-border"></i></li>
				      <li><i class="icon-share icon-2x icon-border"></i></li>
				      <li><i class="icon-share-alt icon-2x icon-border"></i></li>
				      <li><i class="icon-shopping-cart icon-2x icon-border"></i></li>
				      <li><i class="icon-signal icon-2x icon-border"></i></li>
				      <li><i class="icon-signin icon-2x icon-border"></i></li>
				      <li><i class="icon-signout icon-2x icon-border"></i></li>
				      <li><i class="icon-sitemap icon-2x icon-border"></i></li>
				      <li><i class="icon-sort icon-2x icon-border"></i></li>
				      <li><i class="icon-sort-down icon-2x icon-border"></i></li>
				      <li><i class="icon-sort-up icon-2x icon-border"></i></li>
				      <li><i class="icon-spinner icon-2x icon-border"></i></li>
				      <li><i class="icon-star icon-2x icon-border"></i></li>
				      <li><i class="icon-star-empty icon-2x icon-border"></i></li>
				      <li><i class="icon-star-half icon-2x icon-border"></i></li>
				      <li><i class="icon-tablet icon-2x icon-border"></i></li>
				      <li><i class="icon-tag icon-2x icon-border"></i></li>
				      <li><i class="icon-tags icon-2x icon-border"></i></li>
				      <li><i class="icon-tasks icon-2x icon-border"></i></li>
				      <li><i class="icon-thumbs-down icon-2x icon-border"></i></li>
				      <li><i class="icon-thumbs-up icon-2x icon-border"></i></li>
				      <li><i class="icon-time icon-2x icon-border"></i></li>
				      <li><i class="icon-tint icon-2x icon-border"></i></li>
				      <li><i class="icon-trash icon-2x icon-border"></i></li>
				      <li><i class="icon-trophy icon-2x icon-border"></i></li>
				      <li><i class="icon-truck icon-2x icon-border"></i></li>
				      <li><i class="icon-umbrella icon-2x icon-border"></i></li>
				      <li><i class="icon-upload icon-2x icon-border"></i></li>
				      <li><i class="icon-upload-alt icon-2x icon-border"></i></li>
				      <li><i class="icon-user icon-2x icon-border"></i></li>
				      <li><i class="icon-user-md icon-2x icon-border"></i></li>
				      <li><i class="icon-volume-off icon-2x icon-border"></i></li>
				      <li><i class="icon-volume-down icon-2x icon-border"></i></li>
				      <li><i class="icon-volume-up icon-2x icon-border"></i></li>
				      <li><i class="icon-warning-sign icon-2x icon-border"></i></li>
				      <li><i class="icon-wrench icon-2x icon-border"></i></li>
				      <li><i class="icon-zoom-in icon-2x icon-border"></i></li>
				      <li><i class="icon-zoom-out icon-2x icon-border"></i></li>
				      
				      <li><i class="icon-file icon-2x icon-border"></i></li>
				      <li><i class="icon-file-alt icon-2x icon-border"></i></li>
				      <li><i class="icon-cut icon-2x icon-border"></i></li>
				      <li><i class="icon-copy icon-2x icon-border"></i></li>
				      <li><i class="icon-paste icon-2x icon-border"></i></li>
				      <li><i class="icon-save icon-2x icon-border"></i></li>
				      <li><i class="icon-undo icon-2x icon-border"></i></li>
				      <li><i class="icon-repeat icon-2x icon-border"></i></li>
				      <li><i class="icon-text-height icon-2x icon-border"></i></li>
				      <li><i class="icon-text-width icon-2x icon-border"></i></li>
				      <li><i class="icon-align-left icon-2x icon-border"></i></li>
				      <li><i class="icon-align-center icon-2x icon-border"></i></li>
				      <li><i class="icon-align-right icon-2x icon-border"></i></li>
				      <li><i class="icon-align-justify icon-2x icon-border"></i></li>
				      <li><i class="icon-indent-left icon-2x icon-border"></i></li>
				      <li><i class="icon-indent-right icon-2x icon-border"></i></li>
				      <li><i class="icon-font icon-2x icon-border"></i></li>
				      <li><i class="icon-bold icon-2x icon-border"></i></li>
				      <li><i class="icon-italic icon-2x icon-border"></i></li>
				      <li><i class="icon-strikethrough icon-2x icon-border"></i></li>
				      <li><i class="icon-underline icon-2x icon-border"></i></li>
				      <li><i class="icon-link icon-2x icon-border"></i></li>
				      <li><i class="icon-paper-clip icon-2x icon-border"></i></li>
				      <li><i class="icon-columns icon-2x icon-border"></i></li>
				      <li><i class="icon-table icon-2x icon-border"></i></li>
				      <li><i class="icon-th-large icon-2x icon-border"></i></li>
				      <li><i class="icon-th icon-2x icon-border"></i></li>
				      <li><i class="icon-th-list icon-2x icon-border"></i></li>
				      <li><i class="icon-list icon-2x icon-border"></i></li>
				      <li><i class="icon-list-ol icon-2x icon-border"></i></li>
				      <li><i class="icon-list-ul icon-2x icon-border"></i></li>
				      <li><i class="icon-list-alt icon-2x icon-border"></i></li>
      
				      <li><i class="icon-angle-left icon-2x icon-border"></i></li>
				      <li><i class="icon-angle-right icon-2x icon-border"></i></li>
				      <li><i class="icon-angle-up icon-2x icon-border"></i></li>
				      <li><i class="icon-angle-down icon-2x icon-border"></i></li>
				      <li><i class="icon-arrow-down icon-2x icon-border"></i></li>
				      <li><i class="icon-arrow-left icon-2x icon-border"></i></li>
				      <li><i class="icon-arrow-right icon-2x icon-border"></i></li>
				      <li><i class="icon-arrow-up icon-2x icon-border"></i></li>
				      <li><i class="icon-caret-down icon-2x icon-border"></i></li>
				      <li><i class="icon-caret-left icon-2x icon-border"></i></li>
				      <li><i class="icon-caret-right icon-2x icon-border"></i></li>
				      <li><i class="icon-caret-up icon-2x icon-border"></i></li>
				      <li><i class="icon-chevron-down icon-2x icon-border"></i></li>
				      <li><i class="icon-chevron-left icon-2x icon-border"></i></li>
				      <li><i class="icon-chevron-right icon-2x icon-border"></i></li>
				      <li><i class="icon-chevron-up icon-2x icon-border"></i></li>
				      <li><i class="icon-circle-arrow-down icon-2x icon-border"></i></li>
				      <li><i class="icon-circle-arrow-left icon-2x icon-border"></i></li>
				      <li><i class="icon-circle-arrow-right icon-2x icon-border"></i></li>
				      <li><i class="icon-circle-arrow-up icon-2x icon-border"></i></li>
				      <li><i class="icon-double-angle-left icon-2x icon-border"></i></li>
				      <li><i class="icon-double-angle-right icon-2x icon-border"></i></li>
				      <li><i class="icon-double-angle-up icon-2x icon-border"></i></li>
				      <li><i class="icon-double-angle-down icon-2x icon-border"></i></li>
				      <li><i class="icon-hand-down icon-2x icon-border"></i></li>
				      <li><i class="icon-hand-left icon-2x icon-border"></i></li>
				      <li><i class="icon-hand-right icon-2x icon-border"></i></li>
				      <li><i class="icon-hand-up icon-2x icon-border"></i></li>
				      <li><i class="icon-circle icon-2x icon-border"></i></li>
				      <li><i class="icon-circle-blank icon-2x icon-border"></i></li>

				      <li><i class="icon-play-circle icon-2x icon-border"></i></li>
				      <li><i class="icon-play icon-2x icon-border"></i></li>
				      <li><i class="icon-pause icon-2x icon-border"></i></li>
				      <li><i class="icon-stop icon-2x icon-border"></i></li>
				      <li><i class="icon-step-backward icon-2x icon-border"></i></li>
				      <li><i class="icon-fast-backward icon-2x icon-border"></i></li>
				      <li><i class="icon-backward icon-2x icon-border"></i></li>
				      <li><i class="icon-forward icon-2x icon-border"></i></li>
				      <li><i class="icon-fast-forward icon-2x icon-border"></i></li>
				      <li><i class="icon-step-forward icon-2x icon-border"></i></li>
				      <li><i class="icon-eject icon-2x icon-border"></i></li>
				      <li><i class="icon-fullscreen icon-2x icon-border"></i></li>
				      <li><i class="icon-resize-full icon-2x icon-border"></i></li>
				      <li><i class="icon-resize-small icon-2x icon-border"></i></li>
      
				      <li><i class="icon-phone icon-2x icon-border"></i></li>
				      <li><i class="icon-phone-sign icon-2x icon-border"></i></li>
				      <li><i class="icon-facebook icon-2x icon-border"></i></li>
				      <li><i class="icon-facebook-sign icon-2x icon-border"></i></li>
				      <li><i class="icon-twitter icon-2x icon-border"></i></li>
				      <li><i class="icon-twitter-sign icon-2x icon-border"></i></li>
				      <li><i class="icon-github icon-2x icon-border"></i></li>
				      <li><i class="icon-github-alt icon-2x icon-border"></i></li>
				      <li><i class="icon-github-sign icon-2x icon-border"></i></li>
				      <li><i class="icon-linkedin icon-2x icon-border"></i></li>
				      <li><i class="icon-linkedin-sign icon-2x icon-border"></i></li>
				      <li><i class="icon-pinterest icon-2x icon-border"></i></li>
				      <li><i class="icon-pinterest-sign icon-2x icon-border"></i></li>
				      <li><i class="icon-google-plus icon-2x icon-border"></i></li>
				      <li><i class="icon-google-plus-sign icon-2x icon-border"></i></li>
				      <li><i class="icon-sign-blank icon-2x icon-border"></i></li>
				      		      
					  <li><i class="icon-ambulance icon-2x icon-border"></i></li>
					  <li><i class="icon-beaker icon-2x icon-border"></i></li>
					  <li><i class="icon-h-sign icon-2x icon-border"></i></li>
					  <li><i class="icon-hospital icon-2x icon-border"></i></li>
					  <li><i class="icon-medkit icon-2x icon-border"></i></li>
					  <li><i class="icon-plus-sign-alt icon-2x icon-border"></i></li>
					  <li><i class="icon-stethoscope icon-2x icon-border"></i></li>
					  <li><i class="icon-user-md icon-2x icon-border"></i></li>
				      
				    </ul>
              </div><!-- /btn-group -->

	</div>
	</div>
	
		<div class="control-group">
	<label class="control-label">Description</label>
	<div class="controls"><textarea name="description" id="description" rows="6" class="span12">#HTMLEditFormat(subtype.getDescription())#</textarea></div>
	</div>
		
		<div class="control-group hasSummaryContainer">
		<div class="span4">
			<label class="control-label">Show "Summary" field when editing?</label>
			<div class="controls">
			<label class="radio inline"><input name="hasSummary" type="radio" class="radio inline" value="1"<cfif subType.gethasSummary() eq 1 >Checked</cfif>>Yes</label>
			<label class="radio inline"><input name="hasSummary" type="radio" class="radio inline" value="0"<cfif subType.gethasSummary() eq 0 >Checked</cfif>>No</label>
			</div>
		</div>
	
	<div class="span4 hasBodyContainer">
		<label class="control-label">Show "Body" field when editing?</label>
		<div class="controls"> 
			<label class="radio inline"><input name="hasBody" type="radio" class="radio inline" value="1"<cfif subType.gethasBody() eq 1 >Checked</cfif>>Yes</label>
			<label class="radio inline"><input name="hasBody" type="radio" class="radio inline" value="0"<cfif subType.gethasBody() eq 0 >Checked</cfif>>No</label>
		</div>
	</div>
	
	<div class="span4">
			<label class="control-label">Status</label>
			<div class="controls">
					<label class="radio inline"><input name="isActive" type="radio" class="radio inline" value="1"<cfif subType.getIsActive() eq 1 >Checked</cfif>>Active</label>
				<label class="radio inline"><input name="isActive" type="radio" class="radio inline" value="0"<cfif subType.getIsActive() eq 0 >Checked</cfif>>Inactive</label>
			</div>
		</div>
</div>
	
		<cfset rsSubTypes=application.classExtensionManager.getSubTypes(siteID=rc.siteID,activeOnly=true) />
		<div class="control-group">
			<div class="span6 availableSubTypesContainer" >
			<label class="control-label">Allow users to add only specific subtypes?</label>
			<div class="controls"> 
				<label class="radio inline" ><input name="hasAvailableSubTypes" type="radio" class="radio inline" value="1" <cfif len(subType.getAvailableSubTypes())>checked </cfif>
				onclick="javascript:toggleDisplay2('rg',true);">Yes</label>
				<label class="radio inline"><input name="hasAvailableSubTypes" type="radio" class="radio inline" value="0" <cfif not len(subType.getAvailableSubtypes())>checked </cfif>
				onclick="javascript:toggleDisplay2('rg',false);">No</label>
			</div>
			<div class="controls" id="rg"<cfif not len(subType.getAvailableSubTypes())> style="display:none;"</cfif>>
				<select name="availableSubTypes" size="8" multiple="multiple" class="multiSelect" id="availableSubTypes">
				<cfloop list="Page,Folder,Calendar,Gallery,File,Link" index="i">
					<option value="#i#/Default" <cfif listFindNoCase(subType.getAvailableSubTypes(),'#i#/Default')> selected</cfif>>#i#/Default</option>
					<cfquery name="rsItemTypes" dbtype="query">
					select * from rsSubTypes where lower(type)='#lcase(i)#' and lower(subtype) != 'default'
					</cfquery>
					<cfset _AvailableSubTypes=subType.getAvailableSubTypes()>
					<cfloop query="rsItemTypes">
					<option value="#i#/#rsItemTypes.subType#" <cfif listFindNoCase(_AvailableSubTypes,'#i#/#rsItemTypes.subType#')> selected</cfif>>#i#/#rsItemTypes.subType#</option>
					</cfloop>
				</cfloop>
				</select>			
			</div>
		</div>
	
	<div class="form-actions">
	<cfif not len(rc.subTypeID)>
		<input type="button" class="btn" onclick="submitForm(document.forms.subTypeFrm,'add');" value="Add" />
		<input type=hidden name="subTypeID" value="#createuuid()#">
	<cfelse>
		<input type="button" class="btn" onclick="submitForm(document.forms.subTypeFrm,'delete','Delete Class Extension?');" value="Delete" />
		<input type="button" class="btn" onclick="submitForm(document.forms.subTypeFrm,'update');" value="Update" />
		<input type=hidden name="subTypeID" value="#subType.getsubtypeID()#">
	</cfif>
	</div>

<input type="hidden" name="action" value="">
<input name="muraAction" value="cExtend.updateSubType" type="hidden">
<input name="siteID" value="#HTMLEditFormat(rc.siteid)#" type="hidden">
<input type="hidden" name="baseTable" value="#subType.getBaseTable()#"/>
<input type="hidden" name="baseKeyField" value="#subType.getBaseKeyField()#" />
<input type="hidden" name="type" value="#subType.getType()#"/>
<input type="hidden" name="dataTable" value="#subType.getDataTable()#" />

</form>

<script>
extendManager.setBaseInfo(jQuery('##typeSelector').val());
</script>
</cfoutput>
