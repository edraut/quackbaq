function getActualLinkTarget(alleged_link_target){
	if (alleged_link_target.is('a')){
		return alleged_link_target;
	} else {
		return alleged_link_target.parents('a');
	}
}
