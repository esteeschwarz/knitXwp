function wp_insert_attachment( $args, $file = false, $parent_post_id = 0, $wp_error = false, $fire_after_hooks = true ) {
	$defaults = array(
		'file'        => $file,
		'post_parent' => 0,
	);

	$data = wp_parse_args( $args, $defaults );

	if ( ! empty( $parent_post_id ) ) {
		$data['post_parent'] = $parent_post_id;
	}

	$data['post_type'] = 'attachment';

	return wp_insert_post( $data, $wp_error, $fire_after_hooks );
}

arg: 5.
.postForm(curl, .opts, .params, style)
4.
postForm(url, .opts = .defaultOpts, style = "POST", curl = .curl)
