component {
  /**
   * check if content is on display, else => redirect on 404
   */
  public void function isOnDisplay(required component bean){
    var isOnDisplay = arguments.bean.getIsOnDisplay();
    var urlTitle    = arguments.bean.get('urlTitle');
    
    if (!isOnDisplay){
      cfheader(statuscode="404", statustext="Not Found");
      location(url="/404/", addtoken=false, statusCode="301");
    }

    if (urlTitle == "404") cfheader(statuscode="404", statustext="Not Found");
  }
}