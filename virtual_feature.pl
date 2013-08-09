# Defines functions for this feature

require 'virtualmin-iframe-lib.pl';

# feature_name()
# Returns a short name for this feature
sub feature_name
{
return $text{'feat_name'};
}

# Called by Cloudmin
sub plugin_desc
{
return &feature_name();
}

# theme_sections()
# If defined, should return a list of extra sections to be displayed (typically
# on the right-hand frame) of a theme. Each must be a hash ref containing the
# keys 'title' (section heading), 'html' (contents of the section) and
# 'status' (open or not by default). It can also contain 'for_master',
# 'for_reseller' and 'for_owner' flags, indicating if the section should be
# visible to master admins, resellers and domain owners.
sub theme_sections
{
if (!$config{'url'}) {
	return ( );
	}
local $html = "<iframe src='$config{'url'}' width=$config{'width'} height=$config{'height'}></iframe>";
return ( { 'name' => $module_name,
	   'title' => $config{'title'},
	   'html' => $html,
	   'status' => 1,
	   'for_master' => 1 } );
}

1;

