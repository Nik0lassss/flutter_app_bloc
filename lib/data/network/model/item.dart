class SiteItem {
  String _site_state;
  String _icon_url;
  String _site_url;
  String _name;

  SiteItem(this._site_state, this._icon_url, this._site_url, this._name);

  String get name => _name;

  String get site_url => _site_url;

  String get icon_url => _icon_url;

  String get site_state => _site_state;
}
