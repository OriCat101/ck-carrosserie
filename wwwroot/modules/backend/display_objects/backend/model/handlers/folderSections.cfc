component extends='core.mura.cfobject' {
  
  
  public void function onApplicationLoad() {
    //  ==================== START FOLDER / SECTIONS ==================== 
    local.subType = application.configBean.getClassExtensionManager().getSubTypeBean();
    local.subType.setType('Folder');
    local.subType.setSubtype('Sections');
    local.subType.setSiteId('praxisgemeinschaft');
    local.subType.load();

    local.subType.setIconClass('mi-folder-open-o');
    local.subType.setHasAssocFile(0);
    local.subType.setHasSummary(0);
    local.subType.setHasBody(0);
    local.subType.setAvailableSubtypes('Page/Default,Folder/Links,Link/OpenStreetMap');
    local.subType.setBaseTable('tcontent');
    local.subType.setBaseKeyField('contentHistId');
    local.subType.save();
    //  ==================== END FOLDER / SECTIONS ==================== 
  }

  // mura event 
  public void function onAfterFolderSectionsSave() {
    cfparam(name="request.onBeforeFolderSectionsSave", default=true);
    if (request.onBeforeFolderSectionsSave) {
      request.onBeforeFolderSectionsSave = false;
      local.remoteId = "#lCase(m.content().getParent().get('contentid'))#-features";
      local.content = m.getBean('content').loadBy(contentid = form.contentid, siteid  = m.event('siteid'));
  
      local.content.setType('Folder');
      local.content.setSubtype('Sections');
      local.content.setParentID(local.content.getParentID());
      local.content.setTitle('Features');
      local.content.setRemoteId(local.remoteId);
      local.content.setIsNav(0);
      local.content.setDisplay(0);
      local.content.setMenuTitle('');
      local.content.setHTMLTitle('');
      local.content.setURLTitle('');
      local.content.save();	
    }
  }
}