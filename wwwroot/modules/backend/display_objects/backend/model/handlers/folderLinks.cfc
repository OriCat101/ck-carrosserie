component extends='core.mura.cfobject' {
  
  
  public void function onApplicationLoad() {
    //  ==================== START FOLDER / LINKS ==================== 
    local.subType = application.configBean.getClassExtensionManager().getSubTypeBean();
    local.subType.setType('Folder');
    local.subType.setSubtype('Links');
    local.subType.setSiteId('praxisgemeinschaft');
    local.subType.load();

    local.subType.setIconClass('mi-folder-open-o');
    local.subType.setHasAssocFile(0);
    local.subType.setHasSummary(0);
    local.subType.setHasBody(0);
    local.subType.setAvailableSubtypes('Link/Default');
    local.subType.setBaseTable('tcontent');
    local.subType.setBaseKeyField('contentHistId');
    local.subType.save();
    //  ==================== END FOLDER / LINKS ==================== 
  }

  // mura event 
  public void function onAfterFolderLinksSave() {
    cfparam(name="request.onBeforeFolderLinksSave", default=true);
    if (request.onBeforeFolderLinksSave) {
      request.onBeforeFolderLinksSave = false;
      local.remoteId = "#lCase(m.content().getParent().get('remoteId'))#-links";
      local.content = m.getBean('content').loadBy(contentid = form.contentid, siteid  = m.event('siteid'));
  
      local.content.setType('Folder');
      local.content.setSubtype('Links');
      local.content.setParentID(local.content.getParentID());
      local.content.setTitle(local.content.getTitle());
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