component extends='core.mura.cfobject' {
  
  
  public void function onApplicationLoad() {
    //  ==================== START LINK / OSM ==================== 
    local.subType = application.configBean.getClassExtensionManager().getSubTypeBean();
    local.subType.setType('Link');
    local.subType.setSubtype('OpenStreetMap');
    local.subType.setSiteId('praxisgemeinschaft');
    local.subType.load();

    local.subType.setIconClass('mi-map');
    local.subType.setHasAssocFile(0);
    local.subType.setHasSummary(0);
    local.subType.setHasBody(0);
    local.subType.setBaseTable('tcontent');
    local.subType.setBaseKeyField('contentHistId');
    local.subType.save();
  }  
}