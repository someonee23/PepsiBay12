SUBSYSTEM_DEF(misc)
	name = "Early Initialization"
	init_order = SS_INIT_MISC
	flags = SS_NO_FIRE

/datum/controller/subsystem/misc/Initialize()
	if(config.generate_map)
		GLOB.using_map.perform_map_generation()

	//creates pipe categories for pipe dispensers
	initialize_pipe_datum_category_list()

	// Create robolimbs for chargen.
	populate_robolimb_list()

	GLOB.syndicate_code_phrase = generate_code_phrase()
	GLOB.code_phrase_highlight_rule = generate_code_regex(GLOB.syndicate_code_phrase, @"\u0430-\u0451") // Russian chars only
	GLOB.syndicate_code_response = generate_code_phrase()
	GLOB.code_response_highlight_rule = generate_code_regex(GLOB.syndicate_code_response, @"\u0430-\u0451") // Russian chars only

	setupgenetics()

	transfer_controller = new
	. = ..()
